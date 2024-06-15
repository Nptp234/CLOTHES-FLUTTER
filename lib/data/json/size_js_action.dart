import 'dart:convert';

import 'package:clothes_app/objects/size_pro.dart';
import 'package:flutter/services.dart';

class SizeJSAction{

  SizeJSAction();

  SizeProduct sizeProduct = SizeProduct();

  //get list color from json
  List<SizeProduct> lstSize = [];
  //load list from json to _lstColor
  Future<void> loadSizeProduct() async {
    var data = await rootBundle.loadString('assets/dataFiles/size_js.json');
    var dataJson = jsonDecode(data);
    lstSize = (dataJson['data'] as List).map((e) => SizeProduct.fromJson(e)).toList();
  }
  //get list from _lstColor
  List<SizeProduct> getList() {
    return lstSize;
  }

  //get list color from list id
  List<SizeProduct> lstSizeFromId = [];
  //load list from json to _lstColor
  Future<void> loadSizeProductID(List<int> idLst) async {
    var data = await rootBundle.loadString('assets/dataFiles/size_js.json');
    var dataJson = jsonDecode(data);
    List<SizeProduct> lstSize = (dataJson['data'] as List).map((e) => SizeProduct.fromJson(e)).toList();
    lstSizeFromId = lstSize.where((size) => idLst.contains(size.id)).toList();
  }
  //get list from _lstColor
  List<SizeProduct> getListSizeFromId() {
    return lstSizeFromId;
  }


}