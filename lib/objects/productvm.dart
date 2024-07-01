import 'dart:collection';

import 'package:clothes_app/objects/product_obj.dart';
import 'package:flutter/cupertino.dart';

class ProductVM with ChangeNotifier{
  
  final List<Product> _listProduct = [];
  UnmodifiableListView<Product> get listProduct => UnmodifiableListView(_listProduct);

  String state = 'Pending';

  amount(){
    int sum = 0;
    for(var product in _listProduct){
      sum += product.quantity;
    }
    return sum;
  }

  add1(Product products){
    if (_listProduct.isEmpty || !_listProduct.contains(products)){
      _listProduct.add(products);
    }
    products.quantity+=1;
    notifyListeners();
  }

  removeProduct(int id){
    if (_listProduct.isNotEmpty) {
      _listProduct.removeWhere((product) => product.id==id);
      notifyListeners();
    }
  } 

  remove1(Product product){
    product.quantity-=1;
    if (product.quantity<=0){
      removeProduct(product.id!);
    }
    notifyListeners();
  }

  clearList(){
    for(var product in _listProduct){
      product.quantity=0;
    }
    _listProduct.clear();
    notifyListeners();
  }

}