import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbUserManager {
  Database _database;

  Future openDb() async {
    if (_database == null) {
      _database = await openDatabase(join(await getDatabasesPath(), " user.db"),
          version: 1, onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE user(id INTEGER PRIMARY KEY autoincrement, token TEXT, user_email TEXT, user_nicename TEXT, user_display_name TEXT)",
        );
      });
    }
  }

  Future<int> insertUser(User user) async {
    await openDb();
    return await _database.insert('user', user.toMap());
  }

  Future<List<User>> getUser() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.query('user');
    return List.generate(maps.length, (i){
      return User(
        token: maps[i]['token'],
        user_email: maps[i]['user_email'],
        user_nicename: maps[i]['user_nicename'],
        user_display_name: maps[i]['user_display_name'],
      );
    });
  }

}

class User {
  int id;
  String token;
  String user_email;
  int user_nicename;
  String user_display_name;

  User({
    this.id,
    this.token,
    this.user_email,
    this.user_nicename,
    this.user_display_name,
  });

  Map<String, dynamic> toMap(){
    return {
      'token' : token,
      'user_email' : user_email,
      'user_nicename' : user_nicename,
      'user_display_name' : user_display_name,
    };
  }
}
