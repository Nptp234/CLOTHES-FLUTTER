import 'dart:collection';
import 'dart:convert';

import 'package:clothes_app/objects/color_pro.dart';
import 'package:clothes_app/objects/combination_pro.dart';
import 'package:clothes_app/objects/size_pro.dart';
import 'package:clothes_app/objects/variants_pro.dart';
import 'package:flutter/services.dart';

class Product{
  String? name, description, imageURL, categoryName;
  int? id, price, categoryID;
  int quantity = 0;

  //list variants
  List<ProductVariants> _variants = [];
  UnmodifiableListView get variants => UnmodifiableListView(_variants);

  addVariants(ProductVariants variant){
    if(!_variants.contains(variant)){
      _variants.add(variant);
    }
  }
  clearVariants(){
    _variants = [];
  }
  getListVariants(){
    return _variants;
  }

  //list variants value
  List<VariantsValue> _variantValues = [];
  UnmodifiableListView get variantValues => UnmodifiableListView(_variantValues);

  addVariantValue(VariantsValue value){
    _variantValues.add(value);
  }
  clearVariantValues(){
    _variantValues = [];
  }
  getListVariantsValue(){
    return _variantValues;
  }

  //list combination value
  List<CombinationValue> _combinationValue = [];
  UnmodifiableListView get combinationValue => UnmodifiableListView(_combinationValue);

  addCombinationValue(CombinationValue value){
    _combinationValue.add(value);
  }
  clearCombinationValues(){
    _combinationValue = [];
  }
  getListCombinationValue(){
    return _combinationValue;
  }

  //get data from json
  Product.fromJson(Map<String, dynamic> e){

    if(e["id"] is String){
      id = int.parse(e['id']);
    }else{
      id = e['id'];
    }
    
    name = e['name'];
    description = e['description'];
    imageURL = e['imageURL'];
    price = e['price'];
    categoryID = e['categoryID'];
    categoryName = e['categoryName'];
  }

  //set data to json
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['imageURL'] = imageURL;
    data['price'] = price;
    data['categoryID'] = categoryID;
    data['categoryName'] = categoryName;
    return data;
  }
}