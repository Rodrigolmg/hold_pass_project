import 'package:hold_pass_en/data/datasources/app_local_database.dart';
import 'package:hold_pass_en/data/models/password_model.dart';
import 'package:hold_pass_en/core/util/pass_type.dart';
import 'package:sembast/sembast.dart';

class PasswordDao {

  static const String passwordStore = 'password_store';
  final _passwordStore = intMapStoreFactory.store(passwordStore);

  Future<Database> get _db async => await AppLocalDatabase.instance.database;

  Future<void> insert(PasswordModel pass) async {
    _passwordStore.add(await _db, pass.toJson());
  }

  Future<Map<String, Object?>?> update(PasswordModel pass) async {
    // final finder = Finder(filter: Filter.equals('id', ));
    return await _passwordStore.record(pass.id!)
        .update(await _db, pass.toJson());
  }

  Future<void> delete(PasswordModel pass) async {
    // final finder = Finder(filter: Filter.equals('id', pass.id));
    _passwordStore.record(pass.id!).delete(await _db);
  }

  Future<List<PasswordModel>> getPasswords(PassType type) async {

    final finder = Finder(filter: Filter.equals('passType', type.valueNum),
        sortOrders: [SortOrder('id')]);

    final recordSnapshots =
      await _passwordStore.find(
      await _db,
      finder: finder
    );

    return recordSnapshots.map((snap) {
      final pass = PasswordModel.fromJson(snap.value);
      pass.id = snap.key;
      return pass;
    }).toList();
  }
}