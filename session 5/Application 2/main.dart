import 'package:flutter/material.dart';
void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  color: Colors.red,
                ),

                Container(
                  height: 150,
                  width: 150,
                  color: Colors.blue,
                ),

              ],
            ),
            Container(
              width: 350,
              height: 150,
              color: Colors.pink,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  color: Colors.red,

                ),
                Container(
                  width: 150,
                  height: 150,
                  color: Colors.blue,
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}





