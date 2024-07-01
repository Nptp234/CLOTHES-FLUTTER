import 'dart:collection';
import 'dart:convert';

import 'package:clothes_app/objects/color_pro.dart';
import 'package:clothes_app/objects/combination_pro.dart';
import 'package:clothes_app/objects/product_obj.dart';
import 'package:clothes_app/objects/variants_pro.dart';
import 'package:flutter/services.dart';

class ProductJSAction{

  // Product product = Product();

  ProductJSAction();
  ColorProduct colorProduct = ColorProduct();

  //get list product from json
  List<Product> _lstProduct = [];
  UnmodifiableListView get lstProduct => UnmodifiableListView(_lstProduct);
  //for load from json to _lstProduct
  Future<void> loadProductLst() async {
    var data = await rootBundle.loadString('assets/dataFiles/product_js.json');
    var dataJson = jsonDecode(data);
    _lstProduct = (dataJson['data'] as List).map((e) => Product.fromJson(e)).toList();
  }
  List<Product> getListProduct(){
    return _lstProduct;
  }



  // int? productId, colorId;
  //get data color from json
  // ProductJSAction.fromJsonColorP(Map<String, dynamic> e){
  //   productId = e['productId'];
  //   colorId = e['colorId'];
  // }

  // //set data color to json
  // Map<String, dynamic> toJsonColorP(){
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['productId'] = productId;
  //   data['colorId'] = colorId;
  //   return data;
  // }

  //get list data color from json
  // Map<int, int> lstColorP = {};
  //for load color from json to _lstColorP
  // Future<void> loadColorPLst() async {
  //   var data = await rootBundle.loadString('assets/dataFiles/product_color.json');
  //   var dataJson = jsonDecode(data);
  //   lstColorP = {
  //     for (var item in dataJson['data']) 
  //       item['productId'] as int: item['colorId'] as int
  //   };
  // }
  // //for get from _lstProduct_lstColorP
  // Map<int, int> getListColor() {
  //   return lstColorP;
  // }

  //get list color for product by ID from json
  List<int> lstIdColor = [];
  
  Future<void> loadColorIdList(Product product) async{
    var data = await rootBundle.loadString('assets/dataFiles/product_color.json');
    var dataJson = jsonDecode(data);

    lstIdColor = (dataJson['data'] as List)
        .where((item) => item['productId'] == product.id)
        .map((item) => item['colorId'] as int)
        .toList();
  }

  //json assets
  getDataVariants() async{
    var dataVariants = await rootBundle.loadString('assets/dataFiles/product_variants.json');
    return  jsonDecode(dataVariants);
  }
  getDataCombination() async{
    var dataCombination = await rootBundle.loadString('assets/dataFiles/product_combination.json');
    return jsonDecode(dataCombination);
  }
  getDataCombinationValue() async{
    var dataCombinationValue = await rootBundle.loadString('assets/dataFiles/product_combination_valuevariants.json');
    return jsonDecode(dataCombinationValue);
  }
  getDataVariantValue() async{
    var dataVariantValue = await rootBundle.loadString('assets/dataFiles/product_variants_value.json');
    return jsonDecode(dataVariantValue);
  }

  //get list combination
  List<ProductCombinationVariants> _listCombination = [];
  UnmodifiableListView get listCombination => UnmodifiableListView(_listCombination);

  Future<void> getListCombination(Product product) async{
    var dataJsonCombination = await getDataCombination();

    _listCombination = (dataJsonCombination['data'] as List)
      .where((combination) => combination['product_id'] == product.id)
      .map((combination) => ProductCombinationVariants.fromJson(combination))
      .toList();
  }

  //get list variant from id in combination list
  List<ProductVariants> _listVariants = [];
  UnmodifiableListView get listVariants => UnmodifiableListView(_listVariants);

  Future<void> getListVariantsWithCombination(Product product) async{
    
    _listCombination = [];
    _listVariants = [];

    if (_listCombination.isEmpty) {
      getListCombination(product);
    }

    var dataJsonVariants = await getDataVariants();

    List<int> _variantId = [];
    for (var variant in _listCombination){
      _variantId.add(variant.variants_id!);
    }

    _listVariants = (dataJsonVariants['data'] as List)
      .where((variant) => _variantId.contains(variant['id']))
      .map((variant) => ProductVariants.fromJson(variant))
      .toList();
  }

  //get combination value when already have list combination
  List<CombinationValue> _listCombinationValue = [];
  UnmodifiableListView get listCombinationValue => UnmodifiableListView(_listCombinationValue);

  Future<void> getListCombinationValue(Product product) async{
    _listCombination = [];
    _listCombinationValue = [];

    if (_listCombination.isEmpty) {
      getListCombination(product);
    }
    
    var dataJsonComValue = await getDataCombinationValue();

    List<int> _ids = [];
    for (var id in _listCombination){ 
      _ids.add(id.id!);
    }

    _listCombinationValue = (dataJsonComValue['data'] as List)
      .where((value) => _ids.contains(value['combination_id']))
      .map((value) => CombinationValue.fromJson(value))
      .toList();
  }

  
  //get list variant value from id in combination value list
  List<VariantsValue> _listVariantValues = [];
  UnmodifiableListView get listVariantValues => UnmodifiableListView(_listVariantValues);

  Future<void> getListVariantValueWithCombination(Product product) async{
    _listCombinationValue = [];
    _listVariantValues = [];
    
    if (_listCombinationValue.isEmpty){
      getListCombinationValue(product);
    }

    var dataJsonVariValues = await getDataVariantValue();

    List<int> _ids = [];
    for (var value in _listCombinationValue){
      _ids.add(value.variants_value_id!);
    }

    _listVariantValues = (dataJsonVariValues['data'] as List)
      .where((value) => _ids.contains(value['id']))
      .map((value) => VariantsValue.fromJson(value))
      .toList();
  }

  List<VariantsValue> getListSortFromVariantID(int id){
    return _listVariantValues.where((value) => value.id == id).toList();
  }
  
  
  





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