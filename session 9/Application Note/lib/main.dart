import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session_4/Screens/Home%20Screen/home_screens.dart';
import 'package:session_4/cubit/app_cubit.dart';
import 'package:session_4/data/database.dart';


void main() async {
  //wait untill sqflite is intialized
  WidgetsFlutterBinding.ensureInitialized();
  await MyDatabase.initializeDatabase();

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}







