import 'package:omise_playground/local_db/DatabaseSetup.dart';
import 'package:omise_playground/model/OwnCard.dart';
import 'package:sembast/sembast.dart';

class CardAccessObject {
  static const String folderName = "OwnedCard.db";
  final _ownedCardFolder = intMapStoreFactory.store(folderName);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insertOwnedCard(OwnCard card) async {
    await _ownedCardFolder.add(await _db, card.toJson());
    print('OwnedCard Inserted successfully !!');
  }

  Future updateOwnedCard(OwnCard card) async {
    // final finder = Finder(filter: Filter.byKey(card.rollNo));
    // await _ownedCardFolder.update(await _db, card.toJson(), finder: finder);
  }

  Future delete(OwnCard card) async {
    // final finder = Finder(filter: Filter.byKey(card.rollNo));
    // await _ownedCardFolder.delete(await _db, finder: finder);
  }

  Future<List<OwnCard>> getAllCards() async {
    final recordSnapshot = await _ownedCardFolder.find(await _db);
    return recordSnapshot.map((snapshot) {
      final ownedCard = OwnCard.fromJson(snapshot.value);
      return ownedCard;
    }).toList();
    
  }
}
