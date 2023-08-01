import 'package:flutter/material.dart';
import 'package:session_4/test/test2.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding:  EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(text: 'Name'),
                SizedBox(height: 15,),
                buildTextFormField(
                    controller: nameController,
                    valid: (value){
                      if(value!.isEmpty){
                        return 'Please Enter Your Name';
                      }
                    },
                    hint: 'Enter Your Name'
                ),

                SizedBox(height: 20,),
                buildText(text: 'Address'),
                SizedBox(height: 15,),
                buildTextFormField(
                    controller: addressController,
                    valid: (value){
                      if(value!.isEmpty){
                        return 'Please Enter Your Address';
                      }
                    },
                    hint: 'Enter Your Address'
                ),

                SizedBox(height: 20,),
                buildText(text: 'Age'),
                SizedBox(height: 15,),
                buildTextFormField(
                    controller: ageController,
                    valid: (value){
                      if(value!.isEmpty){
                        return 'Please Enter Your Age';
                      }
                    },
                    hint: 'Enter Your Name'
                ),


                SizedBox(height: 30,),
                Center(
                  child: ElevatedButton(
                    onPressed: (){
                      if(formKey.currentState!.validate()){

                        Database2.insertToDatabase(
                          name: nameController.text,
                          age: int.parse(ageController.text),
                          address: addressController.text,
                        ).then((value){
                          nameController.text = '';
                          ageController.text = '';
                          addressController.text = '';
                        });
                      }
                    },
                    child: Text('Save'),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),


    );
  }

  TextFormField buildTextFormField({
    required controller,
    required String? Function(String?) valid,
    required String hint,
  }) {
    return TextFormField(
      controller: controller,
      validator: valid,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),


    );
  }

  Text buildText({required String text}) => Text(
    text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),);
}