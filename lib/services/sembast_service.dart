import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class SembastService {
  late Database db;
  late StoreRef store = StoreRef.main();

  // init method
  Future<Database> init() async {
    var dir = await getApplicationDocumentsDirectory();

    // make sure it exists
    await dir.create(recursive: true);

    // build the database path
    var dbPath = join(dir.path, 'my_database.db');

    // open the database
    db = await databaseFactoryIo.openDatabase(dbPath);

    return db;
  }
}
