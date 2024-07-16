import 'package:clothes_app/objects/cart.dart';

class Bill{
  String? status, id, user_id, date, cart_img;
  int? amount_cart;

  Bill({this.id, this.user_id, this.status, this.date, this.amount_cart, this.cart_img});

  Bill.fromJson(Map<String, dynamic> e){
    id = e['id'];
    user_id = e['user_id'];
    status = e['status'];
    date = e['date'];
    amount_cart = int.parse(e['amount_cart']);
    cart_img = e['cart_img'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = user_id;
    data['status'] = status;
    data['date'] = date;
    data['amount_cart'] = '${amount_cart}';
    data['cart_img'] = cart_img;
    return data;
  }

}

class BillCart{
  String? bill_id, cart_id;
  double? cart_price;

  BillCart({this.bill_id, this.cart_id, this.cart_price});

  BillCart.fromJson(Map<String, dynamic> e){
    bill_id = e['bill_id'];
    cart_id = e['cart_id'];
    cart_price = double.parse(e['cart_price']);
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bill_id'] = bill_id;
    data['cart_id'] = cart_id;
    data['cart_price'] = '${cart_price}';
    return data;
  }
}