import 'package:flutter/material.dart';
import 'package:session_4/MyDatabase.dart';


void main()async {
  //wait untill sqflite is intialized
  WidgetsFlutterBinding.ensureInitialized();
  await MyDatabase.initliazeDatabase();
  MyDatabase.getAllData();

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

   var nameController = TextEditingController();
   var addressController = TextEditingController();
   var ageController = TextEditingController();

   final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(formKey.currentState!.validate()){
            
            MyDatabase.insertIntoDatabase(
                name: nameController.text,
                address: addressController.text,
                age: int.parse(ageController.text),
            );

          }

        },
        child: Icon(Icons.add),
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding:  EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildText(text: 'Name'),
                  SizedBox(height: 20,),
                  buildTextFormField(
                      controller: nameController,
                      hint: 'Enter Your Name',
                      vaild:   (value){
                        if(value!.isEmpty)
                          return 'Please Enter your name';

                      },
                  ),
                  SizedBox(height: 30,),

                  buildText(text: 'Address'),
                  SizedBox(height: 20,),
                  buildTextFormField(
                      controller: addressController,
                      hint: 'Enter Your Address',
                    vaild:  (value){
                      if(value!.isEmpty)
                        return 'Please Enter your address';

                    },
                  ),

                  SizedBox(height: 30,),

                  buildText(text: 'Age'),
                  SizedBox(height: 20,),
                  buildTextFormField(
                      controller: ageController,
                      hint: 'Enter Your Age',
                      vaild:  (value){
                      if(value!.isEmpty)
                        return 'Please Enter your Age';

                    },
                  ),



                ],
              ),
            ),
          ),
        ),
      ),

    );
  }

  TextFormField buildTextFormField({
     required TextEditingController controller,
     required String hint,
    required String? Function(String?) vaild,
}) {
    return TextFormField(
              controller: controller,
              validator: vaild,

              decoration: InputDecoration(
                hintText: hint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),

                ),

              ),
            );
  }

  Text buildText({
     required String text,
}) {
    return Text(
              text,
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            );
  }
}









