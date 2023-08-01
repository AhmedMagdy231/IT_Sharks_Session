void main() {
Lion scar = Lion();
Dog jack = Dog ();
Cat kitty = Cat ();



scar.eat();

}


class Animal {
  int numberOfLimbs = 4;
  String? name;
  void eat(){
    print('eat');
  }

}


class Lion extends Animal{


void roar(){
  print('roaring now');
}


}

class Dog extends Animal{

void bark(){
  print('barking now');
}

}

class Cat extends Animal{

void meo(){
  print('meoing now');
}

}

