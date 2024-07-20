import 'package:clothes_app/API/api.dart';
import 'package:clothes_app/objects/variants_pro.dart';
import 'package:dio/dio.dart';

class VariantAPI{
  API api = API();

  Future<List<ProductVariants>> getListVariant(String token) async{
    try{
      Response res = await api.sendRequest.get(
        '/Variant/getListVariant',
        options: Options(headers: api.header(token))
      );
      
      List<dynamic> listJson = res.data['variants'];

      List<ProductVariants> lst = listJson
        .map((e) => ProductVariants.fromJson(e))
        .toList();
    
      return lst;
    }
    catch(e){
      rethrow;
    }
  }
}