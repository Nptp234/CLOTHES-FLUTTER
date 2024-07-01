import 'package:clothes_app/menus/bottom_menu.dart';
import 'package:clothes_app/objects/product_obj.dart';
import 'package:clothes_app/objects/productvm.dart';
import 'package:clothes_app/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    );
  }

  Widget _bodyCustom(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        _amountAddMore(),
        _listCartCustom(context),
      ],
    );
  }

  Widget _amountAddMore(){
    return Consumer<ProductVM>(
      builder: (context, value, child){
        return Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text('Bạn đang có ${value.listProduct.length} sản phẩm trong giỏ hàng', style: TextStyle(fontSize: 20),),
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
    return Consumer<ProductVM>(
      builder: (context, value, child){
        return GridView.builder(
          itemCount: 1,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 0.0, //khoang cach giua hang
            crossAxisSpacing: 5.0, //khoang cach giua cot
            childAspectRatio: 2.0,
          ),
          scrollDirection: Axis.vertical,

          itemBuilder: value.listProduct.isNotEmpty?
          (BuildContext context, int index){
            return _itemCartCustom(context, value, value.listProduct[index]);
          }:
          (context, index) => Text('', style: TextStyle(fontSize: 20, color: Colors.black), textAlign: TextAlign.center,)
        );
      }
    );
  }

  Widget _itemCartCustom(BuildContext context, ProductVM value, Product product){
    return Dismissible(
      key: UniqueKey(), 
      direction: DismissDirection.horizontal,
      background: Container(color: Colors.red,),
      onDismissed: (direction){
        value.removeProduct(product.id!);
      },
      child: Container(
        width: double.infinity,
        // height: 190,
        // padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(width: 1, color: Colors.grey),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Expanded(
              flex: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                child: Image.asset('${product.imageURL}', fit: BoxFit.cover,),
              ),
            ),
            const SizedBox(width: 10,),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(product.name!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black), maxLines: 3,),
                  // Container(decoration: BoxDecoration(color: Color(int.parse('${product.getListColor()}'))),)
                ],
              )
            ),
          ],
        ),
        
      )
    );
  }

}