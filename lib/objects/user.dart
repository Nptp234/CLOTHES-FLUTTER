class UserAcount{

  //singleton
  // static final UserAcount _instance = UserAcount._internal();
  // UserAcount._internal();
  // factory UserAcount(){
  //   return _instance;
  // }

  String? id='', name='', email='', password='', image='assets/arvarta.png';

  void setUser(String name, String email, String password){
    this.name = name;
    this.email = email;
    this.password = password;
  }

  void setUserImg(String img){
    image=img;
  }

  UserAcount({this.id, this.name, this.email, this.password, this.image});

  UserAcount.fromJson(Map<String, dynamic> e){
    id = e['id'];
    email = e['Email'];
    name = e['Username'];
    password = e['Password'];
  }

  //set data to json
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Email'] = email;
    data['Username'] = name;
    data['Password'] = password;
    return data;
  }



}