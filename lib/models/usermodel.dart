class ShoppingUserModel {
  String? name;
  String? phone;
  String? email;
  String? password;
  String? uid;


  ShoppingUserModel({this.uid,this.name, this.phone, this.email, this.password});


  ShoppingUserModel.fromJson(Map<String , dynamic> json){
    name=json['name'];
    phone=json['phone'];
    email=json['email'];
    password=json['password'];
    uid=json['uid'];
  }



  Map<String , dynamic> toMap()
  {
    return {
    'name':name,
    'phone':phone,
    'email':email,
    'password':password,
      'uid':uid,

    };
}

}