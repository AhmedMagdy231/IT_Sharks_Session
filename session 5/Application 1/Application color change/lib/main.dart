import 'dart:math';

import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  int index = 0;

  List<Color> myColors = [
    Colors.grey,
    Colors.red,
    Colors.orange,
    Colors.green,
  ];
  List<String> myTexts =[
    'grey',
    'red',
    'orange',
    'green'
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('My App'),
        centerTitle: true,
        backgroundColor: myColors[index],

      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              myTexts[index],
              style: TextStyle(
                fontSize: 30,
                color: myColors[index],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 250,
              width: 250,
              color: myColors[index],
            ),
            SizedBox(height: 40,),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  Random rand = Random();
                  index = rand.nextInt(myColors.length);
                  print(index);
                });
              },
              child:  Text('Change Color'),
            ),

          ],
        ),
      ),
    );
  }
}
