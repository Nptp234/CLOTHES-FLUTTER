import 'package:clothes_app/API/api.dart';
import 'package:clothes_app/objects/bill.dart';
import 'package:dio/dio.dart';

class BillDetailAPI{
  API api = API();

  Future<List<BillCart>> getListBillByBillID(String token, String billID) async{
    try{
      Response res = await api.sendRequest.get(
        '/BillDetail/getListBillDetailByBillID',
        data: {
          'BillID': billID,
        },
        options: Options(headers: api.header(token))
      );

      List<dynamic> listJson = res.data['billDetail'];

      List<BillCart> lst = listJson
        .map((e) => BillCart.fromJson(e))
        .toList();
    
      return lst;
    }
    catch(e){
      rethrow;
    }
  }

  Future<String> addBillDetail(String token, BillCart billCart) async{
    try{
      Response res = await api.sendRequest.post(
        '/BillDetail/addBillDetail',
        data: {
          'BillID': billCart.bill_id,
          'CartID': billCart.cart_id,
          'CartPrice': billCart.cart_price,
        },
        options: Options(headers: api.header(token))
      );

      return '${res.statusCode}';
    }catch(e){
      rethrow;
    }
  }

}