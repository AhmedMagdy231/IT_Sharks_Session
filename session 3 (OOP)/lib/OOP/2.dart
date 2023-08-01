void main(){
  Human person = Human();
  person.read();
  person.walk();
}




class Human
{
 

  String? name;
  int? age;
  bool? isMale;
  double? height;
  double? weight;
   
  void run() {
    print('this person is runing');
  }

  void read() {
    print('this person is reading');
  }

  void walk() {
    print('this person is walking');
  }

}
