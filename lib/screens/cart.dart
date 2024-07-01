import 'package:clothes_app/elementes/list_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget{

  _CartPage createState() => _CartPage();
}

class _CartPage extends State<CartPage>{

  List<String> titles = ['All', 'Pending', 'Delivery', 'Done'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: titles.length,
      child: Scaffold(
        appBar: _headerCustom(context),
      ),
    );
  }

  PreferredSize _headerCustom(BuildContext context){
    return PreferredSize(
      preferredSize: Size.fromHeight(130), 
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF0060FF),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
        ),
        padding: EdgeInsets.only(top: 30, bottom: 20),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 1, child: Text('Cart', style: TextStyle(color: Colors.white, fontSize: 25),),),
              Expanded(
                flex: 1,
                child: TabBar(
                  tabs: titles.map((title) {
                    return Tab(text: title,);
                  }).toList(),
                  labelColor: Colors.white,
                  labelStyle: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  unselectedLabelStyle: TextStyle(fontSize: 15.0),
                  unselectedLabelColor: Color(0xFF5D9AFF),
                  indicatorColor: Colors.white,
                  indicatorWeight: 3.0,
                  dividerColor: Colors.transparent
                )
              ),
            ],
          ),
        ),
      )
    );
  }

}