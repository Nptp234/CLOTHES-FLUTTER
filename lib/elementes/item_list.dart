import 'dart:convert';
import 'dart:ui';

import 'package:clothes_app/API/api_product.dart';
import 'package:clothes_app/data/json/product_js_action.dart';
import 'package:clothes_app/data/sqlite/liked_sqlite.dart';
import 'package:clothes_app/elementes/alert_popup.dart';
import 'package:clothes_app/objects/liked.dart';
import 'package:clothes_app/objects/product_obj.dart';
import 'package:clothes_app/screens/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemList extends StatelessWidget {
  final String? title;
  final String categoryName;

  ItemList({required this.categoryName, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          if (title != null)
            Text(
              title!,
              style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
            ),
          // List item
          CustomListProduct(
            cateName: categoryName,
            scrollDirection: Axis.horizontal,
            columnCount: 1,
          ),
          // See all button
          // GestureDetector(
          //   onTap: (){},
          //   child: Container(
          //     width: 100,
          //     height: 50,
          //     padding: EdgeInsets.all(5),
          //     decoration: const BoxDecoration(
          //       color: Color(0xFF0060FF),
          //       borderRadius: BorderRadius.all(Radius.circular(10))
          //     ),
          //     child: Center(
          //       child: Text('See all', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}

class CustomListProduct extends StatefulWidget {
  final String? cateName;
  final String? productName;
  final Axis scrollDirection;
  final int columnCount;
  List<LikedProduct>? lstProductID = [];

  CustomListProduct({this.cateName, this.productName, required this.scrollDirection, required this.columnCount, this.lstProductID});

  @override
  _CustomListProductState createState() => _CustomListProductState();
}

class _CustomListProductState extends State<CustomListProduct> {
  late Future<List<Product>> _productsFuture;

  final ProductJSAction productJSAction = ProductJSAction();
  final LikedService likedService = LikedService();
  final ProductAPI productAPI = ProductAPI();

  Future<List<Product>> _loadProductList() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (widget.cateName != null) {
      return await productJSAction.loadProductLstWithType(widget.cateName!, sharedPreferences);
    }
    if (widget.lstProductID != null && widget.lstProductID!.isNotEmpty) {
      return await likedService.getListProduct(widget.lstProductID!);
    }
    if(widget.productName!=null){
      return await productJSAction.getListProductByName(sharedPreferences, widget.productName!);
    }
    return await productAPI.getListProduct(sharedPreferences.getString('token').toString());
  }

  Future<bool> _loadLikedList(Product product) async{
    bool isLiked = await likedService.isLiked(product.id!);
    return isLiked;
  }

  @override
  void initState() {
    super.initState();
    _productsFuture = _loadProductList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: _loadProductList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            margin: EdgeInsets.only(top: 50),
            child: Center(child: CircularProgressIndicator()),
          );
        } 
        else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return _buildProductGrid(snapshot.data!);
        } 
        else {
          return Center(child: Text('No products available'));
        }
      },
    );
  }

  Widget _buildProductGrid(List<Product> products) {
    return Container(
      width: double.infinity,
      height: widget.scrollDirection == Axis.horizontal ? 400 : double.infinity,
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: GridView.builder(
        itemCount: products.length,
        scrollDirection: widget.scrollDirection,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.columnCount,
          mainAxisSpacing: 0.5,
          crossAxisSpacing: 0.7,
          childAspectRatio: widget.scrollDirection == Axis.horizontal ? 1.5 : 0.5,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 250,
            height: 500,
            child: _CustomItem(products[index]),
          );
        },
      ),
    );
  }

  Widget _CustomItem(Product product) {
    return GestureDetector(
      onTap: () {
        _navigateToProductDetail(product);
      },
      child: Container(
        width: 230,
        height: double.infinity,
        margin: EdgeInsets.only(right: 10, left: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image stack with like and shop
            _CustomImageStack(product),
            // Name and price
            Container(
              width: 230,
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Text(
                product.name!,
                style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
                maxLines: 1,
              ),
            ),
            Container(
              width: 230,
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                '${NumberFormat('#,##0').format(int.parse(product.price!))} VND',
                style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 205, 140, 10), fontWeight: FontWeight.w500),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToProductDetail(Product product) {
    try {
      print("Start _navigateToProductDetail");

      productJSAction.getListVariantsWithCombination(product).whenComplete(() {
        product.clearVariants();
        product.clearVariantValues();

        for (var variant in productJSAction.listVariants) {
          product.addVariants(variant);
        }

        productJSAction.getListVariantValueWithCombination(product).whenComplete(() {
          print("Completed getListVariantValueWithCombination");

          for (var value in productJSAction.listVariantValues) {
            product.addVariantValue(value);
          }

          for (var value in productJSAction.listCombinationValue) {
            product.addCombinationValue(value);
          }

          // Điều hướng đến trang chi tiết sản phẩm
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductDetailPage(product: product)),
          );
        }); 
      });
      print("Complete _navigateToProductDetail");

    } catch (e) {
      print('Error: $e');
    }
  }

  Widget _CustomImageStack(Product product) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Image.asset(
              product.imageURL!,
              fit: BoxFit.cover,
            ),
          ),
          // Heart and shop
          Positioned(
            top: 5,
            right: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                
                FutureBuilder<bool>(
                  future: _loadLikedList(product),
                  builder: (context, snapshot) {
                    if(snapshot.data==null){
                      return GestureDetector(
                        onTap: () {
                          likedService.insert(LikedProduct(productID: product.id));
                          setState(() {});
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          margin: EdgeInsets.only(bottom: 5),
                          child: _CustomIconHeartShop(CupertinoIcons.heart, Colors.black,),
                        ),
                      );
                    }
                    else{
                      return GestureDetector(
                        onTap: () {
                          if(snapshot.data==true){
                            likedService.delete(product.id!);
                            setState(() {});
                          }else{
                            likedService.insert(LikedProduct(productID: product.id));
                            setState(() {});
                          }
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          margin: EdgeInsets.only(bottom: 5),
                          child: 
                          _CustomIconHeartShop(
                            snapshot.data! ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                            snapshot.data! ? Colors.red : Colors.black,
                          ),
                        ),
                      );
                    }
                  },
                ),
                Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.only(top: 5),
                  child: _CustomIconHeartShop(CupertinoIcons.shopping_cart, Colors.black),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _CustomIconHeartShop(IconData iconData, Color color) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Center(
        child: Icon(iconData, color: color, size: 30),
      ),
    );
  }
}
