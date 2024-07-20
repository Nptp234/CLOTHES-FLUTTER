import 'dart:ui';

import 'package:clothes_app/API/api_category.dart';
import 'package:clothes_app/elementes/alert_popup.dart';
import 'package:clothes_app/elementes/title_seeall.dart';
import 'package:clothes_app/objects/category.dart';
import 'package:clothes_app/screens/category_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TypeItemList extends StatelessWidget{

  TypeItemList({super.key, this.title});

  String? title;

  CategoryAPI categoryAPI = CategoryAPI();


  Future<List<Category>> _getListCategory() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<Category> lstCategory = await categoryAPI.getListCategory(sharedPreferences.getString('token').toString());
    return lstCategory;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
      future: _getListCategory(), 
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Container(margin: EdgeInsets.only(top: 50), child: Center(child: CircularProgressIndicator(),),);
        }else{
          return Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 0, right: 0),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,

              children: [
                //title
                //if title != '' then 
                title!.length!=0?
                //if true
                Text(title!, style: TextStyle(fontSize: 20, color:Colors.black, fontWeight: FontWeight.bold),)
                :
                //if false
                SizedBox(width: 0,),
                
                //list
                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    shrinkWrap: true,
                    
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),

                        child: TypeItemItem(iconData: snapshot.data![index].iconData!, title: snapshot.data![index].TenLSP!, cateName: snapshot.data![index].TenLSP!,),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        }
      }
    );
  }
}

class TypeItemItem extends StatelessWidget{

  TypeItemItem({super.key, required this.iconData, required this.title, required this.cateName});

  String iconData, title;
  String cateName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: () {
        // AlertPopup(title: title, content: title);
        // AlertPopup.ShowAlertPopup(context, title, title);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CategorySearchScreen(cateName: cateName,)),
        );
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
