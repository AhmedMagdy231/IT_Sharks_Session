import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductScreen(),
    );
  }
}

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Product List'),
      ),
      body: ListView(
        children: [
           buildProductItem(
             image: 'assets/iphone.jpg',
             name: 'iphone 13 pro max',
             description:  'some description..',
             price: 40000,
           ),
          buildProductItem(
            image: 'assets/samsung.jpg',
            name: 'samsung 23 ultra',
            description:  'some description..',
            price: 50000,
          ),
          buildProductItem(
            image: 'assets/iphone.jpg',
            name: 'iphone 13 pro max',
            description:  'some description..',
            price: 40000,
          ),
          buildProductItem(
            image: 'assets/samsung.jpg',
            name: 'samsung 23 ultra',
            description:  'some description..',
            price: 50000,
          ),
          buildProductItem(
            image: 'assets/iphone.jpg',
            name: 'iphone 13 pro max',
            description:  'some description..',
            price: 40000,
          ),
          buildProductItem(
            image: 'assets/samsung.jpg',
            name: 'samsung 23 ultra',
            description:  'some description..',
            price: 50000,
          ),


        ],
      ),

    );
  }

  Container buildProductItem({
    required String image,
    required String name,
    required String description,
    required int price,

}) {
    return Container(
           width: double.infinity,
           height: 150,

           child: Card(
             child: Row(
               children: [
                 Image.asset(image),
                Expanded(
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          description,
                          style: TextStyle(
                            fontSize: 15,

                          ),
                        ),
                        Text(
                          'price $price',
                          style: TextStyle(
                            fontSize: 15,

                          ),
                        ),
                      ],
                    ),
                ),

               ],
             ),
           ),

         );
  }
}



