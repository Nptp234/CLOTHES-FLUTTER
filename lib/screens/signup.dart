import 'package:clothes_app/data/fire_base/user_action.dart';
import 'package:clothes_app/elementes/checkbox.dart';
import 'package:clothes_app/objects/user.dart';
import 'package:clothes_app/screens/signin.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget{
  SignUp({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  _SignUp createState() => _SignUp();
}

class _SignUp extends State<SignUp>{

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
                    'Lets get started!', 
                    style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
          )
        )
      ),

      body: SingleChildScrollView(
        
        child: Container(
          padding: const EdgeInsets.all(20.0),
          margin: EdgeInsets.only(top: 30),

          // ignore: prefer_const_constructors
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            // ignore: prefer_const_literals_to_create_immutables
            children: [

              //name label input
              Positioned(
                child: TextFormField(
                  controller: widget.nameController,

                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),

                  validator: (value) {
                    if (value==null || value.isEmpty){
                      return 'Please fill up your name!';
                    }
                    return null;
                  },
                ),
              ),
              
              const SizedBox(height: 20,),
              
              //email label input
              Positioned(
                child: TextFormField(
                  controller: widget.emailController,

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
                  controller: widget.passController,
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
              
              //accept term and condition
              // ignore: prefer_const_constructors
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,

                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  CheckBox(
                    onChanged: (isChecked) {
                      setState(() {
                        CheckBox.isCheck = isChecked;
                      });
                    },
                  ),

                  const Text(
                    'Agree with Terms & Condition',
                    style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),

              const SizedBox(height: 30,),

              //sign in button
              SizedBox(
                width: MediaQuery.of(context).size.width,

                child: ElevatedButton(
                  onPressed: CheckBox.isCheck ? (){
                    EmailAuthStrategy strategy = EmailAuthStrategy();
                    UserAcount userAcount = UserAcount();
                    userAcount.setUser(widget.nameController.text, widget.emailController.text, widget.passController.text);
                    UserActionContext userContext = UserActionContext(user: userAcount);
                    userContext.setContext(strategy);
                    userContext.doSignUp(context);

                  } : null,
                  
                  // ignore: sort_child_properties_last
                  child: const Text('Sign Up', 
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

              SizedBox(
                width: MediaQuery.of(context).size.width,

                // ignore: prefer_const_constructors
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text('Want to sign in?', style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.w400),),
                    const SizedBox(width: 9,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                      },
                      
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFF0060FF),
                              width: 1,
                            )
                          )
                        ),

                        child: const Text(
                          'Sign In', 
                          style: TextStyle(
                            fontSize: 17, 
                            color: Color(0xFF0060FF), 
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
  
}