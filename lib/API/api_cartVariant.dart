import 'package:clothes_app/API/api.dart';
import 'package:clothes_app/objects/cart.dart';
import 'package:dio/dio.dart';

class CartVariantAPI{
  API api = API();

  Future<List<CartVariant>> getListCartVariant(String token, String cartID) async{
    try{
      Response res = await api.sendRequest.get(
        '/CartVariant/getListCartVariantByCartID',
        data: {
          'CartID': cartID,
        },
        options: Options(headers: api.header(token))
      );

      List<dynamic> listJson = res.data['cartVariant'];

      List<CartVariant> lst = listJson
        .map((e) => CartVariant.fromJson(e))
        .toList();
    
      return lst;
    }
    catch(e){
      rethrow;
    }
  }

  Future<String> addCartVariant(String token, CartVariant cartVariant) async{
    try{
      Response res = await api.sendRequest.get(
        '/CartVariant/addCartVariant',
        data: {
          'CartID': cartVariant.cart_id,
          'ValueComboID': cartVariant.valuecombi_id,
        },
        options: Options(headers: api.header(token))
      );

      return '${res.statusCode}';
    }catch(e){
      rethrow;
    }
  }
}