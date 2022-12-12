import 'dart:io';

import 'package:dr_magz/utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:core';

class UserModel {
  late String userName;
  late String userEmail;
  late String userPic;
  late String userPass;
  late UrlType urlType;
  UserModel(
      {required this.userName,
      required this.userEmail,
      required this.userPic,
      required this.urlType,
      required this.userPass});

  Map<String, dynamic> toMap() {
    // used when inserting data to the database
    return <String, dynamic>{
      "userName": userName,
      "userEmail": userEmail,
      "userPic": userPic,
      "urlType": urlType.toString(),
      "userPass": userPass,
    };
  }
}

UserModel user = UserModel(
  userName: defaultUserName,
  userEmail: defaultUserEmail,
  userPass: defaultUserPass,
  userPic: defaultUserPic,
  urlType: UrlType.asset,
);

// UserModel user = UserModel(
//   userName: "Mukhammad Taufiqurrochman",
//   userEmail: "taufiqqurrohman333@gmail.com",
//   userPass: "taufiqqurrohman333@gmail.com",
//   userPic: defaultUserPic,
//   urlType: UrlType.asset,
// );
class UserDbProvider {
  Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory();

    final path = "${directory.path}dr_magz.db";

    return await openDatabase(
        //open the database or create a database if there isn't any
        path,
        version: 1, onCreate: (Database db, int version) async {
      await db.execute("""
          CREATE TABLE User(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name STRING,
          email STRING,
          pass STRING,
          userPic STRING,
          urlType STRING)""");
    });
  }

  Future<int> addItem(UserModel item) async {
    //returns number of items inserted as an integer

    final db = await init(); //open database

    return db.insert(
      "User", item.toMap(), //toMap() function from UserModel
      conflictAlgorithm:
          ConflictAlgorithm.ignore, //ignores conflicts due to duplicate entries
    );
  }

  Future<List<UserModel>> fetchMemos() async {
    //returns the memos as a list (array)

    final db = await init();
    final maps = await db
        .query("User"); //query all the rows in a table as an array of maps

    return List.generate(maps.length, (i) {
      //create a list of memos
      return UserModel(
        userName: maps[i]['name'].toString(),
        userEmail: maps[i]['email'].toString(),
        userPass: maps[i]['pass'].toString(),
        userPic: maps[i]['userPic'].toString(),
        urlType: maps[i]['urlType'] == "UrlType.asset"
            ? UrlType.asset
            : maps[i]['urlType'] == "UrlType.network"
                ? UrlType.network
                : UrlType.file,
      );
    });
  }

  Future<int> deleteMemo(int id) async {
    //returns number of items deleted
    final db = await init();

    int result = await db.delete("User", //table name
        where: "id = ?",
        whereArgs: [id] // use whereArgs to avoid SQL injection
        );

    return result;
  }

  Future<int> updateMemo(int id, UserModel item) async {
    // returns the number of rows updated

    final db = await init();

    int result =
        await db.update("User", item.toMap(), where: "id = ?", whereArgs: [id]);
    return result;
  }
}
