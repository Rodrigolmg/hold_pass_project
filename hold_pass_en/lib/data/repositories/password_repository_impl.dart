
import 'package:get_it/get_it.dart';
import 'package:hold_pass_en/data/models/password_model.dart';
import 'package:hold_pass_en/domain/entities/password.dart';
import 'package:hold_pass_en/domain/repositories/password_repository.dart';
import 'package:hold_pass_en/core/util/pass_type.dart';
import 'package:sembast/sembast.dart';

class PasswordRepositoryImpl implements PasswordRepository {

  static const String passwordStore = 'password_store';
  final _passwordStore = intMapStoreFactory.store(passwordStore);

  final _db = GetIt.I.getAsync<Database>();

  @override
  Future<void> delete(PasswordModel passToDelete) async {
    _passwordStore.record(passToDelete.id!).delete(await _db);
  }

  @override
  Future<List<Password>> getPasswords(PassType passType) async {
    final finder = Finder(filter: Filter.equals('passType', passType.valueNum),
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

  @override
  Future<void> insert(PasswordModel passToRegister) async {
    _passwordStore.add(await _db, passToRegister.toJson());
  }

  @override
  Future<void> update(PasswordModel passToUpdate) async {
    await _passwordStore.record(passToUpdate.id!)
        .update(await _db, passToUpdate.toJson());
  }

}