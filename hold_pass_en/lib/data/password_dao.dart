import 'package:hold_pass_en/data/app_database.dart';
import 'package:hold_pass_en/models/password.dart';
import 'package:hold_pass_en/util/pass_type.dart';
import 'package:sembast/sembast.dart';

class PasswordDao {

  static const String passwordStore = 'passwords';
  final _passwordStore = intMapStoreFactory.store(passwordStore);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(Password pass) async {
    await _passwordStore.add(await _db, pass.toJson());
  }

  Future update(Password pass) async {
    final finder = Finder(filter: Filter.byKey(pass.id));
    await _passwordStore.update(await _db, pass.toJson(), finder: finder);
  }

  Future delete(Password pass) async {
    final finder = Finder(filter: Filter.byKey(pass.id));
    await _passwordStore.delete(await _db, finder: finder);
  }

  Future<List<Password>> getPasswords(PassType type) async {
    final finder = Finder(filter: Filter.equals('pass-type', type.valueNum),
        sortOrders: [SortOrder('id')]);

    final recordSnapshots =
      await _passwordStore.find(
      await _db,
      finder: finder
    );

    return recordSnapshots.map((snap) {
      final pass = Password.fromJson(snap.value);
      pass.id = snap.key;
      return pass;
    }).toList();
  }
}