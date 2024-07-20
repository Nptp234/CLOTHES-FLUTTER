import 'package:clothes_app/const/changeNumber.dart';
import 'package:clothes_app/const/changeDate.dart';
import 'package:clothes_app/data/sqlite/billCart_sqlite.dart';
import 'package:clothes_app/data/sqlite/bill_sqlite.dart';
import 'package:clothes_app/elementes/list_cart.dart';
import 'package:clothes_app/objects/bill.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CartPage extends StatefulWidget{

  _CartPage createState() => _CartPage();
}

class _CartPage extends State<CartPage>{

  List<String> titles = ['All', 'Pending', 'Delivery', 'Done'];
  String billStatus = 'all';

  BillService billService = BillService();
  BillCartService billCartService = BillCartService();
  

  List<Bill> bs = [];

  Future<List<Bill>> getLB(String status) async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bs = await billService.getSortList(status, sharedPreferences.getString('email').toString());
    return bs;
  }

  List<BillCart> lstBillCart = [];

  Future<List<BillCart>> getLO(String billId) async{
    lstBillCart = await billCartService.getListWithID(billId);
    return lstBillCart;
  }

  sumPriceCart(List<BillCart> os){
    double sum=0;
    for(var o in os){
      sum+=double.parse(o.cart_price!);
    } 
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: titles.length,
      child: Scaffold(
        appBar: _headerCustom(context),
        body: _bodyCustom(),
      ),
    );
  }

  Widget _bodyCustom(){
    return FutureBuilder<List<Bill>>(
      future: getLB(billStatus.toLowerCase()), 
      builder: (context, snapshot) { 
          if(snapshot.connectionState == ConnectionState.waiting){
            return Container(margin: EdgeInsets.only(top: 50), child: Center(child: CircularProgressIndicator(),),);
          }
          else{
            return bs.isEmpty?
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Image.asset('assets/empty_img.png', fit: BoxFit.cover,),const SizedBox(height: 50,),
                  Text('Có vẻ giỏ hàng của bạn đang trống!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
                ],
              ),
            )
            :
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),

              child:  ListView.builder(
                itemCount: bs.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,

                itemBuilder: (BuildContext context, int index){
                  // getLO(bs[index].id!);
                  // return _itemBill(bs[index], lstBillCart);
                  return FutureBuilder<List<BillCart>>(
                    future: getLO(bs[index].id!),
                    builder: (context, snapshot) {
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return Container(margin: EdgeInsets.only(top: 50), child: Center(child: CircularProgressIndicator(),),);
                      }
                      else{
                        return _itemBill(bs[index], lstBillCart);
                      }
                    }, 
                  );
                }
              ),
            );
          }
       },
    );
  }

  Widget _itemBill(Bill bill, List<BillCart> os){

    Color textColor;
    switch(bill.status!.toLowerCase()){
      case 'pending': textColor = Colors.grey; break;
      case 'done': textColor = Colors.green; break;
      default: textColor = Colors.blueAccent[700]!; break;
    }


    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 20, top: 20),

      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30))
      ),

      child: Column(
        children: [
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Text('#${shortenHashToFiveDigits(uuidToNumeric(bill.id!))}', style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold),),
              Text(bill.status!.toUpperCase(), style: TextStyle(fontSize: 20, color: textColor, fontWeight: FontWeight.bold),),
            ],
          ),
          const SizedBox(height: 20,),

          //
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Expanded(
                flex: 1,
                child: Image.asset(bill.cart_img!, fit: BoxFit.cover,)
              ),
              const SizedBox(width: 20,),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text('Ngày: ${formatDateTime(bill.date!)}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),),
                    Text('Sản phẩm: ${bill.amount_cart}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),),
                    Text('Tổng tiền: ${NumberFormat('#,##0').format(sumPriceCart(os))} VND', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),),
                  ],
                )
              )
            ],
          )
        ],
      ),

    );
  }



  PreferredSize _headerCustom(BuildContext context){
    return PreferredSize(
      preferredSize: Size.fromHeight(130), 
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF0060FF),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
        ),
        padding: EdgeInsets.only(top: 30, bottom: 20),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 1, child: Text('Cart', style: TextStyle(color: Colors.white, fontSize: 25),),),
              Expanded(
                flex: 1,
                child: TabBar(
                  tabs: titles.map((title) {
                    return Tab(text: title,);
                  }).toList(),
                  labelColor: Colors.white,
                  labelStyle: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  unselectedLabelStyle: TextStyle(fontSize: 15.0),
                  unselectedLabelColor: Color(0xFF5D9AFF),
                  indicatorColor: Colors.white,
                  indicatorWeight: 3.0,
                  dividerColor: Colors.transparent,
                  onTap: (value) {
                    setState(() {
                      billStatus=titles[value];
                    });
                  },
                )
              ),
            ],
          ),
        ),
      )
    );
  }

}