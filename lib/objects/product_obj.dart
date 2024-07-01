import 'dart:collection';
import 'dart:convert';

import 'package:clothes_app/objects/color_pro.dart';
import 'package:clothes_app/objects/size_pro.dart';
import 'package:clothes_app/objects/variants_pro.dart';
import 'package:flutter/services.dart';

class Product{
  String? name, description, imageURL, categoryName;
  int? id, price, categoryID;
  int quantity = 0;

  //list combination variants
  List<ProductVariants> _variants = [];
  UnmodifiableListView get variants => UnmodifiableListView(_variants);

  addVariants(ProductVariants variant){
    if(!_variants.contains(variant)){
      _variants.add(variant);
    }
  }
  cleatVariants(){
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
  cleatVariantValues(){
    _variantValues = [];
  }
  getListVariantsValue(){
    return _variantValues;
  }


  List<ColorProduct> lstColor = [];
  List<SizeProduct> lstSize = [];

  Product({this.id, this.name, this.imageURL, this.price, this.categoryID, this.categoryName});

  getListColor(){
    return lstColor;
  }
  getListSize(){
    return lstSize;
  }

  //get data from json
  Product.fromJson(Map<String, dynamic> e){
    id = e['id'];
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