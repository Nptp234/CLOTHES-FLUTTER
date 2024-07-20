import 'package:clothes_app/API/api.dart';
import 'package:clothes_app/objects/combination_pro.dart';
import 'package:dio/dio.dart';

class CombinationValueAPI{
  API api = API();

  Future<List<CombinationValue>> getListCombinationValue(String token) async{
    try{
      Response res = await api.sendRequest.get(
        '/CombinationValue/getListCombinationValue',
        options: Options(headers: api.header(token))
      );
      
      List<dynamic> listJson = res.data['value'];

      List<CombinationValue> lst = listJson
        .map((e) => CombinationValue.fromJson(e))
        .toList();
    
      return lst;
    }
    catch(e){
      rethrow;
    }
  }

}