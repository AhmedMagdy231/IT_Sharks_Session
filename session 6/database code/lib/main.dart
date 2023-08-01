import 'package:flutter/material.dart';
import 'package:session_4/DatabaseHelper.dart';

void main()async {
  //wait untill sqflite is intialized
  WidgetsFlutterBinding.ensureInitialized();

  await DatabaseHelper.intializeDatabase();
  //DatabaseHelper.insertRecord();
   DatabaseHelper.getNotes();
}

