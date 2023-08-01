


import 'OOP/5.dart';

abstract class Animal {

  String? name;
  int? age;

  Animal({required this.name, required this.age});
  
  // abstract method 
  void makeSound();

  void eat(){
    print('Animal is eating');
  }

}

class Dog extends Animal {

  Dog({required name, required age}): super(name:  name, age: age);
 
  void makeSound(){
    print("$name is barks");
  }


  

}

class Cat extends Animal {

  Cat({required name, required age}): super(name:  name, age: age);

  void makeSound(){
    print("$name is meows meows");
  }

  void eat(){
    print("$name is eating");
  }

  

}

void main() {
  Human person1 = Human(phone: '010',name: 'fdf');
  print(person1.name);
}


class  Human{

  String? name;
  String? phone;


  Human({this.name, this.phone});

 void jump(){
  print('$name jump');
 }
 
 void read(){
  print('$name reading');
 }

}

