import 'package:clothes_app/objects/user.dart';
import 'package:clothes_app/screens/account.dart';
import 'package:clothes_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AccountCenter extends StatefulWidget {
  AccountCenter({super.key});
  
  
  @override
  State<AccountCenter> createState() => _AccountCenterState();
  
}

class _AccountCenterState extends State<AccountCenter> {
  
  final scaffoldKey = GlobalKey<ScaffoldState>();
  UserAcount user = UserAcount();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: _headerAccountCenter(),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _listFormFieldCustom('Username', user.name, usernameController),
                    _listFormFieldCustom('Email', user.email, emailController),
                    _listFormFieldCustom('Password', user.password, passwordController),
                  ],
                ),
                
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),

                  child: ElevatedButton(
                    onPressed: (){}, 
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0060FF), 
                      padding: const EdgeInsets.all(10.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    ),
                    child: const SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Update Information ', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.normal),)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        ),
      ),
    );
  }

  Widget _listFormFieldCustom(String title, String hint, TextEditingController input){
    return Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black,),),
                      TextFormField(
                        decoration:  InputDecoration(
                          hintText: hint,
                          focusColor: Colors.white,
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 0), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), topLeft: Radius.circular(20),bottomRight: Radius.circular(20),topRight: Radius.circular(20))),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 0), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), topLeft: Radius.circular(20),bottomRight: Radius.circular(20),topRight: Radius.circular(20))),
                        ),
                        controller: input,

                        onChanged: (value) {
                           
                        },
                      ),
                    ],
                  ),
                );
  }

  PreferredSize _headerAccountCenter(){
    return PreferredSize(
      preferredSize: const Size.fromHeight(250),
      child: Stack(
        children: [
          Container(
            height: 190,
            decoration: const BoxDecoration(
              color: Color(0xFF0060FF),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(65), bottomRight: Radius.circular(65)),
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                    
                  children: [
                    IconButton(
                      onPressed: (){ 
                        Navigator.pop(context);
                      }, 
                      icon: const Icon(Icons.arrow_back, size: 30, color: Colors.white,)
                    ),
                    const SizedBox(
                      width: 310,
                      child: Text('Account Center', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center,),
                    ),
                    
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(user.image),
                      ),
                    ),

                  ],

                ),
              ],
            ),
          ),

        ],
      )
    );
  }
}