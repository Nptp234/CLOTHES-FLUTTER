import 'package:clothes_app/API/api_auth.dart';
import 'package:clothes_app/objects/user.dart';
import 'package:clothes_app/screens/accountCenter.dart';
import 'package:clothes_app/screens/license.dart';
import 'package:clothes_app/screens/settings.dart';
import 'package:clothes_app/screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPage extends StatefulWidget {
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  UserAcount user = UserAcount();

  Future<UserAcount> getUser() async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    user = await AuthAPI().setCurrentUser(sharedPreferences.getString('token').toString(), sharedPreferences.getString('email').toString());
    return user;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserAcount>(
      future: getUser(),
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Container(
            margin: EdgeInsets.only(top: 50),
            child: Center(child: CircularProgressIndicator()),
          );
        }else{
          return Scaffold(
            key: scaffoldKey,
            appBar: _headerAcount(user),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  
                  Column(
                    children: [
                      _titleListCustom('Account Center', 'Password, personal details', Icons.person, AccountCenter()),
                      const SizedBox(height: 20,),
                      _titleListCustom('Settings', 'Display, privacy', Icons.settings, SettingsScreen()),
                      const SizedBox(height: 20,),
                      _titleListCustom('License', 'Policy, Terms of Use', Icons.info, MyLicense()),
                    ],
                  ),
                  
                  
                  Column(
                    children: [
                      _redLineCustom('Sign out of MyClothes', SignIn()),
                      _redLineCustom('Delete account', SignIn()),
                    ],
                  )

                ],
              ),
            ),
          );
        }
      },
    );
  }

  Widget _redLineCustom(String title, Widget page){
    return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page),
                );
              },
              child: Text(title,
              style: TextStyle(
                color: Colors.red,
              ),
              ),
            );
  }

  Widget _titleListCustom(String title, String content, IconData icon, Widget page){
    return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page),
                );
              },
              child: Row(
                children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: Icon(
                      icon,
                      size: 40,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        content,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
  }

  PreferredSize _headerAcount(UserAcount userAcount) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(210),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color(0xFF0060FF),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(65), bottomRight: Radius.circular(65)),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
              SizedBox(
                width: 120,
                height: 120,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/arvarta.png'),
                ),
              ),
              userAcount.name!=null?
              Text(
                userAcount.name!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
              :
              SizedBox(width: 10,),
            ],
          ),
        )
      ),
    );
  }
}
