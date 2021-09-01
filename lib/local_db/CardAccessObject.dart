import 'package:omise_playground/local_db/DatabaseSetup.dart';
import 'package:omise_playground/model/OwnCard.dart';
import 'package:sembast/sembast.dart';

class CardAccessObject {
  static const String folderName = "OwnedCard.db";
  final _ownedCardFolder = intMapStoreFactory.store(folderName);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insertOwnedCard(OwnCard card) async {
    final recordSnapshot =
        await _ownedCardFolder.find(await _db); // find length
    if (recordSnapshot.length <= 0) {
      await _ownedCardFolder.add(await _db, card.toJson(id: 1));
      setDefaultCard(OwnCard(cardId: 1));
    } else {
      print(recordSnapshot.last.value["card_id"].runtimeType);
      int previous = recordSnapshot.last.value["card_id"];

      await _ownedCardFolder.add(await _db, card.toJson(id: previous + 1));
      print("card id => ${recordSnapshot.length + 1}");
      setDefaultCard(OwnCard(cardId: previous + 1));
    }
  }

  Future setDefaultCard(OwnCard card) async {
    var finder = Finder(filter: Filter.notEquals("card_id", card.cardId));
    await _ownedCardFolder.update(await _db, {"isDefault": false},
        finder: finder);
    finder = Finder(filter: Filter.equals("card_id", card.cardId));
    await _ownedCardFolder.update(await _db, {"isDefault": true},
        finder: finder);
    print("set default card done : card id : ${card.cardId}");
  }

  Future<bool> delete(OwnCard card) async {
    // FLOW  ---> DELETE ELEMENT --> SET_LASTEST_ADDED = DEFAULT --> DONE --> return complete
    var finder = Finder(filter: Filter.equals("card_id", card.cardId));
    if (card.isDefault) { // case item is default 
      final res = await _ownedCardFolder.delete(await _db, finder: finder);
      final recordSnapshot = await _ownedCardFolder.find(await _db);
      print("LAST ID");
      print(recordSnapshot.last.value["card_id"]);
      if (res == 1 && res != 0) { 
        await setDefaultCard(OwnCard(cardId: recordSnapshot.last.value["card_id"]));
        return true;
      } else {
        print("selected item has not delete");
        return false;
      }
    } else {
      final res = await _ownedCardFolder.delete(await _db, finder: finder);
      if (res == 1 && res != 0) {
        print("selected item has been delete");
        return true;
      } else {
        print("selected item has not delete");
        return false;
      }
    }
  }

  Future clear() async {
    await _ownedCardFolder.drop(await _db);
  }

  Future<List<OwnCard>> getAllCards() async {
    final recordSnapshot = await _ownedCardFolder.find(await _db);
    return recordSnapshot.map((snapshot) {
      // print(snapshot.value);
      final ownedCard = OwnCard.fromJson(snapshot.value);
      return ownedCard;
    }).toList();
  }
}
