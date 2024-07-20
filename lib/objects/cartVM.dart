import 'dart:collection';

import 'package:clothes_app/objects/cart.dart';
import 'package:flutter/cupertino.dart';

class CartViewModel with ChangeNotifier{

  List<Cart> _listCart = [];
  UnmodifiableListView<Cart> get listCart => UnmodifiableListView(_listCart);

  setList(List<Cart> lst){
    _listCart = lst;

    notifyListeners();
  }

  getList(){

    notifyListeners();
    return _listCart;
  }

  add1(Cart cart){
    if(!_listCart.contains(cart)){
      _listCart.add(cart);
    }
    cart.quantity+=1;

    notifyListeners();
  }

  removeQuantity(Cart cart){
    if(_listCart.isNotEmpty){
      cart.quantity-=1;
      if(cart.quantity==0){
        _listCart.removeWhere((e) => e.id==cart.id);
      }
    }

    notifyListeners();
  }

  removeCart(String id){
    if(_listCart.isNotEmpty){
      _listCart.removeWhere((e) => e.id==id);
    }
  }

  removeAll(){
    _listCart.clear();
  }

  sumPriceCart(Cart cart){
    double sum = 0;
    sum = (cart.quantity*int.parse(cart.main_price!)).toDouble();

    // notifyListeners();
    return sum;
  }

  sumPriceAll(){
    double sum = 0;
    for(var cart in _listCart){
      sum+=(cart.quantity*int.parse(cart.main_price!)).toDouble();
    }

    // notifyListeners();
    return sum;
  }

  sumQuantity(){
    int sum = 0;
    for(int i=0;i<_listCart.length;i++){
      sum+=i;
    }

    notifyListeners();
    return sum;
  }



}