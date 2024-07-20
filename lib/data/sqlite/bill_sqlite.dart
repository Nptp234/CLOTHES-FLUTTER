import 'package:clothes_app/API/api_bill.dart';
import 'package:clothes_app/API/api_billDetail.dart';
import 'package:clothes_app/data/sqlite/dataservice.dart';
import 'package:clothes_app/objects/bill.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BillService{
  final DatabaseService _databaseService = DatabaseService();
  BillAPI billAPI = BillAPI();
  BillDetailAPI billDetailAPI = BillDetailAPI();

  Future<List<Bill>> getList(String userID) async{
    // final db = await _databaseService.database;
    // var data = await db.rawQuery('select * from Bill');

    // // List<Bill> lst = 
    // //   List.generate(data.length, (index) => Bill.fromJson(data[index]));
    
    // return List.generate(data.length, (index) => Bill.fromJson(data[index]));

    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<Bill> data = await billAPI.getListBillByUserID(sharedPreferences.getString('token').toString(), userID);
    return data;
  }

  Future<List<Bill>> getSortList(String status, String userID) async{
    // final db = await _databaseService.database;
    // List<Map<String, Object?>> data;
    // if(status.toLowerCase()=='all'){
    //   data = await db.rawQuery('select * from Bill');
    // }else{
    //   data = await db.rawQuery('select * from Bill where status = ?',[status]);
    // }

    // return List.generate(data.length, (index) => Bill.fromJson(data[index]));

    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var data = await billAPI.getListBillByUserID(sharedPreferences.getString('token').toString(), userID);

    if(status.toLowerCase()=='all'){
      return data;
    }else{
      return data.where((e) => e.status==status).toList();
    }
  }

  Future<void> insert(Bill o) async{
    // final db = await _databaseService.database;
    // var data = 
    //   await db.rawInsert('insert into Bill(id, status, userId, date, amount_cart, cart_img) values(?,?,?,?,?,?)',
    //   [o.id, o.status, o.user_id, o.date, o.amount_cart, o.cart_img]);
    
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var data = await billAPI.addBill(sharedPreferences.getString('token').toString(), o);
  }

  // Future<void> delete(int id) async{
  //   final db = await _databaseService.database;
  //   var data = 
  //     await db.rawDelete('delete from Bill where id = ?',
  //     [id]);
  // }
}