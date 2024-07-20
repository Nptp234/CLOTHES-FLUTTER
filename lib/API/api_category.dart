import 'package:clothes_app/API/api.dart';
import 'package:clothes_app/objects/category.dart';
import 'package:dio/dio.dart';

class CategoryAPI{
  API api = API();

  Future<List<Category>> getListCategory(String token) async{
    try{
      Response res = await api.sendRequest.get(
        '/Category/getListAll',
        options: Options(headers: api.header(token))
      );

      List<dynamic> listJson = res.data['categories'];

      List<Category> lst = listJson
        .map((e) => Category.fromJson(e))
        .toList();
    
      return lst;
    }
    catch(e){
      rethrow;
    }
  }
}