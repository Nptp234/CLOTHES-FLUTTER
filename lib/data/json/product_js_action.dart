import 'dart:collection';
import 'dart:convert';

import 'package:clothes_app/API/api_combination.dart';
import 'package:clothes_app/API/api_combinationValue.dart';
import 'package:clothes_app/API/api_product.dart';
import 'package:clothes_app/API/api_variant.dart';
import 'package:clothes_app/API/api_variantValue.dart';
import 'package:clothes_app/objects/combination_pro.dart';
import 'package:clothes_app/objects/product_obj.dart';
import 'package:clothes_app/objects/variants_pro.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductJSAction{

  ProductAPI productAPI = ProductAPI();

  //get list product from json
  List<Product> _lstProduct = [];
  UnmodifiableListView get lstProduct => UnmodifiableListView(_lstProduct);

  //for load from json to _lstProduct
  Future<void> _loadProductLst(SharedPreferences sharedPreferences) async {
    // var data = await rootBundle.loadString('assets/dataFiles/product_js.json');
    // var dataJson = jsonDecode(data);
    // _lstProduct = (dataJson['data'] as List).map((e) => Product.fromJson(e)).toList();

    _lstProduct = await productAPI.getListProduct(sharedPreferences.getString('token').toString());
  }
  Future<List<Product>> loadProductLstWithType(String cateName, SharedPreferences sharedPreferences) async {
    // var data = await rootBundle.loadString('assets/dataFiles/product_js.json');
    // var dataJson = jsonDecode(data);
    // return (dataJson['data'] as List)
    //   .where((e) => e['categoryID']==typeID)
    //   .map((e) => Product.fromJson(e))
    //   .toList();

    _lstProduct = await productAPI.getListProductByCateName(sharedPreferences.getString('token').toString(), cateName);
    return _lstProduct;
  }
  Future<List<Product>> getListProduct(SharedPreferences sharedPreferences) async{
    if(_lstProduct.isEmpty){
      await _loadProductLst(sharedPreferences);
    }
    return _lstProduct;
  }
  Future<List<Product>> getListProductByName(SharedPreferences sharedPreferences, String name) async{
    if(_lstProduct.isEmpty){
      await _loadProductLst(sharedPreferences);
    }
    return _lstProduct.where((e) => e.name!.toLowerCase().contains(name.toLowerCase())).toList();
  }

  //json assets
  // getDataVariants() async{
  //   var dataVariants = await rootBundle.loadString('assets/dataFiles/product_variants.json');
  //   return  jsonDecode(dataVariants);
  // }
  // getDataCombination() async{
  //   var dataCombination = await rootBundle.loadString('assets/dataFiles/product_combination.json');
  //   return jsonDecode(dataCombination);
  // }
  // getDataCombinationValue() async{
  //   var dataCombinationValue = await rootBundle.loadString('assets/dataFiles/product_combination_valuevariants.json');
  //   return jsonDecode(dataCombinationValue);
  // }
  // getDataVariantValue() async{
  //   var dataVariantValue = await rootBundle.loadString('assets/dataFiles/product_variants_value.json');
  //   return jsonDecode(dataVariantValue);
  // }

  //get list combination
  List<ProductCombinationVariants> _listCombination = [];
  UnmodifiableListView get listCombination => UnmodifiableListView(_listCombination);
  ConbinationAPI conbinationAPI = ConbinationAPI();

  Future<void> getListCombination(Product product, SharedPreferences sharedPreferences) async{
    // var dataJsonCombination = await getDataCombination();

    // _listCombination = (dataJsonCombination['data'] as List)
    //   .where((combination) => combination['product_id'] == product.id)
    //   .map((combination) => ProductCombinationVariants.fromJson(combination))
    //   .toList();

    var _list = await conbinationAPI.getListCombination(sharedPreferences.getString('token').toString());
    _listCombination = _list.where((e) => e.product_id==product.id).toList();
  }

  //get list variant from id in combination list
  List<ProductVariants> _listVariants = [];
  UnmodifiableListView get listVariants => UnmodifiableListView(_listVariants);
  VariantAPI variantAPI = VariantAPI();

  // Future<void> getListVariantsWithCombination(Product product) async{
    
  //   _listCombination = [];
  //   _listVariants = [];

  //   if (_listCombination.isEmpty) {
  //     getListCombination(product);
  //   }

  //   // var dataJsonVariants = await getDataVariants();

  //   List<String> _variantId = [];
  //   for (var variant in _listCombination){
  //     _variantId.add(variant.variants_id!);
  //   }

  //   // _listVariants = (dataJsonVariants['data'] as List)
  //   //   .where((variant) => _variantId.contains(variant['id']))
  //   //   .map((variant) => ProductVariants.fromJson(variant))
  //   //   .toList();

  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   var _list = await variantAPI.getListVariant(sharedPreferences.getString('token').toString());
  //   _listVariants = _list.where((e) => _variantId.contains(e.id)).toList();

  // }

  Future<void> getListVariantsWithCombination(Product product) async {
    _listCombination = [];
    _listVariants = [];

    try{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

      if (_listCombination.isEmpty) {
        await getListCombination(product, sharedPreferences);
      }

      List<String> _variantId = [];
      for (var variant in _listCombination) {
        _variantId.add(variant.variants_id!);
      }

      var _list = await variantAPI.getListVariant(sharedPreferences.getString('token').toString());
      _listVariants = _list.where((e) => _variantId.contains(e.id)).toList();
    }catch(e){
      rethrow;
    }
  }

  Future<void> getAllListVariant() async{
    _listVariants = [];

    // var dataJsonVariants = await getDataVariants();

    // _listVariants = (dataJsonVariants['data'] as List)
    //   .map((variant) => ProductVariants.fromJson(variant))
    //   .toList();

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _listVariants = await variantAPI.getListVariant(sharedPreferences.getString('token').toString());
  }

  //get combination value when already have list combination
  List<CombinationValue> _listCombinationValue = [];
  UnmodifiableListView get listCombinationValue => UnmodifiableListView(_listCombinationValue);
  CombinationValueAPI combinationValueAPI = CombinationValueAPI();

  Future<void> getListCombinationValue(Product product) async{
    _listCombination = [];
    _listCombinationValue = [];

    try{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      if (_listCombination.isEmpty) {
        await getListCombination(product, sharedPreferences);
      }
      
      // var dataJsonComValue = await getDataCombinationValue();

      List<String> _ids = [];
      for (var id in _listCombination){ 
        _ids.add(id.id!);
      }

      // _listCombinationValue = (dataJsonComValue['data'] as List)
      //   .where((value) => _ids.contains(value['combination_id']))
      //   .map((value) => CombinationValue.fromJson(value))
      //   .toList();

      var _list = await combinationValueAPI.getListCombinationValue(sharedPreferences.getString('token').toString());
      _listCombinationValue = _list.where((e) => _ids.contains(e.combination_id)).toList();
    }catch(e){
      rethrow;
    }
  }

  Future<void> getAllListCombinationValue() async{
    _listCombinationValue = [];
    
    // var dataJsonComValue = await getDataCombinationValue();

    // _listCombinationValue = (dataJsonComValue['data'] as List)
    //   .map((value) => CombinationValue.fromJson(value))
    //   .toList();

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _listCombinationValue = await combinationValueAPI.getListCombinationValue(sharedPreferences.getString('token').toString());
  }


  
  //get list variant value from id in combination value list
  List<VariantsValue> _listVariantValues = [];
  UnmodifiableListView get listVariantValues => UnmodifiableListView(_listVariantValues);
  VariantValueAPI variantValueAPI = VariantValueAPI();

  Future<void> getListVariantValueWithCombination(Product product) async{
    _listCombinationValue = [];
    _listVariantValues = [];
    
    if (_listCombinationValue.isEmpty){
      await getListCombinationValue(product);
    }

    // var dataJsonVariValues = await getDataVariantValue();

    List<String> _ids = [];
    for (var value in _listCombinationValue){
      _ids.add(value.variants_value_id!);
    }

    // _listVariantValues = (dataJsonVariValues['data'] as List)
    //   .where((value) => _ids.contains(value['id']))
    //   .map((value) => VariantsValue.fromJson(value))
    //   .toList();

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var _list = await variantValueAPI.getListVariantValue(sharedPreferences.getString('token').toString());
    _listVariantValues = _list.where((e) => _ids.contains(e.id)).toList();

  }

  Future<void> getAllListVariantValue() async{
    _listVariantValues = [];

    // var dataJsonVariValues = await getDataVariantValue();
    // _listVariantValues = (dataJsonVariValues['data'] as List)
    //   .map((value) => VariantsValue.fromJson(value))
    //   .toList();
    
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _listVariantValues = await variantValueAPI.getListVariantValue(sharedPreferences.getString('token').toString());
  }

  List<VariantsValue> getListSortFromVariantID(int id){
    return _listVariantValues.where((value) => value.id == id).toList();
  }

  // List<int> getListColorId() {
  //   return lstIdColor;
  // }

  // //get list data size from json
  // Map<int, int> lstSizeP = {};
  // //for load color from json to _lstColorP
  // Future<void> loadSizePLst() async {
  //   var data = await rootBundle.loadString('assets/dataFiles/product_size.json');
  //   var dataJson = jsonDecode(data);
  //   lstSizeP = {
  //     for (var item in dataJson['data']) 
  //       item['productId'] as int: item['sizeId'] as int
  //   };
  // }
  // //for get from _lstProduct_lstColorP
  // Map<int, int> getListSize() {
  //   return lstSizeP;
  // }

  // //get list size for product by ID from json
  // List<int> lstIdSize = [];
  // //for load size from json to _lstIdColor
  // Future<void> loadSizeIdList(Product product) async{
  //   var data = await rootBundle.loadString('assets/dataFiles/product_size.json');
  //   var dataJson = jsonDecode(data);

  //   lstIdSize = (dataJson['data'] as List)
  //       .where((item) => item['productId'] == product.id)
  //       .map((item) => item['sizeId'] as int)
  //       .toList();
  // }
  // //for get from _lstProduct_lstColorP
  // List<int> getListSizeId() {
  //   return lstIdSize;
  // }

  //get variant id from valucombi id
  // int? variantId;
  // int? getVariantID(int valuecombi_id) {
  //   _listCombinationValue = [];
  //   if(_listCombinationValue.isEmpty){
  //     getAllListCombinationValue().whenComplete(() {
  //       return _listCombinationValue.firstWhere((valuecombi) => valuecombi.id == valuecombi_id).variants_id;
  //     });
  //   }
    
  // }

  String? valueId;
  String? getValueID(String valuecombi_id) {
    _listCombinationValue = [];
    if(_listCombinationValue.isEmpty){
      getAllListCombinationValue().whenComplete(() {
        valueId = _listCombinationValue.firstWhere((valuecombi) => valuecombi.id == valuecombi_id).variants_value_id;
      });
    }
    return valueId;
  } 

  String? variantName;
  //get variant name with variant id
  Future<void> getVariantName(String? variant_id) async{
    if(_listVariants.isEmpty){
      await getAllListVariant().whenComplete(() {
        variantName = _listVariants.firstWhere((variant) => variant.id == variant_id).name;
      });
    }
  }

  String? variantValue;
  //get variant value with value id
  Future<void> getVariantValue(String? value_id) async{
    if(_listVariantValues.isEmpty){
      await getAllListVariantValue().whenComplete(() {
        variantValue = _listVariantValues.firstWhere((value) => value.id == value_id).value;
      });
    }
  }

}