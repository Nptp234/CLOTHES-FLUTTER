import 'dart:ui';

import 'package:clothes_app/data/sqlite/liked_sqlite.dart';
import 'package:clothes_app/elementes/item_list.dart';
import 'package:clothes_app/objects/liked.dart';
import 'package:clothes_app/objects/product_obj.dart';
import 'package:clothes_app/screens/product_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class LikedPage extends StatefulWidget {
  @override
  State<LikedPage> createState() => _LikedPageState();
}

class _LikedPageState extends State<LikedPage> {
  final LikedService likedService = LikedService();
  final List<LikedProduct> lst = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<LikedProduct> _likedFuture = [];

  Future<List<LikedProduct>> _loadLikedList() async{
    _likedFuture = await likedService.getList();
    return _likedFuture;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: _headerLiked(),

      body: FutureBuilder<List<LikedProduct>>(
        future: _loadLikedList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              margin: EdgeInsets.only(top: 50),
              child: Center(child: CircularProgressIndicator()),
            );
          } 
          else if (snapshot.hasError) {
            return Center(child: Text('Error loading liked products: ${snapshot.error}'));
          } 
          else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return CustomListProduct(
              scrollDirection: Axis.vertical,
              columnCount: 2,
              lstProductID: snapshot.data,
            );
          } 
          else {
            return SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Image.asset('assets/empty_img.png', fit: BoxFit.cover,),const SizedBox(height: 50,),
                    Text('Có vẻ wishlist của bạn đang trống!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  PreferredSizeWidget _headerLiked() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(180),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(blurRadius: 10.0, color: Colors.grey),
          ],
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _titleC(),
              _searchBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleC() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          width: 270,
          child: Text(
            'Wishlist',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _searchBar() {
    return Container(
      height: 50,
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.black,
                ),
                hintText: 'Search....',
                focusColor: Colors.white,
                fillColor: Colors.grey,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
              onFieldSubmitted: (value) {
                // Implement search functionality here if needed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductSearchScreen(productName: value,)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
