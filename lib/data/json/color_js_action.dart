import 'dart:convert';

import 'package:clothes_app/objects/color_pro.dart';
import 'package:flutter/services.dart';

class ColorJSAction{

  ColorJSAction();

  ColorProduct colorProduct = ColorProduct();

  //get list color from json
  List<ColorProduct> lstColor = [];
  //load list from json to _lstColor
  Future<void> loadColorProduct() async {
    var data = await rootBundle.loadString('assets/dataFiles/color_js.json');
    var dataJson = jsonDecode(data);
    lstColor = (dataJson['data'] as List).map((e) => ColorProduct.fromJson(e)).toList();
  }
  //get list from _lstColor
  List<ColorProduct> getList() {
    return lstColor;
  }

  //get list color from list id
  List<ColorProduct> lstColorFromId = [];
  //load list from json to _lstColor
  Future<void> loadColorProductID(List<int> idLst) async {
    var data = await rootBundle.loadString('assets/dataFiles/color_js.json');
    var dataJson = jsonDecode(data);
    List<ColorProduct> lstColor = (dataJson['data'] as List).map((e) => ColorProduct.fromJson(e)).toList();
    lstColorFromId = lstColor.where((color) => idLst.contains(color.id)).toList();
  }
  //get list from _lstColor
  List<ColorProduct> getListColorFromId() {
    return lstColorFromId;
  }

}