import 'dart:ui';

import 'package:clothes_app/objects/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class ProductDetailPage extends StatefulWidget{
  
  Products product;
  ProductDetailPage({required this.product});

  _ProductDetailPage createState() => _ProductDetailPage();
}

class _ProductDetailPage extends State<ProductDetailPage>{

  int _maxLineDes = 4;
  bool _isSort = false;
  String _textSeeAll = 'See All';
  void _updateMaxLineDes(){
    if (!_isSort){
      setState(() {
        _maxLineDes = 100;
        _isSort = true;
        _textSeeAll = 'Sort';
      });
    }else{
      setState(() {
        _maxLineDes = 4;
        _isSort = false;
        _textSeeAll = 'See All';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: AppBar(
              title: _TitleCustom(context),
            ),
          ),
        )
      ),

      body: _BodyCustom(context),

      bottomNavigationBar: _FooterCustom(),
    );
  }

  Widget _FooterCustom(){
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
        
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),

          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 130,
                  padding: EdgeInsets.zero,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Price', style: TextStyle(color: Colors.grey[500], fontSize: 20, fontWeight: FontWeight.normal),),
                      Text(
                        '${NumberFormat('#,##0').format(int.parse(widget.product.proPrices!))} VND', 
                        style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: (){}, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(184, 142, 47, 1.000), 
                    padding: const EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  ),
                  child: const SizedBox(
                    width: 170,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_bag, size: 30, color: Colors.white,),
                        const SizedBox(width: 20,),
                        Text('Add to cart', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.normal),)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _TitleCustom(BuildContext context){
    return const Center(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Product Detail', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),),
            Icon(CupertinoIcons.heart, size: 30,),
          ],
        ),
      );
  }

  Widget _BodyCustom(BuildContext context){
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        SliverFillRemaining(
          hasScrollBody: true,
          child: Container(
            padding: EdgeInsets.zero,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    _ImgCustom(),
                    _NameCustom(),
                    _DesCustom(),
                    _SizeCustom(),
                    _ColorCustom(),
                  ],
                ),
              ),
            )
          ),
        ),
      ],
    );
  }

  Widget _ImgCustom(){
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: 450,
      height: 450,

      child: Image.asset(
        widget.product.proImg!,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _NameCustom(){
    return Container(
      width: 450,
      padding: EdgeInsets.all(20),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.product.proGender!, style: const TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),),
              _StarRatingCustom()
            ],
          ),
          const SizedBox(height: 15,),

          Text(widget.product.proName!, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }

  Widget _StarRatingCustom(){

    double ratePoint = double.parse(widget.product.proLiked!);

    return Container(

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RatingBar.builder(
            initialRating: ratePoint,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 20,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {return null;},
          ),
          // Text(widget.product.proLiked, style: const TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _DesCustom(){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(right: 20, left: 20, bottom: 20),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Text('Product Detail', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
          Text(
            widget.product.proDes!, 
            style: const TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.normal),
            overflow: TextOverflow.ellipsis,
            maxLines: _maxLineDes,
          ),
          Container(
            width: 50,
            padding: EdgeInsets.zero,
            margin: const EdgeInsets.only(bottom: 5),
            child: TextButton(
              onPressed: _updateMaxLineDes,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ), 
              child: Text(
                _textSeeAll, 
                style: const TextStyle(color: Color.fromRGBO(184, 142, 47, 1.000), fontSize: 14, fontWeight: FontWeight.normal),
              ),
            ),
          ),
          const SizedBox(
            width: double.infinity,
            child: Divider(
              color: Colors.grey, // Màu sắc của đường viền
              thickness: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _ColorCustom(){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(right: 20, left: 20, bottom: 20),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Text('Colors', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
          _ListColor(),
          const SizedBox(
            width: double.infinity,
            child: Divider(
              color: Colors.grey, // Màu sắc của đường viền
              thickness: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _SizeCustom(){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(right: 20, left: 20, bottom: 20),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Text('Size', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
          _ListSize(),
          const SizedBox(
            width: double.infinity,
            child: Divider(
              color: Colors.grey, // Màu sắc của đường viền
              thickness: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  int _selectedIndexColor = 0;

  Widget _ListColor(){
    
    return SizedBox(
      width: double.infinity,
      height: 60,
        
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.product.lstColor!.length,
        shrinkWrap: true,
                
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              setState(() {
                _selectedIndexColor = index;
              });
            },
            child: Container(
              width: 50,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                // border: Border.all(width: 1, color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(15),
                color: Color((widget.product.lstColor[index].codeHex)),
              ),

              child: _selectedIndexColor == index ?
                Icon(Icons.circle, color: Colors.white, size: 30,) : null
            ),
          );
        },
      ),
    );
  }

  int _selectedIndexSize = 0;

  Widget _ListSize(){
    
    return SizedBox(
      width: double.infinity,
      height: 60,
        
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.product.lstSize.length,
        shrinkWrap: true,
                
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              setState(() {
                _selectedIndexSize = index;
              });
            },
            child: Container(
              width: 50,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(15),
                color: _selectedIndexSize == index ? Colors.grey[350] : Colors.white,
              ),

              child: Center(
                child: Text(
                  widget.product.lstSize[index].name, 
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,

                  ),
                ),
              )
            ),
          );
        },
      ),
    );
  }

}