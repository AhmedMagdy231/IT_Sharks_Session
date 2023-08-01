import 'package:session_4/Note.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  static late Database db;

  static Future<void> intializeDatabase()async{
    var databasePath = await getDatabasesPath();
    String finalPath = databasePath+'NotePad.db';
    db = await openDatabase(
      finalPath,
      version: 1,
      onCreate: (database,version)async{
        print("Database Created!!");
         try {
           await database.execute(
             'CREATE TABLE note (id INTEGER PRIMARY KEY, note TEXT NOT NULL, date TEXT NOT NULL)',
           );
           print("Table Created!!");
         }catch(error){
           print(error.toString());
         }
      },
      onOpen: (database){
        db = database;
        print("Database is Opened");
      }
    );
  }

  static void insertRecord({
    required Note note,
})async{
    try {
      int inserted = await db.insert('note', {
        "id": note.id,
        "note": note.note,
        "date": note.date,
      });
      print("$inserted");
    }catch(error){
      print(error.toString());
    }
  }
  static void getNotes()async{
    List<Map<String,dynamic>> data = await db.rawQuery('SELECT * FROM note');
    print(data);
  }
  static Future<void> updateRecord({
    required int id,
    required String note,
    required String date,
})async{
    try {
      await db.rawUpdate(
          'UPDATE note SET note = ?, date = ? WHERE id = ?',
          [note, date, id]
      );
      print("Updated !!");
    }catch(error){
      print(error.toString());
    }
  }
  static Future<void> deleteRecord()async
  {
    try {
      await db.rawDelete(
          'DELETE FROM note WHERE id = ?',
          [0]
      );
      print("Deleted");
    }catch(error){
      print(error.toString());
    }
  }
}