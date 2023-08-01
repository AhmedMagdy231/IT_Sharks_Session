void main(){

  
}


class Human
{
 
  String? name;
  int? _age;
  bool? isMale;
  double? height;
  double? weight;

  Human({String? name,int? age,bool? isMale, double? height,double? weight}){
    this.name = name;
    this._age = age;
    this.isMale = isMale;
    this.height=height;
    this.weight = weight;
  } 


   
  void setAge(int age){
     if(age > 0 && age >= 18){
       this._age = age;
     }
     else{
      print('Enter valid age');
     }
   }

     int? getAge(){
    return this._age;
   }
   
  
  set age(int? age){
     if(age! > 0 && age >= 18){
       this._age = age;
     }
     else{
      print('Enter valid age');
     }
   }
  

  
 // int? get age =>  _age!;


  






}
