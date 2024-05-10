import 'package:clothes_app/screens/signin.dart';
import 'package:flutter/material.dart';

class WellcomeHome extends StatelessWidget{
  
  WellcomeHome({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.ltr,

        child: Container(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              
              //logo and title
              Positioned(
                child: Column(
                  children: [
                    //logo
                    Image.asset(
                      'assets/logo1.png',
                      height: 130,
                      width: 130,
                      alignment: Alignment.center,
                    ),

                    //blank space
                    const SizedBox(height: 30,),

                    //title
                    const Text('Add title here!', 
                      style: TextStyle(fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),

                    //blank space
                    const SizedBox(height: 100,),
                  ],
                )
              ),

              //go to signin button
              Positioned(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,

                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 135, 246), 
                      padding: const EdgeInsets.all(10.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0))
                    ),

                    child: const Text('Continue with MyClothes account ?', 
                      style: TextStyle(fontSize: 20.0, color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                )
              ),

            ],
          ),
        ),
      ),
    );
  }
  
}