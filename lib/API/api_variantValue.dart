import 'package:clothes_app/API/api.dart';
import 'package:clothes_app/objects/variants_pro.dart';
import 'package:dio/dio.dart';

class VariantValueAPI{
  API api = API();

  Future<List<VariantsValue>> getListVariantValue(String token) async{
    try{
      Response res = await api.sendRequest.get(
        '/VariantValue/getListVariantValue',
        options: Options(headers: api.header(token))
      );
      
      List<dynamic> listJson = res.data['value'];

      List<VariantsValue> lst = listJson
        .map((e) => VariantsValue.fromJson(e))
        .toList();
    
      return lst;
    }
    catch(e){
      rethrow;
    }
  }

  Future<List<VariantsValue>> getListVariantValueByVariantName(String token, String variantName) async{
    try{
      Response res = await api.sendRequest.get(
        '/VariantValue/getListVariantValueByVariantName',
        data: {
          'VariantName': variantName,
        },
        options: Options(headers: api.header(token))
      );
      
      List<dynamic> listJson = res.data['value'];

      List<VariantsValue> lst = listJson
        .map((e) => VariantsValue.fromJson(e))
        .toList();
    
      return lst;
    }
    catch(e){
      rethrow;
    }
  }
}