class UserAcount{

  //singleton
  static final UserAcount _instance = UserAcount._internal();
  UserAcount._internal();
  factory UserAcount(){
    return _instance;
  }

  //
  late String name='Admin', email='admin@gmail.com', password='12345678', image='assets/arvarta.png';

  void setUser(String name, String email, String password){
    this.name = name;
    this.email = email;
    this.password = password;
  }

  void setUserImg(String img){
    image=img;
  }



}