import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:clothes_app/objects/cart.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class CartJSAction{

  List<Cart> _carts = [];
  UnmodifiableListView get carts => UnmodifiableListView(_carts);

  getDataCartFromJson() async{
    var path = await rootBundle.loadString('assets/dataFiles/cart_js.json');
    return jsonDecode(path);
  }

  addCart(Cart cart) async{
    var dataFromJson = await getDataCartFromJson();
    _carts = (dataFromJson['data'] as List)
      .map((e) => Cart.fromJson(e))
      .toList();

    _carts.add(cart);

    dataFromJson['data'] = _carts.map((e) => e.toJson()).toList();

    String updatedData = jsonEncode(dataFromJson);

    File file = File('D:/1. LTDDNC/App1/clothes_app/assets/dataFiles/assets/dataFiles/cart_js.json');
    await file.writeAsString(updatedData);
  }
}