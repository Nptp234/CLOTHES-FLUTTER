import 'package:clothes_app/API/api.dart';
import 'package:clothes_app/objects/bill.dart';
import 'package:dio/dio.dart';

class BillAPI{
  API api = API();

  Future<List<Bill>> getListBillByUserID(String token, String userID) async{
    try{
      Response res = await api.sendRequest.get(
        '/Bill/getBillByUserID',
        data: {
          'UserID': userID,
        },
        options: Options(headers: api.header(token))
      );

      List<dynamic> listJson = res.data['bills'];

      List<Bill> lst = listJson
        .map((e) => Bill.fromJson(e))
        .toList();
    
      return lst;
    }
    catch(e){
      rethrow;
    }
  }

  Future<List<Bill>> getListBill(String token) async{
    try{
      Response res = await api.sendRequest.get(
        '/Bill/getAllBill',
        options: Options(headers: api.header(token))
      );

      List<dynamic> listJson = res.data['bills'];

      List<Bill> lst = listJson
        .map((e) => Bill.fromJson(e))
        .toList();
    
      return lst;
    }
    catch(e){
      rethrow;
    }
  }

  Future<String> addBill(String token, Bill bill) async{
    try{
      Response res = await api.sendRequest.post(
        '/Bill/addBill',
        data: {
          'Id': bill.id,
          'UserID': bill.user_id,
          'Status': bill.status,
          'Date': bill.date,
          'AmountCart': bill.amount_cart,
          'CartImg': bill.cart_img
        },
        options: Options(headers: api.header(token))
      );

      return '${res.statusCode}';
    }catch(e){
      rethrow;
    }
  }

}