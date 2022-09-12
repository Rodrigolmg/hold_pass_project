import 'dart:async';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class AppLocalDatabase {

  AppLocalDatabase._();

  static final AppLocalDatabase _singleton = AppLocalDatabase._();

  static AppLocalDatabase get instance => _singleton;

  Completer<Database>? _dbOpenCompleter;

  Future<Database> get database async {

    if(_dbOpenCompleter == null){
      _dbOpenCompleter = Completer();
      _openDatabase();
    }

    return _dbOpenCompleter!.future;
  }

  Future _openDatabase() async {

    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocumentDir.path, 'hold.db');
    final database = await databaseFactoryIo.openDatabase(dbPath);

    if(_dbOpenCompleter != null){
      _dbOpenCompleter!.complete(database);
    }
  }
}