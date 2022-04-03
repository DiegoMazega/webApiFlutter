import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:web_api/database/dao/contact_dao.dart';

/// Function to open a database SQLit from device.
/// The param [databaseName] it's the name from a database to be open.
Future<Database> getDatabase({required String databaseName}) async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContactDao.tableSql);
    },
    version: 1,
  );
}

