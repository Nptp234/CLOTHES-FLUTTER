import 'dart:collection';

import 'package:clothes_app/data/json/cart_js_action.dart';
import 'package:clothes_app/objects/cart.dart';
import 'package:clothes_app/objects/product_obj.dart';
import 'package:flutter/cupertino.dart';

class ProductVM with ChangeNotifier{
  
  // final List<Product> _listProduct = [];
  // UnmodifiableListView<Product> get listProduct => UnmodifiableListView(_listProduct);

  final List<Cart> _listCart = [];
  UnmodifiableListView<Cart> get listCart => UnmodifiableListView(_listCart);

  CartJSAction cartJSAction = CartJSAction();

  String state = 'Pending';

  amount(){
    int sum = 0;
    for(var cart in _listCart){
      sum += cart.quantity;
    }
    return sum;
  }

  add1(Cart cart) async{
    
    // await cartJSAction.addCart(cart);

    if (_listCart.isEmpty || !_listCart.contains(cart)){
      _listCart.add(cart);
    }
    cart.quantity+=1;

    notifyListeners();
  }

  remove(String? id){
    if (_listCart.isNotEmpty) {
      _listCart.removeWhere((cart) => cart.id==id);
      notifyListeners();
    }
  } 

  remove1(Cart cart){
    cart.quantity-=1;
    if (cart.quantity<=0){
      remove(cart.id!);
    }
    notifyListeners();
  }

  clearList(){
    for(var cart in _listCart){
      cart.quantity=0;
    }
    _listCart.clear();
    notifyListeners();
  }

  decreaseAmount(Cart cart){
    cart.quantity-=1;
    if (cart.quantity<=0){
      remove(cart.id!);
    }
    notifyListeners();
  }

  int sumPrice(Cart cart){
    return cart.quantity * int.parse(cart.getProduct().price!);
  }

}