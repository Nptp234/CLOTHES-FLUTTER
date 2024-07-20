// import 'dart:html';
import 'dart:ui';

import 'package:choice/choice.dart';
import 'package:clothes_app/data/sqlite/billCart_sqlite.dart';
import 'package:clothes_app/data/sqlite/bill_sqlite.dart';
import 'package:clothes_app/data/sqlite/delivery_sqlite.dart';
import 'package:clothes_app/objects/bill.dart';
import 'package:clothes_app/objects/cartVM.dart';
import 'package:clothes_app/objects/delivery.dart';
import 'package:clothes_app/objects/payment_method.dart';
import 'package:clothes_app/objects/user.dart';
import 'package:clothes_app/screens/cart_success.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class CartCheckout extends StatefulWidget{

  _CartCheckout createState() => _CartCheckout();
}

class _CartCheckout extends State<CartCheckout>{

  UserAcount userAccount = UserAcount();

  List<DeliveryAddress> lstAddress = [];
  DeliveryAddressService deliveryAddressService = DeliveryAddressService();

  Future<List<DeliveryAddress>> getListAddress() async{
    lstAddress = await deliveryAddressService.getList();
    return lstAddress;
  }

  insertAddress(DeliveryAddress deliveryAddress) async{
    await deliveryAddressService.insert(deliveryAddress);
    setState(() {});
  }

  List<PaymentMethod> lstPayment = [];

  BillService billService = BillService();
  BillCartService billCartService = BillCartService();

  insertBillCart(BillCart o) async{
    await billCartService.insert(o);
  }

  insertBill(Bill b) async{
    await billService.insert(b);
  }

  insertListBillCart(List<BillCart> lst, Bill b) async{
    await insertBill(b);
    for(var o in lst){
      o.bill_id = b.id;
      await insertBillCart(o);
    }
  }

  createListBillCart(CartViewModel value){
    List<BillCart> os = [];
    for(var o in value.listCart){
      os.add(BillCart(cart_id: o.id, cart_price: o.main_price));
    }
    return os;
  }
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListAddress();
    lstPayment = [
      PaymentMethod(name: 'Tiền trong tài khoản', method: 'accountCast', urlImg: 'assets/mingcute_card-pay-fill.png'),
      PaymentMethod(name: 'Trả bằng MoMo', method: 'momoCast', urlImg: 'assets/momo.png'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Cart Checkout', style: TextStyle(fontSize: 20, color: Colors.black),),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        
        child: _bodyCustom(context),
      ),

      bottomNavigationBar: _footerCustom()
    );
  }

  Widget _footerCustom(){
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(blurRadius: 15.0, color: Colors.grey)
        ],
        color: Colors.white,
      ),

      child: BottomAppBar(
        color: Colors.transparent,
        surfaceTintColor: Colors.white,
        padding: EdgeInsets.all(10),
        shape: CircularNotchedRectangle(),
        height: 130,

        child: Consumer<CartViewModel>(
          builder: (context, value, child) {
            return Center(
              child: ElevatedButton(
                  onPressed: () async{
                    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                    
                    Bill b = Bill(
                      id: Uuid().v4(),
                      status: 'pending',
                      user_id: sharedPreferences.getString('email').toString(),
                      date: '${DateTime.now()}',
                      amount_cart: '${value.listCart.length}',
                      cart_img: value.listCart[0].product!.imageURL
                    );

                    List<BillCart> os = createListBillCart(value);

                    insertListBillCart(os, b);

                    value.removeAll();
                    
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CartSuccess()));
                  },

                  style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0060FF), 
                  padding: const EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                ),

                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.zero,

                  child: Text('Thanh toán', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                ),
              ),
            );
          },
        )
      ),
    );
  }

  Widget _bodyCustom(BuildContext context){
    return Consumer<CartViewModel>(
      builder: (context, value, child) {
        return Column(
          children: [
            Expanded(
              flex: 0,
              child: _amountCart(value)
            ),
            _deliveryAddress(),
            _paymentMethod(),
          ],
        );
      },
    );
  }

  Widget _amountCart(CartViewModel value){
    return Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(width: double.infinity, height: 50, child: Text('Bạn đang có ${value.listCart.length} sản phẩm trong giỏ hàng', style: TextStyle(fontSize: 20),),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text('Tổng', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                        const SizedBox(width: 10,),
                        Text('${NumberFormat('#,##0').format(value.sumPriceAll())} VND', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0060FF)),),
                      ],
                    )
                  ],
                ),
              );
  }

  Widget _deliveryAddress(){
    return FutureBuilder<List<DeliveryAddress>>(
      future: getListAddress(), 
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Container(margin: EdgeInsets.only(top: 50), child: Center(child: CircularProgressIndicator(),),);
        }
        else{
          return Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text('Địa chỉ giao hàng', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.start,),
                const SizedBox(height: 20,),
                _itemDeliveryList(),
                _addAddress(),
              ],
            ),
          );
        }
      }
    );
  }

  TextEditingController nameAddress = TextEditingController();
  TextEditingController phoneAddress = TextEditingController();
  TextEditingController addressAddress = TextEditingController();

  Widget _addAddress(){
    return GestureDetector(
      onTap: () {
        QuickAlert.show(
          context: context, 
          type: QuickAlertType.custom,
          barrierDismissible: true,
          confirmBtnText: 'Save',
          onConfirmBtnTap: () {
            DeliveryAddress deliveryAddress = DeliveryAddress(name: nameAddress.text, address: addressAddress.text, phone: phoneAddress.text);
            insertAddress(deliveryAddress);
            setState(() {});
          },

          widget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              TextFormField(
                controller: nameAddress,
                decoration: const InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2)),
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: phoneAddress,
                decoration: const InputDecoration(
                  hintText: 'Phone',
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2)),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*(\.[0-9]*)?$')),  // Allow only digits and decimal
                ],
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: addressAddress,
                decoration: const InputDecoration(
                  hintText: 'Address',
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2)),
                ),
              ),
              const SizedBox(height: 20,),
            ],
          ),
        );
      },

      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 10, top: 40),

        child: Text('Thêm địa chỉ?', style: TextStyle(fontSize: 17, color: Color(0xFF0060FF), fontWeight: FontWeight.bold), textAlign: TextAlign.end,),
      ),
    );
  }

  DeliveryAddress? selectedValue;
  void setSelectedValueAddress(DeliveryAddress? value){
    setState(() {
      selectedValue = value;
    });
  }
  int? _value=0;
  Color? deliveryItemColor;

  Widget _itemDeliveryList(){
    
    return 
    lstAddress.isNotEmpty ? 
    InlineChoice.single(
      itemCount: lstAddress.length, 
      clearable: false,
      onChanged: setSelectedValueAddress,

      itemBuilder: (selection, index){
        bool isSelected = _value == index;
        return SizedBox(
          width: 900,

          child: ChoiceChip(
            label: _itemDelivery(lstAddress[index].name!,lstAddress[index].phone!, lstAddress[index].address!, isSelected), 
            selected: isSelected,
            onSelected: (bool selected){
              setState(() {
                _value = selected ? index : 0;
              });
            },
            selectedColor: Colors.transparent,
            showCheckmark: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(width: 0, color: Colors.transparent)
            ),
          ),
        );
      }
    ):
    Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),

      child: Center(child: Text('Có vẻ bạn chưa có địa chỉ giao hàng?', style: TextStyle(fontSize: 20,), textAlign: TextAlign.center,),),
    );
  }
  

  Widget _itemDelivery(String title, String phone, String address, bool isSelected){

    final TextEditingController titleController = TextEditingController();
    titleController.text = title;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        border: Border.all(width: 1, color: Colors.black26),
        color: isSelected? Color(0xFF0060FF):Colors.white,
      ),
      padding: EdgeInsets.all(20),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
              suffixIcon: Icon(CupertinoIcons.pencil_circle_fill, color: isSelected?Colors.white:Colors.black,),
            ),
            style: TextStyle(color: isSelected?Colors.white:Colors.black),
          ),
          const SizedBox(height: 10,),

          Text('${phone.substring(0, 4)}-${phone.substring(4, 7)}-${phone.substring(7, 10)}', 
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal, color: isSelected?Colors.white:Colors.grey),),
          const SizedBox(height: 10,),

          Text('${address.toUpperCase()}', 
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal, color: isSelected?Colors.white:Colors.grey),),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }

  Widget _paymentMethod(){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text('Phương thức thanh toán', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.start,),
          const SizedBox(height: 20,),
          _paymentList(),

        ],
      ),
    );
  }

  PaymentMethod? selectedValue1;
  void setSelectedValuePayment(PaymentMethod? value){
    setState(() {
      selectedValue1 = value;
    });
  }
  int? _value1=0;
  Color? paymentItemColor;

  Widget _paymentList(){
    return InlineChoice.single(
      itemCount: lstPayment.length, 
      clearable: false,
      onChanged: setSelectedValuePayment,

      itemBuilder: (selection, index){
        bool isSelected = _value1 == index;
        return SizedBox(
          width: 900,

          child: ChoiceChip(
            label: _paymentItem(lstPayment[index].name!, lstPayment[index].urlImg!, isSelected),
            selected: isSelected,
            onSelected: (bool selected){
              setState(() {
                _value1 = selected ? index : 0;
              });
            },
            selectedColor: Colors.transparent,
            showCheckmark: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(width: 0, color: Colors.transparent)
            ),
          ),
        );
      }
    );
  }

  Widget _paymentItem(String title, String imgUrl, bool isSelected){

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),

      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black26),
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            width: 30,
            child: Image.asset(
              imgUrl,
              fit: BoxFit.cover,
            ),
          ),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black26),
              borderRadius: BorderRadius.all(Radius.circular(100))
            ),
            padding: EdgeInsets.all(3),
            width: 25,
            height: 25,

            child: Container(
              decoration: BoxDecoration(
                // border: Border.all(width: 1, color: Colors.black26),
                borderRadius: BorderRadius.all(Radius.circular(100)),
                color: isSelected ? Colors.blueAccent[700] : null
              ),
              width: 15,
            ),
          )
        ],
      ),
    );
  }

}