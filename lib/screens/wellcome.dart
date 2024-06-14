import 'dart:async';

import 'package:clothes_app/screens/signin.dart';
import 'package:flutter/material.dart';

class WellcomeHome extends StatefulWidget{

  _WellcomeHome createState() => _WellcomeHome();
}

class _WellcomeHome extends State<WellcomeHome>{

  int _count = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_count <= 3) {
        setState(() {
          _count++;
        });
      } else {
        _timer!.cancel();
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _count <= 3 ? _wellcomeScreenHeader1() : _wellcomeScreenHeader2(),

      bottomSheet: _count <= 3 ? _wellcomeScreenFooter1() : _wellcomeScreenFooter2(),
    );
  }


  Widget _wellcomeScreenHeader1() {
    return Container(
        width: double.infinity,

        decoration: const BoxDecoration(
          color: Color(0xFF2B39B9),
        ),

        child: Center(
          child: Image.asset(
            'assets/logo.png',
           width: 150,
           height: 150,
           fit: BoxFit.cover,
          ),
        ),
      );
  }

  Widget _wellcomeScreenHeader2() {
    return Container(
        width: double.infinity,

        decoration: const BoxDecoration(
          color: Colors.white,
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                width: 170,
                height: 170,
                fit: BoxFit.cover,
              ),
              // Text('MyClothes', style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),),
            ],
          )
        ),
      );
  }

  Widget _wellcomeScreenFooter1(){
    return Container(
        height: 100,

        decoration: const BoxDecoration(
          color: Color(0xFF2B39B9),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              Text('MyClothes', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
              Text('Fashion App', style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 15, fontWeight: FontWeight.normal),),
              Text('v1.0.0', style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 15, fontWeight: FontWeight.normal),),
            ],
          ),
        ),
      );
  }

  Widget _wellcomeScreenFooter2(){
    return Container(
        height: 200,

        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              ElevatedButton.icon(
                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));}, 
                icon: Icon(Icons.email, color: Colors.white, size: 35,), 
                label: Text('Sign in with MyClothes', style: TextStyle(color: Colors.white, fontSize: 20),),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  backgroundColor: Color(0xFF0060FF),
                  padding: EdgeInsets.only(top: 15, bottom: 15, left: 25, right: 25),
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                    side: BorderSide(width: 1, color: Color(0xFFCACACA))
                  ),
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
                  maximumSize: Size.fromWidth(300)
                ), 
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/google_logo.png', width: 30, height: 30,),
                      Text('Sign in with Google', style: TextStyle(color: Colors.black, fontSize: 20),)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }
  
}