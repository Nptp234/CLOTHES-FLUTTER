import 'package:clothes_app/API/api.dart';
import 'package:clothes_app/objects/combination_pro.dart';
import 'package:dio/dio.dart';

class ConbinationAPI{
  API api = API();

  Future<List<ProductCombinationVariants>> getListCombination(String token) async{
    try{
      Response res = await api.sendRequest.get(
        '/Combination/getListCombination',
        options: Options(headers: api.header(token))
      );

      List<dynamic> listJson = res.data['value'];

      List<ProductCombinationVariants> lst = listJson
        .map((e) => ProductCombinationVariants.fromJson(e))
        .toList();
    
      return lst;
    }
    catch(e){
      rethrow;
    }
  }

}