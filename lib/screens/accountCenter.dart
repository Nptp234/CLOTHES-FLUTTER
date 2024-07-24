import 'package:clothes_app/API/api_auth.dart';
import 'package:clothes_app/objects/user.dart';
import 'package:clothes_app/screens/account.dart';
import 'package:clothes_app/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountCenter extends StatefulWidget {
  AccountCenter({super.key});
  
  
  @override
  State<AccountCenter> createState() => _AccountCenterState();
  
}

class _AccountCenterState extends State<AccountCenter> {
  
  final scaffoldKey = GlobalKey<ScaffoldState>();
  UserAcount user = UserAcount();
  AuthAPI authAPI = AuthAPI();

  Future<UserAcount> getUser() async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    user = await AuthAPI().setCurrentUser(sharedPreferences.getString('token').toString(), sharedPreferences.getString('email').toString());

    usernameController.text = user.name!;
    emailController.text = user.email!;
    passwordController.text = user.password!;

    return user;
  }

  bool isUpdated = false;

  Future<bool> updateUser(UserAcount userAcount) async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    isUpdated = await AuthAPI().updateUser(sharedPreferences.getString('token').toString(), userAcount);
    return isUpdated;
  }

  Future<String> changePass(String old, String newp, String id) async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String isChange = await AuthAPI().changePassword(sharedPreferences.getString('token').toString(), old, newp, id);
    return isChange;
  }

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
            appBar: _headerAccountCenter(snapshot.data!, context),

            body: Center(
              child: SingleChildScrollView(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      user.name!=null?
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        
                        children: [
                          _listFormFieldCustom('Username', usernameController),
                          _listFormFieldCustom('Email', emailController),
                          
                          _changePass(context, snapshot.data!.id!)

                        ],
                      ):
                      SizedBox(height: 20, width: double.infinity,child: Text('Null data user!'),),
                      
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),

                        child: ElevatedButton(
                          onPressed: () async{
                            UserAcount userAcount = UserAcount(
                              id: user.id,
                              name: usernameController.text,
                              email: emailController.text,
                              password: passwordController.text
                            );
                            await updateUser(userAcount);
                            if(isUpdated){
                              // Navigator.push(
                              //   contextB,
                              //   MaterialPageRoute(builder: (contextB) => AccountCenter()),
                              // );
                              setState(() {
                                
                              });
                            }
                          }, 
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
                                Text('Cập nhật thông tin tài khoản', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),)
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
      },
    );
  }

  Widget _listFormFieldCustom(String title, TextEditingController input){
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
                        decoration:  const InputDecoration(
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

    Widget _changePass(BuildContext context, String id){
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const BoxDecoration(
        color: Color(0xFF0060FF),
        borderRadius: BorderRadius.all(Radius.circular(50))
      ),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      
      child: Center(
        child: GestureDetector(
          onTap: (){
            QuickAlert.show(
              context: context, 
              type: QuickAlertType.custom,
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  TextFormField(
                    controller: oldPasswordController,
                    decoration: const InputDecoration(
                      hintText: 'OldPassword',
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2)),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: newPasswordController,
                    decoration: const InputDecoration(
                      hintText: 'NewPassword',
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2)),
                    ),
                  ),
                ],
              ),
              onConfirmBtnTap: () async{
                String isChange = await changePass(oldPasswordController.text, newPasswordController.text, id);
                if(isChange=='200'){
                  setState(() {
                    
                  });
                }else{
                  print(isChange);
                }
              },
            );
          },
          child: Text('Đổi mật khẩu', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
        ),
      )
    );
  }

  PreferredSize _headerAccountCenter(UserAcount userAcount, BuildContext context){
    return PreferredSize(
      preferredSize: const Size.fromHeight(290),
      child: Stack(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              color: Color(0xFF0060FF),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(65), bottomRight: Radius.circular(65)),
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

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

                const SizedBox(height: 30,),

                Stack(
                  children: [
                    
                    SizedBox(
                      width: 170,
                      height: 170,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(userAcount.image!),
                      ),
                    ),
                    Container(
                      width: 170,
                      height: 170,
                      decoration: BoxDecoration(
                        border: Border.all(width: 5, color: Colors.white.withOpacity(0.5)),
                        borderRadius: BorderRadius.all(Radius.circular(100))
                      ),

                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            right: 10,
                            child: IconButton(
                              onPressed: () {
                                
                              },
                              icon: Container(
                                padding: EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  color: Color(0xFF0060FF),
                                  borderRadius: BorderRadius.all(Radius.circular(100))
                                ),
                                child: const Icon(Icons.edit, size: 20, color: Colors.white,),
                              )
                            ),
                          )
                        ],
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
