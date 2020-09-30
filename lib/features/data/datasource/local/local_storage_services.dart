import 'dart:async';
import 'dart:io';
import 'package:login/features/data/models/news_model.dart';
import 'package:path/path.dart';
import 'package:localstorage/localstorage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class LocalStorageServices {
  static final LocalStorageServices _baseDataBaseHelper =
      new LocalStorageServices.internal();
  final LocalStorage storage = new LocalStorage('app_data');
  factory LocalStorageServices() => _baseDataBaseHelper;

  LocalStorageServices.internal();
  static Database _database;

  Future<Database> get db async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();

    return _database;
  }

  initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "fam.db");

    var femaleandmoreDB =
        await openDatabase(path, version: 1, onCreate: _onCreate);
    return femaleandmoreDB;
  }

  void _onCreate(Database db, int version) async {
    await db.execute("""CREATE TABLE NEWS(
    id INTEGER PRIMARY KEY,
    title TEXT,
    urlToImage TEXT,
    descrption TEXT
    )""");
  }

  Future<int> insertRemoteNews(List news) async {
    try {
      var database = await db;
      var response = await database.transaction((txn) async {
        for (var i = 0; i < news.length; i++) {
          NewsModel newsArticle = NewsModel();
//          newsArticle.title = news[i]['title'];
//          newsArticle.descrption = news[i]['descrption'];
//          newsArticle.urlToImage = news[i]['urlToImage'];
          try {
            //
          } catch (e) {
            print(e);
          }
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
