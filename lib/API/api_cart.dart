import 'package:clothes_app/API/api.dart';
import 'package:clothes_app/objects/cart.dart';
import 'package:dio/dio.dart';

class CartAPI{
  API api = API();

  Future<List<Cart>> getListCartByBillID(String token, String billID) async{
    try{
      Response res = await api.sendRequest.get(
        '/Cart/getListCartByBillID',
        data: {
          'BillID': billID,
        },
        options: Options(headers: api.header(token))
      );

      List<dynamic> listJson = res.data['carts'];

      List<Cart> lst = listJson
        .map((e) => Cart.fromJson(e))
        .toList();
    
      return lst;
    }
    catch(e){
      rethrow;
    }
  }

  Future<String> addCart(String token, Cart cart) async{
    try{
      Response res = await api.sendRequest.get(
        '/Cart/getListCartByBillID',
        data: {
          'BillID': cart.bill_id,
          'Amount': cart.amount,
          'MainPrice': cart.main_price
        },
        options: Options(headers: api.header(token))
      );

      return '${res.statusCode}';
    }catch(e){
      rethrow;
    }
  }

  
}