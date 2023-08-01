import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session7_code/screens/screen1/screen1.dart';
import 'package:session7_code/shared/cubits/counter_cubit.dart';

void main() {



  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        home: Screen1(),
      ),
    );
  }
}



