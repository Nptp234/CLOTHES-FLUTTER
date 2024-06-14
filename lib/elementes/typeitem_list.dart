import 'dart:ui';

import 'package:clothes_app/elementes/alert_popup.dart';
import 'package:clothes_app/elementes/title_seeall.dart';
import 'package:clothes_app/objects/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TypeItemList extends StatelessWidget{

  TypeItemList({super.key});

  List<Category> lstCategory = ListCategory.getList();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 20, right: 20),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,

        children: [
          //title
          const Text('Shop by category', style: TextStyle(fontSize: 20, color:Colors.black, fontWeight: FontWeight.bold),),
          
          //list
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: lstCategory.length,
              shrinkWrap: true,
              
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),

                  child: TypeItemItem(iconData: lstCategory[index].iconData, title: lstCategory[index].TenLSP),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class TypeItemItem extends StatelessWidget{

  TypeItemItem({super.key, required this.iconData, required this.title});

  String iconData, title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: () {
        AlertPopup(title: title, content: title);
        AlertPopup.ShowAlertPopup(context, title, title);
      },

      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          
          children: [

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                
                color: Color(0xFF2B39B9),
              ),
              padding: const EdgeInsets.all(15),

              child: Stack(
                children: [

                  Container(
                    alignment: Alignment.center,
                    width: double.minPositive,
                    height: double.minPositive,
                  ),
                        
                  Image.asset(
                    iconData,
                    color: Colors.white,
                    width: 50,
                  ),
                ],
              ),

            ),

            // const SizedBox(height: 10,),
            // Text(title, style: TextStyle(fontSize: 20, color: Colors.black),)
          ],
        ),
      ),
    );
  }

}
