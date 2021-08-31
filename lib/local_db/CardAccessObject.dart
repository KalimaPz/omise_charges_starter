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
    print(recordSnapshot.length); // last index

    await _ownedCardFolder.add(
        await _db, card.toJson(id: recordSnapshot.length + 1));
    print('OwnedCard Inserted successfully !!');
  }

  Future updateOwnedCard(OwnCard card) async {
    // final finder = Finder(filter: Filter.byKey(card.rollNo));
    // await _ownedCardFolder.update(await _db, card.toJson(), finder: finder);
  }
  Future setDefaultCard(OwnCard card, bool value) async {
    final finder = Finder(filter: Filter.byKey(card.cardId));
    await _ownedCardFolder.update(await _db, {"isDefault": value},
        finder: finder);
    print("set default");
  }

  Future delete(OwnCard card) async {
    print("delete key  : ${card.cardId}");
    print(card.toJson());
    final finder = Finder(filter: Filter.byKey(card.cardId));
    await _ownedCardFolder.delete(await _db, finder: finder);
    print("delete complete");
  }

  Future clear() async {
    await _ownedCardFolder.drop(await _db);
  }

  Future<List<OwnCard>> getAllCards() async {
    final recordSnapshot = await _ownedCardFolder.find(await _db);
    return recordSnapshot.map((snapshot) {
      final ownedCard = OwnCard.fromJson(snapshot.value);

      return ownedCard;
    }).toList();
  }
}
