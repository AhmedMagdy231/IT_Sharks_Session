import 'package:sqflite/sqflite.dart';


class Database2{

  static late Database database;
  //static List<Users> users = [];


  static Future<void> intializeDatebase()async{
    String path;
    path = await getDatabasesPath();
    path = path + 'test.db';

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (database,version){
        print("Database Created");
        database.execute('CREATE TABLE users  (id INTEGER PRIMARY KEY,name TEXT, age INTEGER, address TEXT )').then((value){
          print("Table User Created");
        }).catchError((error){
          print(error.toString());
        });
      },

      onOpen: (database){
        print('Database is Open');
      }

    );


  }

  static Future<void> insertToDatabase({required String  name, required int age, required String address})async{


    database.rawInsert('INSERT INTO users (name, age, address) VALUES (?,?,?)',[name,age,address]).then((value){

      print('${value} insert successfully');

    }).catchError((error){
      print(error.toString());
    });


  }

  static Future<void> updateDatabase({required String name,required int age,required String address})async{

    database.rawUpdate('UPDATE users SET age = ?, address = ? WHERE name = ?',[age,address,name]).then((value){
      print('${value} is updated successfully');
    }).catchError((error){
      print(error.toString());
    });

  }
  
  static Future<void> getAllDatabase()async{

   await database.rawQuery('SELECT * FROM USERS').then((value){

      value.forEach((element) {
        //Users user = Users.fromJson(element);
        print(element);
       // users.add(user);

      });
    }).catchError((error){
      print(error.toString());
    });
  }


}