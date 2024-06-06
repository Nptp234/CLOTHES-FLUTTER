import 'dart:math';

import 'package:clothes_app/screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ForgotPassword extends StatefulWidget{

  
  _ForgotPassword createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword>{

  _ForgotPassword();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController redopasslController = TextEditingController();

  bool isFilledEmail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(170.0),
        
        child: Stack(
          children: [
             Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignIn()),
                );
              },
              child: Container(
                width: 100,
                height: double.infinity,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
                  color: Color(0xFF0060FF),
                ),

                child: const Positioned(
                    bottom: 10,
                    left: 30,
                    child: Icon(Icons.arrow_back, color: Colors.white, size: 30,),
                  )
                ),
            )
          ],
        )
      ),

      body: Directionality(
        textDirection: TextDirection.ltr,

        child: Container(
          padding: const EdgeInsets.all(20.0),

          // ignore: prefer_const_constructors
          child: SingleChildScrollView(
            child: Center(
              child: isFilledEmail ? 
              _filledEmail()
              : _notFillEmail(),
            ),
          )
        ),
      ),
    );
  }


  Widget _notFillEmail(){
    return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  const Text('Mail address here!', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),),
                  const Text('Please enter the mail address of your account!!', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center,),
                  const SizedBox(height: 10,),
                  Positioned(
                    child: TextFormField(
                      controller: emailController,
                      
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)), borderSide: BorderSide(color: Color(0xFF0060FF), width: 2)),
                        prefixIcon: Icon(Icons.email, size: 30, color: Color(0xFF0060FF),),
                      ),

                      validator: (value) {
                        if (value==null || value.isEmpty){
                          return 'Please fill up your email!';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 50,),
                  _buttonCreatePass(context),
                ],
              );
  }

  Widget _filledEmail(){
    return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Positioned(
                    child: TextFormField(
                      controller: passController,
                      obscureText: true,

                      decoration: const InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                        prefixIcon: Icon(Icons.password, size: 25, color: Color(0xFF0060FF),)
                      ),

                      validator: (value) {
                        if (value==null || value.isEmpty){
                          return 'Please fill up your password!';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Positioned(
                    child: TextFormField(
                      controller: redopasslController,
                      obscureText: true,

                      decoration: const InputDecoration(
                        hintText: 'Redo Password',
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                        prefixIcon: Icon(Icons.password, size: 25, color: Color(0xFF0060FF),)
                      ),

                      validator: (value) {
                        if (value==null || value.isEmpty){
                          return 'Please fill up your password!';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 50,),
                  _buttonCreatePass(context),
                ],
              );
  }


  Widget _buttonCreatePass(BuildContext context){
    return SizedBox(
                    width: MediaQuery.of(context).size.width,

                    child: ElevatedButton(
                      onPressed: (){
                        if (emailController.text.isNotEmpty){
                          setState(() {
                            isFilledEmail = true;
                          });
                        }
                        else{
                          setState(() {
                            isFilledEmail = false;
                          });
                        }
                      }, 
                      
                      // ignore: sort_child_properties_last
                      child: const Text('Create New Password', 
                        style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 23),
                      ),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0060FF), 
                        padding: const EdgeInsets.all(10.0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  );
  }
}