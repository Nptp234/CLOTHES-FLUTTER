import 'package:clothes_app/elementes/alert_popup.dart';
import 'package:clothes_app/menus/bottom_menu.dart';
import 'package:clothes_app/objects/user.dart';
import 'package:clothes_app/screens/home.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserActionContext{
  late UserActionStrategy _strategy;
  UserAcount user;
  UserActionContext({required this.user});

  void setContext(UserActionStrategy context){
    _strategy = context;
  }

  void doSignIn(BuildContext context){
    _strategy.signInUser(context, user);
  }
  void doSignUp(BuildContext context){
    _strategy.signUpUser(context, user);
  } 
  void doLogOut(BuildContext context){
    _strategy.logOutUser(context);
  }

}

abstract class UserActionStrategy{
  Future<void> signInUser(BuildContext context, UserAcount user);
  Future<void> signUpUser(BuildContext context, UserAcount user);
  Future<void> logOutUser(BuildContext context);
}

class EmailAuthStrategy extends UserActionStrategy{
  @override
  Future<void> logOutUser(BuildContext context) {
    // TODO: implement logOutUser
    throw UnimplementedError();
  }

  @override
  Future<void> signInUser(BuildContext context, UserAcount user) {
    // TODO: implement signInUser
    throw UnimplementedError();
  }

  @override
  Future<void> signUpUser(BuildContext context, UserAcount user) async{
    try {
        //sign in
        // ignore: unused_local_variable
        // final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        //   email: user.email,
        //   password: user.password,
        // );

        //set current user
        UserAcount userCurrent = UserAcount();
        userCurrent.name =  user.name;
        userCurrent.password = user.password;
        userCurrent.email = user.email;

        //go home page
        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => BottomMenu(child: HomePage())),
        );
        
    }
    on PlatformException catch (e) {
      AlertPopup.ShowAlertPopup(context, e.code, e.message as String);
    }
    catch (e){
      AlertPopup.ShowAlertPopup(context, 'Error some where!', 'Error!');
    }
  }

}