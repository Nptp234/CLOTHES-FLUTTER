import 'package:clothes_app/API/api_auth.dart';
import 'package:clothes_app/menus/bottom_menu.dart';
import 'package:clothes_app/objects/user.dart';
import 'package:clothes_app/screens/forgotpass.dart';
import 'package:clothes_app/screens/home.dart';
import 'package:clothes_app/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatelessWidget{

  SignIn({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  UserAcount user = UserAcount();

  AuthAPI authAPI = AuthAPI();

  login(BuildContext context) async{
    String token = await AuthAPI().signIn(emailController.text, passController.text);
    
    if(token!='fail'){
      Navigator.push(
        context,(
        MaterialPageRoute(builder: (context) => BottomMenu(child: HomePage()))),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(170.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.only(bottom: 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
            boxShadow: [
              BoxShadow(blurRadius: 10.0, color: Color(0xFF0060FF))
            ],
            color: Color(0xFF0060FF),
          ),

          child: const Center(
            child: Text(
                    'Wellcome back!', 
                    style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
          )
        )
      ),

      body: Directionality(
        textDirection: TextDirection.ltr,

        child: Container(
          padding: const EdgeInsets.all(20.0),

          // ignore: prefer_const_constructors
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              // ignore: prefer_const_literals_to_create_immutables
              children: [

                //email label input
                Positioned(
                  child: TextFormField(
                    controller: emailController,

                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),

                    validator: (value) {
                      if (value==null || value.isEmpty){
                        return 'Please fill up your email!';
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(height: 20,),

                //pass label input
                Positioned(
                  child: TextFormField(
                    controller: passController,
                    obscureText: true,

                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),

                    validator: (value) {
                      if (value==null || value.isEmpty){
                        return 'Please fill up your password!';
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(height: 30,),
                
                //forgot password
                SizedBox(
                  width: MediaQuery.of(context).size.width,

                  child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                        },
                        
                        child: const Text(
                            'Forgot Password?', 
                            style: TextStyle(
                              fontSize: 17, 
                              color: Color(0xFF0060FF), 
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.start,
                          ),
                      )
                ),

                const SizedBox(height: 10,),

                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  width: MediaQuery.of(context).size.width,

                  // ignore: prefer_const_constructors
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text('Want to sign up?', style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.w400),),
                      const SizedBox(width: 9,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                        },
                        
                        child: const Text(
                          'Sign Up', 
                          style: TextStyle(
                            fontSize: 17, 
                            color: Color(0xFF0060FF), 
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      )
                    ],
                  ),
                ),

                //sign in button
                SizedBox(
                  width: MediaQuery.of(context).size.width,

                  child: ElevatedButton(
                    onPressed: () async{
                      //go home page
                      await login(context);
                    }, 
                    
                    // ignore: sort_child_properties_last
                    child: const Text('Sign In', 
                      style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 23),
                    ),

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0060FF), 
                      padding: const EdgeInsets.all(10.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                ),

                const SizedBox(height: 30,),
                
                // ignore: avoid_unnecessary_containers
                Stack(
                  alignment: Alignment.center,

                  children: [
                    const Divider(
                      color: Colors.grey, // Màu sắc của đường viền
                      thickness: 1.0,
                    ),

                    Container(
                      padding: const EdgeInsets.all(3),
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: const Text(
                        'Or',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30,),

                ElevatedButton(
                  onPressed: (){},

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255), 
                    padding: const EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
                    elevation: 3,
                  ),

                  // ignore: prefer_const_constructors
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 0.0),
                        child: Image.asset(
                          'assets/google_logo.png',
                          height: 30,
                          width: 30,
                          alignment: Alignment.centerLeft,
                        ),
                      ),

                      const Expanded(
                        child: Text(
                          'Continue with Google',
                          style: TextStyle(fontSize: 17, color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )
                ),

                const SizedBox(height: 50,),

              ],
            ),
          )
        ),
      ),
    );
  }

}