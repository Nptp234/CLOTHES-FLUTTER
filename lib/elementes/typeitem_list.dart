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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,

        children: [
          TitleSeeAll(title: 'Category',),
          
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          
          children: [

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                
                color: Colors.amberAccent[700]?.withOpacity(0.5),
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
                    color: Colors.black,
                    width: 50,
                  ),
                ],
              ),

            ),

            const SizedBox(height: 10,),

            Text(title, style: TextStyle(fontSize: 20, color: Colors.black),)
          ],
        ),
      ),
    );
  }

}
