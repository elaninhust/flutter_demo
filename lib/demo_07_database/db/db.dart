import 'dart:io';
import 'package:flutter_demo/demo_07_database/model/schemas.dart';
import 'package:realm/realm.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

final Realm db = Realm(_DB.config);

class _DB {
  static String name = 'LovingAppDB';

  static get config {
    return Configuration.local([
      LovedApp.schema,
      Tag.schema,
    ], path: dbPath);
  }

  static String get dbPath {
    var path = getDBPath() as String;
    print(path);
    return path;
  }

  static getDBPath() async {
    Directory appDocumentsPath = await getApplicationDocumentsDirectory();

    return join(appDocumentsPath.path, name);
  }
}
