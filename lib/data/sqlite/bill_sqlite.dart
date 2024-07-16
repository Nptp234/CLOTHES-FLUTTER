import 'package:clothes_app/data/sqlite/dataservice.dart';
import 'package:clothes_app/objects/bill.dart';

class BillService{
  final DatabaseService _databaseService = DatabaseService();

  Future<List<Bill>> getList() async{
    final db = await _databaseService.database;
    var data = await db.rawQuery('select * from Bill');

    // List<Bill> lst = 
    //   List.generate(data.length, (index) => Bill.fromJson(data[index]));
    
    return List.generate(data.length, (index) => Bill.fromJson(data[index]));
  }

  Future<List<Bill>> getSortList(String status) async{
    final db = await _databaseService.database;
    List<Map<String, Object?>> data;
    if(status.toLowerCase()=='all'){
      data = await db.rawQuery('select * from Bill');
    }else{
      data = await db.rawQuery('select * from Bill where status = ?',[status]);
    }

    return List.generate(data.length, (index) => Bill.fromJson(data[index]));
  }

  Future<void> insert(Bill o) async{
    final db = await _databaseService.database;
    var data = 
      await db.rawInsert('insert into Bill(id, status, userId, date, amount_cart, cart_img) values(?,?,?,?,?,?)',
      [o.id, o.status, o.user_id, o.date, o.amount_cart, o.cart_img]);
  }

  Future<void> delete(int id) async{
    final db = await _databaseService.database;
    var data = 
      await db.rawDelete('delete from Bill where id = ?',
      [id]);
  }
}