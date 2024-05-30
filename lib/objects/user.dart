class User{

  //singleton
  static final User _instance = User._internal();
  User._internal();
  factory User(){
    return _instance;
  }

  //
  late String name='Admin', email='admin@gmail.com', password='12345678';

  void setUser(String name, String email, String password){
    this.name = name;
    this.email = email;
    this.password = password;
  }



}