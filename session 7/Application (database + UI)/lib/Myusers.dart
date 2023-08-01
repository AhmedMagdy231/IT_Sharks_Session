class Users{
  int? id;
  String? name;
  String? address;
  int? age;

   Users.fromJson(Map<String,dynamic> data){

     id = data['id'];
     name = data['name'];
     address = data['address'];
     age = data['age'];

   }
}