import 'package:clothes_app/API/api_billDetail.dart';
import 'package:clothes_app/data/sqlite/dataservice.dart';
import 'package:clothes_app/objects/bill.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BillCartService{
  final DatabaseService _databaseService = DatabaseService();
  BillDetailAPI billDetailAPI = BillDetailAPI();


  // Future<List<BillCart>> getList() async{
  //   final db = await _databaseService.database;
  //   var data = await db.rawQuery('select * from BillCart');

  //   List<BillCart> lst = 
  //     List.generate(data.length, (index) => BillCart.fromJson(data[index]));
    
  //   return lst;
  // }

  Future<List<BillCart>> getListWithID(String billId) async{
    // final db = await _databaseService.database;
    // var data = await db.rawQuery('select * from BillCart where bill_id = ?',[billId]);

    // List<BillCart> lst = 
    //   List.generate(data.length, (index) => BillCart.fromJson(data[index]));
    
    // return lst;

    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<BillCart> data = await billDetailAPI.getListBillByBillID(sharedPreferences.getString('token').toString(), billId);
    return data;
  }

  Future<void> insert(BillCart o) async{
    // final db = await _databaseService.database;
    // var data = 
    //   await db.rawInsert('insert into BillCart(bill_id, cart_id, cart_price) values(?,?,?)',
    //   [o.bill_id, o.cart_id, o.cart_price]);

    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var data = await billDetailAPI.addBillDetail(sharedPreferences.getString('token').toString(), o);
  }

  // Future<void> delete(int id) async{
  //   final db = await _databaseService.database;
  //   var data = 
  //     await db.rawDelete('delete from BillCart where bill_id = ?',
  //     [id]);
  // }
}