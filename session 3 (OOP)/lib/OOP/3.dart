void main(){

  Human person = Human(
    name: 'Ahmed',
    age: 15,
    isMale : true,
    height:  170.32 ,
    weight:68,
  );

   
}


class Human
{
 
  String? name;
  int? age;
  bool? isMale;
  double? height;
  double? weight;

  Human({String? name,int? age,bool? isMale, double? height,double? weight}){
    this.name = name;
    this.age = age;
    this.isMale = isMale;
    this.height=height;
    this.weight = weight;
  } 
  
  // anthor constractor(this.,this.,this.)

  
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
