
import 'package:sqflite/sqflite.dart';


class DataBaseHelperMagdy {

  static late Database database;

  static Future<void> createDatabase()async{
    var databasePath = await getDatabasesPath();
    databasePath = databasePath + 'user.db';

     database = await openDatabase(
        databasePath,
       version: 1,
       onCreate: (database,version){
          print('database is created');
          database.execute('CREATE TABLE gym (id INTEGER PRIMARY KEY, name Text, age Text)').then((value){
            print('table is created');
          }).catchError((error){
            print('Something wrong happen ${error.toString()}');
          });
       },
      onOpen: (database){
          print('database is open');
      },
    );
  }

  static void insertDatabase({required String name,required String age})async{

    database.transaction((txn)async{

      txn.rawInsert('INSERT INTO gym (name,age) VALUES (?,?)',[name,age]).then((value){
        print('${value} is inserted successfully');

      }).catchError((error){
        print('Error ${error.toString()}');
      });

      return null;
    }
    );

  }

  static Future<void> getAllDate()async{
   // List<Gym> users = [];
     await database.rawQuery('SELECT * FROM GYM').then((value){
       
       //users =  value.map(Gym.fromMap).toList();

      value.forEach((element) {
       // Gym user = Gym.fromJson(element);
      //  users.add(user);
      });
    });
   //  print(users[0].id);




  }





}