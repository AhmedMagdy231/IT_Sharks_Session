void main(){

Human person1 = Human(
address: 'DD',
  name: 'ahmed',
  phone:'054326789',
  email :'a@b.c',
  age:  25,

);
print(person1.name);




}


class Human {
  String? name;
  String? address;
  String? phone;
  String? email;
  int? age;
  

  Human({this.address,this.age,this.email,this.name,this.phone});
 

  void read(){
    print("$name reading ");
  }

  void walk(){
    print("$name walking");
  }

}