import 'package:clothes_app/objects/product_obj.dart';
import 'package:dio/dio.dart';

import 'api.dart';

class ProductAPI{
  API api = API();

  Future<List<Product>> getListProduct(String token) async{
    try{
      Response res = await api.sendRequest.get(
        '/Product/getListAll',
        options: Options(headers: api.header(token))
      );
      
      List<dynamic> productsJson = res.data['products'];

      List<Product> products = productsJson
        .map((e) => Product.fromJson(e))
        .toList();
    
      return products;
    }
    catch(e){
      rethrow;
    }
  }

  Future<List<Product>> getListProductByCateName(String token, String cateName) async {
    Response res = await api.sendRequest.get(
      '/Product/getListByCategory',
      data: {
        'CategoryName': cateName,
      },
      options: Options(headers: api.header(token))
    );

    // Check if the response status code is 200 (OK)
    if (res.statusCode == 200) {
      List<dynamic> productsJson = res.data['products'];

      if (productsJson.isNotEmpty) {
        List<Product> products = productsJson.map((e) => Product.fromJson(e)).toList();
        return products;
      } else {
        return [];
      }
    } else if(res.statusCode == 404) {
      // Handle other status codes if necessary
      return [];
    }else{return [];}
  }
}