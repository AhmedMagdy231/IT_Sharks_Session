import 'package:flutter/material.dart';
import 'package:session7_code/shared/cubits/counter_cubit.dart';

import '../screen2/screen2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(
      listener: (context, state) {
        print(state);
        if(state is CounterLoading){
          int result = sum(1, 2);
          print(result);
        }
      },
      builder: (context, state) {
        if(state is CounterLoading){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else {
          var cubit = CounterCubit.get(context);
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('This is Screen1'),
                  TextFormField(
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      hintText: "",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value){

                    },
                  ),

                  TextFormField(
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      hintText: "",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value){

                    },
                  ),
                  Text(
                    '${cubit.counter}',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          cubit.incrementCounter();
                        },
                        child: Text(
                            '+'
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) {
                                  return Screen2();
                                }
                            ),
                          );
                        },
                        child: Text(
                            'Go'
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  int sum(int num1,int num2){
    return num1 + num2;
  }

}
