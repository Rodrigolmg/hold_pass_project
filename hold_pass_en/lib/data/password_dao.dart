import 'package:hold_pass_en/data/app_database.dart';
import 'package:hold_pass_en/models/password.dart';
import 'package:hold_pass_en/util/pass_type.dart';
import 'package:sembast/sembast.dart';

class PasswordDao {

  static const String passwordStore = 'password_store';
  final _passwordStore = intMapStoreFactory.store(passwordStore);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future<void> insert(Password pass) async {
    _passwordStore.add(await _db, pass.toJson());
  }

  Future<Map<String, Object?>?> update(Password pass) async {
    // final finder = Finder(filter: Filter.equals('id', ));
    return await _passwordStore.record(pass.id!).update(await _db, pass.toJson());
  }

  Future<void> delete(Password pass) async {
    // final finder = Finder(filter: Filter.equals('id', pass.id));
    _passwordStore.record(pass.id!).delete(await _db);
  }

  Future<List<Password>> getPasswords(PassType type) async {

    final finder = Finder(filter: Filter.equals('passType', type.valueNum),
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