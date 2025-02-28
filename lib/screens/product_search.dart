import 'package:clothes_app/elementes/item_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductSearchScreen extends StatefulWidget{

  String productName;
  ProductSearchScreen({required this.productName});

  _ProductSearchScreen createState() => _ProductSearchScreen();
}

class _ProductSearchScreen extends State<ProductSearchScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _headerCustom(),
      body: _bodyCustom(),
    );
  }

  Widget _bodyCustom(){
    return CustomListProduct(scrollDirection: Axis.vertical, columnCount: 2, productName: widget.productName,);
  }

  PreferredSize _headerCustom(){
    return PreferredSize(
      preferredSize: Size.fromHeight(160), 
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),

        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          boxShadow: [
            BoxShadow(blurRadius: 10.0, color: Colors.grey)
          ],
        ),

        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    }, 
                    icon: Icon(Icons.arrow_back, size: 25,)
                  ),
                  const SizedBox(width: 10,),
                  Text('Search', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                ],
              )
            ),

            //
            Expanded(
              flex: 1,
              child: TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search, size: 25, color: Colors.black,),
                  hintText: 'Search....',
                  hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                  labelStyle: TextStyle(fontSize: 15, color: Colors.grey),
                  focusColor: Colors.white,
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 0), borderRadius: BorderRadius.all(Radius.circular(20))),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 0), borderRadius: BorderRadius.all(Radius.circular(20))),
                ),

                onFieldSubmitted: (value){
                  widget.productName=value;
                  setState(() {
                    
                  });
                },
              ),
            ),
          ],
        ),
      )
    );
  }

}