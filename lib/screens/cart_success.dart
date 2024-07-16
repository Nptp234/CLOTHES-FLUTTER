import 'package:clothes_app/menus/bottom_menu.dart';
import 'package:clothes_app/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartSuccess extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),

        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(30),

          child: Column(
            children: [
              Image.asset(
                'assets/success.png',
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 50,),
              Text('Thank you', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),),
              const SizedBox(height: 30,),
              Text('Đơn đặt hàng của bạn sẽ sớm được giao cùng với hóa đơn. Bạn có thể theo dõi việc giao hàng trong phần đặt hàng.',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal, color: Colors.black38), textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50,),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomMenu(child: HomePage())));
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0060FF), 
                  padding: const EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                ),

                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.zero,

                  child: Text('Tiếp tục mua hàng', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
  
}