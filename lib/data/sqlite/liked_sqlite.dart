import 'package:clothes_app/data/json/product_js_action.dart';
import 'package:clothes_app/data/sqlite/dataservice.dart';
import 'package:clothes_app/objects/liked.dart';
import 'package:clothes_app/objects/product_obj.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LikedService{
  final DatabaseService _databaseService = DatabaseService();

  ProductJSAction productJSAction = ProductJSAction();


  Future<List<LikedProduct>> getList() async{
    final db = await _databaseService.database;
    var data = await db.rawQuery('select * from Liked');

    return List.generate(data.length, (index) => LikedProduct.fromJson(data[index]));
  }

  Future<List<Product>> getListProduct(List<LikedProduct> lstLiked) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var lstProduct = await productJSAction.getListProduct(sharedPreferences);

    var likedProductIds = Set<String>.from(lstLiked.map((liked) => liked.productID));

    // lstProduct.sort((a, b) {
    //   bool aLiked = likedProductIds.contains(a.id);
    //   bool bLiked = likedProductIds.contains(b.id);

    //   if (aLiked && !bLiked) {
    //     return -1; // a comes before b
    //   } else if (!aLiked && bLiked) {
    //     return 1; // b comes before a
    //   } else {
    //     return 0; // a and b are in the same order
    //   }
    // });

    lstProduct = lstProduct.where((e) => likedProductIds.contains(e.id)).toList();

    return lstProduct;
  }

  Future<void> insert(LikedProduct o) async{
    final db = await _databaseService.database;
    var data = 
      await db.rawInsert('insert into Liked(product_id) values(?)',
      [o.productID]);
  }

  Future<void> delete(String id) async{
    final db = await _databaseService.database;
    var data = 
      await db.rawDelete('delete from Liked where product_id = ?',
      [id]);
  }

  Future<bool> isLiked(String productId) async {
    final db = await _databaseService.database;
    var data = await db.rawQuery('select * from Liked where product_id = ?', [productId]);
    return data.isNotEmpty;
  }
}