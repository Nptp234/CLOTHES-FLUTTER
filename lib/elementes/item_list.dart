import 'dart:convert';
import 'dart:ui';

import 'package:clothes_app/data/json/color_js_action.dart';
import 'package:clothes_app/data/json/product_js_action.dart';
import 'package:clothes_app/data/json/size_js_action.dart';
import 'package:clothes_app/elementes/alert_popup.dart';
import 'package:clothes_app/objects/color_pro.dart';
import 'package:clothes_app/objects/product_obj.dart';
import 'package:clothes_app/screens/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ItemList extends StatelessWidget{

  ItemList({this.categoryId, this.title});

  String? title;
  int? categoryId;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        
        children: [
          //title
          Text(title!, style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),),

          //list item
          CustomListProduct(typeId: categoryId,),

          //see all button
          GestureDetector(
            onTap: (){},

            child: Container(
              width: 100,
              height: 50,
              padding: EdgeInsets.all(5),

              decoration: const BoxDecoration(
                color: Color(0xFF0060FF),
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),

              child: Center(child: Text('See all', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),),
            ),
          )
        ],
      ),
    );
  }

}

class CustomListProduct extends StatefulWidget{
  
  int? typeId;
  CustomListProduct({this.typeId});
  
  _CustomListProduct createState() => _CustomListProduct();
}

class _CustomListProduct extends State<CustomListProduct>{

  List<Product> products = [];

  // Product product = Product();
  ProductJSAction productJSAction = ProductJSAction();
  ColorJSAction colorJSAction = ColorJSAction();
  SizeJSAction sizeJSAction = SizeJSAction();

  _loadProductLst() async{
    productJSAction.loadProductLst().whenComplete(() {
      setState(() {
        products = productJSAction.getListProduct();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _loadProductLst();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 450,
      padding: EdgeInsets.only(top: 10, bottom: 10),

      child: ListView.builder(
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,

        itemBuilder: 
        products.isNotEmpty ?
        (BuildContext context, int index){
          return _CustomItem(products[index]);
        }
        :
        (BuildContext context, int index){
          return null;
        }
      ),
    );
  }

  Widget _CustomItem(Product product){

    return GestureDetector(
      onTap: (){
        //get list
        // List<int> idColorLst = [];
        // List<int> idSizeLst = [];
        // productJSAction.loadColorIdList(product).whenComplete(() {
        //   idColorLst = productJSAction.getListColorId();

        //   colorJSAction.loadColorProductID(idColorLst).whenComplete(() {
        //     product.lstColor = colorJSAction.getListColorFromId();
        //     Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(product: product,)));
        //   });
        // });

        // productJSAction.loadColorIdList(product).whenComplete(() {
        //   productJSAction.loadSizeIdList(product).whenComplete((){
        //     idColorLst = productJSAction.getListColorId();
        //     idSizeLst = productJSAction.getListSizeId();

        //     colorJSAction.loadColorProductID(idColorLst).whenComplete(() {
        //       sizeJSAction.loadSizeProductID(idSizeLst).whenComplete((){
        //         product.lstColor = colorJSAction.getListColorFromId();
        //         product.lstSize = sizeJSAction.getListSizeFromId();

        //         Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(product: product,)));
        //       });
        //     });
        //   });
        // });

        

        productJSAction.getListVariantsWithCombination(product).whenComplete(() {
          product.cleatVariants();
          product.cleatVariantValues();
          for (var variant in productJSAction.listVariants){
            product.addVariants(variant);
          }
          productJSAction.getListVariantValueWithCombination(product).whenComplete(() {
            for (var value in productJSAction.listVariantValues){
              product.addVariantValue(value);
            }
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(product: product,)));
          });
          
        });
        
      },
      
      child: Container(
        width: 230,
        height: double.infinity,
        margin: EdgeInsets.only(right: 20),

        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            //image stack with like and shop
            _CustomImageStack(product),

            //name and price
            Container(
              width: 230,
              padding: const EdgeInsets.only(left: 10, top: 10),
              
              child: Text(product.name!, style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500), maxLines: 1,),
            ),
            Container(
              width: 230,
              padding: const EdgeInsets.only(left: 10,),
              
              child: Text('${NumberFormat('#,##0').format(product.price!)} VND', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 205, 140, 10), fontWeight: FontWeight.w500), maxLines: 1,),
            ),
          ],
        ),
      ),
    );
    
  }

  Widget _CustomImageStack(Product product){
    return Container(
      width: double.infinity,
      height: 300,

      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),

      child: Stack(
        fit: StackFit.expand,
        children: [
          //image
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),

            child: Image.asset(
              product.imageURL!,
              fit: BoxFit.cover,
            ),
          ),

          //heart and shop
          Positioned(
            top: 5,
            right: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,

              children: [
                Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.only(bottom: 5),
                  child: _CustomIconHeartShop(CupertinoIcons.heart),
                ),
                Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.only(bottom: 5),
                  child: _CustomIconHeartShop(CupertinoIcons.bag),
                ),
              ],
            ),
          ),
          
        ],
      )
    );
  }

  Widget _CustomIconHeartShop(IconData? icon){

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(50)),

      child: Stack(
        fit: StackFit.expand,

        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.black.withOpacity(0.1),),
          ),
          Icon(icon, size: 30, color: Colors.black,),
        ],
      ),
    );
  }

}