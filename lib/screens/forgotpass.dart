import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget{

  ForgotPassword({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController redopasslController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.ltr,

        child: Container(
          padding: const EdgeInsets.all(20.0),

          // ignore: prefer_const_constructors
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
                    labelText: 'Your Email',
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

              //new password label input
              Positioned(
                child: TextFormField(
                  controller: passController,
                  obscureText: true,

                  decoration: const InputDecoration(
                    labelText: 'New Password',
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

              const SizedBox(height: 20,),

              //confirm pass label input
              Positioned(
                child: TextFormField(
                  controller: redopasslController,
                  obscureText: true,

                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
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

              //sign in button
              SizedBox(
                width: MediaQuery.of(context).size.width,

                child: ElevatedButton(
                  onPressed: (){}, 
                  
                  // ignore: sort_child_properties_last
                  child: const Text('Create New Password', 
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 23),
                  ),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(184, 142, 47, 1.000), 
                    padding: const EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  
}