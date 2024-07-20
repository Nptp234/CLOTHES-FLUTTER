import 'package:clothes_app/menus/bottom_menu.dart';
import 'package:clothes_app/objects/cart.dart';
import 'package:clothes_app/objects/cartVM.dart';
import 'package:clothes_app/objects/product_obj.dart';
import 'package:clothes_app/objects/productvm.dart';
import 'package:clothes_app/screens/cart_checkout.dart';
import 'package:clothes_app/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class CartDetailPage extends StatefulWidget{
    CartDetailPageState createState() => CartDetailPageState();
}

class CartDetailPageState extends State<CartDetailPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Cart Detail', style: TextStyle(fontSize: 20, color: Colors.black),),
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
        height: 170,

        child: Center(
          child: Consumer<CartViewModel>(
            builder: (context, value, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  ElevatedButton(
                    onPressed: () {
                      QuickAlert.show(
                        context: context, 
                        type: QuickAlertType.info,
                        title: '',
                        confirmBtnColor: Color(0xFF0060FF),
                        confirmBtnTextStyle: TextStyle(color: Colors.white),
                        widget: _popupCartInfo(value)
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0060FF), 
                      padding: const EdgeInsets.all(10.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    ),

                    child: Text('Xem chi tiết hóa đơn', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.normal), textAlign: TextAlign.center,),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        // ignore: use_build_context_synchronously
                        context,
                        MaterialPageRoute(builder: (context) => CartCheckout()),
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0060FF), 
                      padding: const EdgeInsets.all(10.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    ),

                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.zero,

                      child: Text('Thanh toán', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }



  Widget _bodyCustom(BuildContext context){
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      // physics: const AlwaysScrollableScrollPhysics(),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          _amountAddMore(),
          _listCartCustom(context),
        ],
      ),
    );
  }

  Widget _popupCartInfo(CartViewModel value){
    return Container(
      padding: EdgeInsets.all(3),
      width: double.infinity,
      height: 200,

      child: Column(

        children: [
          Expanded(
            flex: 0,
            child: Text('Chi tiết khoản thu', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
          ),
          const SizedBox(height: 20,),
          _titlePrice(value, 'Tiền sản phẩm', '${NumberFormat('#,##0').format(value.sumPriceAll())} VND'),
          const SizedBox(height: 10,),
          _titlePrice(value, 'Gía trị giảm giá', '0'),
          const SizedBox(height: 10,),
          _titlePrice(value, 'Điểm thưởng', '0'),
          const SizedBox(height: 10,),
          const Divider(
            color: Colors.grey, // Màu sắc của đường viền
            thickness: 1.0,
          ),
          _titlePrice(value, 'Tổng', '${NumberFormat('#,##0').format(value.sumPriceAll())} VND'),
        ],
      ),
    );
  }

  Widget _titlePrice(CartViewModel value, String title, String price){
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$title: ', style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold,),),
              Text(price, style: TextStyle(color: Colors.black, fontSize: 17),),
            ],
          );
  }

  Widget _amountAddMore(){
    return Consumer<CartViewModel>(

      builder: (context, value, child){
        return Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text('Bạn đang có ${value.listCart.length} sản phẩm trong giỏ hàng', style: TextStyle(fontSize: 20),),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomMenu(child: HomePage(),)));
                },

                child: Container(
                  width: 190, 
                  // height: 40,
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Color(0xFF0060FF),
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add, size: 30, color: Colors.white,),
                      Text('Thêm sản phẩm', style: TextStyle(fontSize: 17, color: Colors.white),)
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }
    );
  }

  Widget _listCartCustom(BuildContext context){
    return Consumer<CartViewModel>(

      builder: (context, value, child){
        return Container(
          padding: EdgeInsets.only(bottom: 150),

          child: GridView.builder(
          itemCount: value.listCart.length,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 0.5, //khoang cach giua hang
            crossAxisSpacing: 5.0, //khoang cach giua cot
            childAspectRatio: 1.4,
          ),

          scrollDirection: Axis.vertical,

          itemBuilder: value.listCart.isNotEmpty?
          (BuildContext context, int index){
            return _itemCartCustom(context, value, value.listCart[index]);
          }:
          (context, index) => Text('', style: TextStyle(fontSize: 20, color: Colors.black), textAlign: TextAlign.center,)
        ),
        );
      }
    );
  }

  Widget _itemCartCustom(BuildContext context, CartViewModel value, Cart cart){
    return Dismissible(
      key: UniqueKey(), 
      direction: DismissDirection.horizontal,
      background: Container(color: Colors.red,),
      onDismissed: (direction){
        value.removeCart(cart.id!);
      },

      child: Container(
        width: double.infinity,
        // height: 250,
        // padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(width: 1, color: Colors.grey),
        ),
        margin: EdgeInsets.all(20),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Expanded(
              flex: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                child: Image.asset('${cart.getProduct().imageURL}', fit: BoxFit.cover,),
              ),
            ),
            const SizedBox(width: 10,),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(cart.getProduct().name!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black), maxLines: 3,),
                  const SizedBox(height: 20,),
                  _listVariant(cart),
                  _changeAmount(context, cart, value),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),

                    child: Text('${NumberFormat('#,##0').format(value.sumPriceCart(cart))} VND', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color(0xFF0060FF)), textAlign: TextAlign.center,),
                  ),
                ],
              )
            ),
          ],
        ),
        
      )
    );
  }

  Widget _listVariant(Cart cart) {
    return ListView.builder(
      itemCount: cart.lstCartVariant!.length,
      scrollDirection: Axis.vertical,
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return FutureBuilder(
          future: _fetchVariantDetails(cart.lstCartVariant![index]),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              Color colorName = Colors.transparent;

              if (cart.lstCartVariant![index].variantName!.toLowerCase() == 'color') {
                String? value = cart.lstCartVariant![index].variantValue;
                try {
                  colorName = Color(int.parse(value!));
                } catch (e) {
                  print("Error parsing color value: $e");
                }
              }

              return cart.lstCartVariant![index].variantName!.toLowerCase() == 'color'
                  ? Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 0,
                            child: Text(
                              cart.lstCartVariant![index].variantName!.toUpperCase(),
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              width: double.infinity,
                              height: 24,
                              decoration: BoxDecoration(
                                color: colorName,
                                border: Border.all(
                                  color: Colors.transparent,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 0,
                            child: Text(
                              cart.lstCartVariant![index].variantName!.toUpperCase(),
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(width: 25),
                          Expanded(
                            flex: 1,
                            child: Text(
                              cart.lstCartVariant![index].variantValue!.toUpperCase(),
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    );
            }
          },
        );
      },
    );
  }

  Future<void> _fetchVariantDetails(CartVariant variant) async {
    await variant.getVariantID();
    await variant.getValueID();
    await variant.getVariantName();
    await variant.getVariantValue();
  }

  Widget _changeAmount(BuildContext context, Cart cart, CartViewModel pvm){
    TextEditingController _amount = TextEditingController();
    _amount.text = '${cart.quantity}';

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(5),
      // margin: EdgeInsets.only(top: 10),

      child: Center(
        child: Row(
          children: [
            Expanded(
              flex: 0,
              child: Center(
                child: IconButton(
                  onPressed: (){pvm.removeQuantity(cart);}, 
                  icon: Icon(Icons.minimize, size: 30,)
                ),
              )
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                // height: 10,
                child: TextFormField(
                  controller: _amount,
                  maxLength: 20,
                  style: TextStyle(fontSize: 15),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  
                ),
              )
            ),
            Expanded(
              flex: 0,
              child: Center(
                child: IconButton(
                  onPressed: (){pvm.add1(cart);}, 
                  icon: Icon(Icons.add, size: 30,)
                ),
              )
            ),
          ],
        ),
      ),
    );  
  }

}