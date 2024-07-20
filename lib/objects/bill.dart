import 'package:clothes_app/objects/cart.dart';

class Bill{
  String? status, id, user_id, date, cart_img, amount_cart;

  Bill({this.id, this.user_id, this.status, this.date, this.amount_cart, this.cart_img});

  Bill.fromJson(Map<dynamic, dynamic> e){
    id = e['id'];
    user_id = e['UserID'];
    status = e['Status'];
    date = e['Date'];
    amount_cart = e['AmountCart'];
    cart_img = e['CartImg'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['UserID'] = user_id;
    data['Status'] = status;
    data['Date'] = date;
    data['AmountCart'] = amount_cart;
    data['CartImg'] = cart_img;
    return data;
  }

}

class BillCart{
  String? bill_id, cart_id, cart_price;

  BillCart({this.bill_id, this.cart_id, this.cart_price});

  BillCart.fromJson(Map<dynamic, dynamic> e){
    bill_id = e['BillID'];
    cart_id = e['CartID'];
    cart_price = e['CartPrice'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['BillID'] = bill_id;
    data['CartID'] = cart_id;
    data['CartPrice'] = cart_price;
    return data;
  }
}