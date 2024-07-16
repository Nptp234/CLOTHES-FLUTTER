import 'package:clothes_app/data/sqlite/dataservice.dart';
import 'package:clothes_app/objects/delivery.dart';

class DeliveryAddressService{
  final DatabaseService _databaseService = DatabaseService();

  Future<List<DeliveryAddress>> getList() async{
    final db = await _databaseService.database;
    var data = await db.rawQuery('select * from Address');

    List<DeliveryAddress> lstAddress = 
      List.generate(data.length, (index) => DeliveryAddress.fromJson(data[index]));
    
    return lstAddress;
  }

  Future<void> insert(DeliveryAddress deliveryAddress) async{
    final db = await _databaseService.database;
    var data = 
      await db.rawInsert('insert into Address(name, address, phone) values(?,?,?)',
      [deliveryAddress.name, deliveryAddress.address, deliveryAddress.phone]);
  }

  Future<void> update(DeliveryAddress deliveryAddress) async{
    final db = await _databaseService.database;
    var data = 
      await db.rawUpdate('update Address set name=?, address=?, phone=? where id=?',
      [deliveryAddress.name, deliveryAddress.address, deliveryAddress.phone, deliveryAddress.id]);
  }

  Future<void> delete(int id) async{
    final db = await _databaseService.database;
    var data = 
      await db.rawDelete('delete from Address where id = ?',
      [id]);
  }
}