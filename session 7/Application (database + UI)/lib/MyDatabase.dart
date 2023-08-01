import 'package:sqflite/sqflite.dart';

import 'Myusers.dart';

class MyDatabase{
  static late Database database;
  static List<Users> MyUsers = [];

  static Future<void> initliazeDatabase()async{
     String path = await getDatabasesPath();
     path =  path + 'database.db';

     database = await openDatabase(
       path,
       version: 1,

       onCreate: (database,version)async{
         print('Database is Created');
          await database.execute('CREATE TABLE USERS (id INTEGER PRIMARY KEY,name TEXT, address TEXT, age INTEGER )').then((value){

           print('table is created successfully');

         }).catchError((error){
           print(error.toString());
         });

       },

       onOpen: (datebase){
         print('database is oped');

     },

     );

  }

  static Future<void> insertIntoDatabase({
    required String name,
    required String address,
    required int age,
})async{

    database.rawInsert('INSERT INTO USERS (name,address,age) VALUES (?,?,?)',[name, address, age]).then((value) {
      print('${value} is inserted successfully');
    }).catchError((error){
      print(error.toString());
    });

  }

  static Future<void> getAllData()async{
    database.rawQuery('SELECT * FROM USERS').then((value){

      value.forEach((element) {
        print(element);
        Users user = Users.fromJson(element);
        MyUsers.add(user);

      });



    }).catchError((error){
      print(error.toString());
    });
  }

}


