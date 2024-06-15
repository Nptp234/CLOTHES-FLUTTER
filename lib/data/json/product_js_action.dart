import 'dart:convert';

import 'package:clothes_app/objects/color_pro.dart';
import 'package:clothes_app/objects/product_obj.dart';
import 'package:flutter/services.dart';

class ProductJSAction{

  ProductJSAction();
  ColorProduct colorProduct = ColorProduct();

  //get list product from json
  List<Product> lstProduct = [];
  //for load from json to _lstProduct
  Future<void> loadProductLst() async {
    var data = await rootBundle.loadString('assets/dataFiles/product_js.json');
    var dataJson = jsonDecode(data);
    lstProduct = (dataJson['data'] as List).map((e) => Product.fromJson(e)).toList();
  }
  List<Product> getListProduct(){
    return lstProduct;
  }



  int? productId, colorId;
  //get data color from json
  ProductJSAction.fromJsonColorP(Map<String, dynamic> e){
    productId = e['productId'];
    colorId = e['colorId'];
  }

  //set data color to json
  Map<String, dynamic> toJsonColorP(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;
    data['colorId'] = colorId;
    return data;
  }

  //get list data color from json
  Map<int, int> lstColorP = {};
  //for load color from json to _lstColorP
  Future<void> loadColorPLst() async {
    var data = await rootBundle.loadString('assets/dataFiles/product_color.json');
    var dataJson = jsonDecode(data);
    lstColorP = {
      for (var item in dataJson['data']) 
        item['productId'] as int: item['colorId'] as int
    };
  }
  //for get from _lstProduct_lstColorP
  Map<int, int> getListColor() {
    return lstColorP;
  }

  //get list color for product by ID from json
  List<int> lstIdColor = [];
  //for load color from json to _lstIdColor
  Future<void> loadColorIdList(Product product) async{
    var data = await rootBundle.loadString('assets/dataFiles/product_color.json');
    var dataJson = jsonDecode(data);

    lstIdColor = (dataJson['data'] as List)
        .where((item) => item['productId'] == product.id)
        .map((item) => item['colorId'] as int)
        .toList();
  }
  //for get from _lstProduct_lstColorP
  List<int> getListColorId() {
    return lstIdColor;
  }

  //get list data size from json
  Map<int, int> lstSizeP = {};
  //for load color from json to _lstColorP
  Future<void> loadSizePLst() async {
    var data = await rootBundle.loadString('assets/dataFiles/product_size.json');
    var dataJson = jsonDecode(data);
    lstSizeP = {
      for (var item in dataJson['data']) 
        item['productId'] as int: item['sizeId'] as int
    };
  }
  //for get from _lstProduct_lstColorP
  Map<int, int> getListSize() {
    return lstSizeP;
  }

  //get list size for product by ID from json
  List<int> lstIdSize = [];
  //for load size from json to _lstIdColor
  Future<void> loadSizeIdList(Product product) async{
    var data = await rootBundle.loadString('assets/dataFiles/product_size.json');
    var dataJson = jsonDecode(data);

    lstIdSize = (dataJson['data'] as List)
        .where((item) => item['productId'] == product.id)
        .map((item) => item['sizeId'] as int)
        .toList();
  }
  //for get from _lstProduct_lstColorP
  List<int> getListSizeId() {
    return lstIdSize;
  }

}