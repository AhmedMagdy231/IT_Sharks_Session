void main() {

Lion scar = Lion(skinColor: 'black');

}


class Animal {
  int numberOfLimbs = 4;
  String? skinColor;


  Animal({ required this.skinColor});

  void eat(){
    print('eat');
  }

}


class Lion extends Animal{

  Lion({required String skinColor}): super(skinColor: skinColor);


void roar(){
  print('roaring now');
}


}