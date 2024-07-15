import 'dart:ui';

import 'package:clothes_app/elementes/item_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class LikedPage extends StatefulWidget{
  @override
  State<LikedPage> createState() => _LikedPageState();
}

class _LikedPageState extends State<LikedPage> {
  

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _headerLiked(),
      
      body: Center(
        child: Image(image: AssetImage('assets/imgFiles/Group6567.png'),
        ),
      ),
          
    );
  }

  PreferredSize _headerLiked(){
    return PreferredSize(
      preferredSize: const Size.fromHeight(180),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),

        child: Center(
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
                      icon: const Icon(Icons.arrow_back, size: 30, color: Colors.black,)
                    ),
                    
                  const SizedBox(
                      width: 270,
                      child: Text('Whislist', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center,),
                    ),
                  
                ],
              ),

              Container(
                height: 50,
                padding: EdgeInsets.zero,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Row(
                  children: [
                    Expanded(
                      
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search, size: 30, color: Colors.black,),
                          hintText: 'Search....',
                          focusColor: Colors.white,
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 0), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), topLeft: Radius.circular(20),bottomRight: Radius.circular(20), topRight: Radius.circular(20))),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 0), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), topLeft: Radius.circular(20),bottomRight: Radius.circular(20), topRight: Radius.circular(20))),
                        ),
                        onChanged: (value) {
                          
                        },
                      ),
                    ),
                    
                  ],
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: Row(
                      children: [
                        Text("Newest",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),

                        Icon(Icons.keyboard_arrow_down)
                      ],
                    ),
                  ),

                  SizedBox(width: 30,),
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: Row(
                      children: [
                        Text("Most popular",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),

                      ]
                    ),
                  ),
                  SizedBox(width: 30,),
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: Row(
                      children: [
                        Text("Price",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        SizedBox(width: 5,),
                        Icon(Icons.compare_arrows_rounded)
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}

