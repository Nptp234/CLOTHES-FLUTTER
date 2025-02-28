import 'dart:ui';

import 'package:clothes_app/data/json/product_js_action.dart';
import 'package:clothes_app/data/sqlite/liked_sqlite.dart';
import 'package:clothes_app/elementes/alert_popup.dart';
import 'package:clothes_app/elementes/variant_product_choice.dart';
import 'package:clothes_app/objects/cart.dart';
import 'package:clothes_app/objects/cartVM.dart';
import 'package:clothes_app/objects/combination_pro.dart';
import 'package:clothes_app/objects/liked.dart';
import 'package:clothes_app/objects/product_obj.dart';
import 'package:clothes_app/objects/productvm.dart';
import 'package:clothes_app/objects/variants_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:uuid/uuid.dart';

class ProductDetailPage extends StatefulWidget{
  
  final Product product;
  // static List<int> variantID = [];
  
  static List<CombinationValue> lstChoice = [];
  static String cartID = Uuid().v4();

  static bool clickAdd = false;
  static bool changeVariant = false;

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

  ProductJSAction productJSAction = ProductJSAction();

  VariantProductChoice? variantProductChoice;

  addCart(Cart cart, CartViewModel value){
    cart.lstCartVariant = [];
    for(var combiValue in ProductDetailPage.lstChoice){
      cart.addCartVariant(CartVariant(cart_id: cart.id, valuecombi_id: combiValue.id));
    }

    value.add1(cart);
    ProductDetailPage.clickAdd = true;
  }

  checkSameCartVariant(CartViewModel value){
    for(var cart in value.listCart){
      if(widget.product.name == cart.product!.name){
        //kiem tra variant
        
      }
    }
  }

  addFirstCart(Cart cart, CartViewModel value){

    addCart(cart, value);
  }

  addAnotherCart(Cart cart, CartViewModel value){
    if(ProductDetailPage.changeVariant && ProductDetailPage.clickAdd){
      Cart cart = Cart(
        id: Uuid().v4(),
        bill_id: '1',
        amount: '1',
        main_price: widget.product.price,
        product: widget.product
      );

      addCart(cart, value);
    }
  }

  LikedService likedService = LikedService();

  Future<bool> _loadLikedList(Product product) async{
    bool isLiked = await likedService.isLiked(product.id!);
    return isLiked;
  }


  Cart cart = Cart();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ProductDetailPage.clickAdd = false;
    ProductDetailPage.changeVariant = false;

    //create cart
    cart = Cart(
      id: ProductDetailPage.cartID,
      bill_id: '1',
      amount: '1',
      main_price: widget.product.price,
      product: widget.product
    );
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
              title: _TitleCustom(context, widget.product),
            ),
          ),
        )
      ),

      body: _BodyCustom(context),

      bottomNavigationBar: _FooterCustom(cart),
    );
  }

  Widget _FooterCustom(Cart cart){
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
          padding: EdgeInsets.zero,

          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 190,
                  padding: EdgeInsets.zero,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Price', style: TextStyle(color: Colors.grey[500], fontSize: 17, fontWeight: FontWeight.normal),),
                      Text(
                        '${NumberFormat('#,##0').format(int.parse(widget.product.price!))} VND', 
                        style: const TextStyle(color: Color(0xFF0060FF), fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Consumer<CartViewModel>(
                  builder: (context, value, child){
                    return ElevatedButton(
                      onPressed: (){
                        //add cart variant

                        //problemn: 
                        //  add to cart if its the same productID it work right, if its not the same its not.
                        //  if its not the same cart id but same value its dont work right

                        if(!ProductDetailPage.clickAdd){
                          addFirstCart(cart, value);
                        }
                        else{
                          addAnotherCart(cart, value);
                        }
                        
                        //if success
                        if(ProductDetailPage.clickAdd){
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.success,
                            title: '${value.listCart.length}'
                          );
                          ProductDetailPage.changeVariant = false;
                        }

                      }, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0060FF), 
                        padding: const EdgeInsets.all(10.0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      ),
                      child: Container(
                        // width: 150,
                        // height: 50,
                        padding: EdgeInsets.all(5),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_bag, size: 30, color: Colors.white,),
                            SizedBox(width: 5,),
                            Text('Add to cart', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.normal), textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                    );
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _TitleCustom(BuildContext context, Product product){
    return FutureBuilder<bool>(
      future: _loadLikedList(product), 
      builder: (context, snapshot){
        if(snapshot.data==null){
          return GestureDetector(
            onTap: () {
              likedService.insert(LikedProduct(productID: product.id));
              setState(() {});
            },
            child: Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(bottom: 5),
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Product Detail', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),),
                    Icon(CupertinoIcons.heart, size: 30,),
                  ],
                ),
              )
            ),
          );
        }

        else{
          return GestureDetector(
            onTap: () {
              if(snapshot.data==true){
                likedService.delete(product.id!);
                setState(() {});
              }else{
                likedService.insert(LikedProduct(productID: product.id));
                setState(() {});
              }
            },
            child: Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(bottom: 5),
              child: !snapshot.data!?
              const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Product Detail', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),),
                    Icon(CupertinoIcons.heart, size: 30,),
                  ],
                ),
              ):
              const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Product Detail', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),),
                    Icon(CupertinoIcons.heart_fill, size: 30, color: Colors.red,),
                  ],
                ),
              )
            ),
          );
        }
        
      }
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
                    // _SizeCustom(),
                    // _ColorCustom(),
                    _VariantTitleListCustom(),
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
      height: 650,

      child: Image.asset(
        widget.product.imageURL !,
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
              // Text(widget.product.proGender!, style: const TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),),
              _StarRatingCustom()
            ],
          ),
          const SizedBox(height: 15,),

          Text(widget.product.name!, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }

  Widget _StarRatingCustom(){

    // double ratePoint = double.parse(widget.product.proLiked!);
    double ratePoint = 5.0;

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
            widget.product.description!, 
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

  

  Widget _VariantTitleListCustom(){
    return ListView.builder(
      itemCount: widget.product.variants.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,

      itemBuilder: (BuildContext context, int index){
        return _VariantItemCustom(widget.product.variants[index]);
      }
    );
  }

  Widget _VariantItemCustom(ProductVariants variants){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(right: 20, left: 20, bottom: 20),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(variants.name!.toUpperCase(), style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),),
          _ListVariantValue(variants.id!, variants.name!, variants.name!.toLowerCase()),
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

  int _selectedIndexValue = 0;

  Widget _ListVariantValue(String variantID, String variantName, String type){

    var _lstValue2 = widget.product.variantValues;
    List<VariantsValue> _lstValue = _lstValue2
    .where((value) => value.variant_name==variantName)
    .map((value) => VariantsValue(id: value.id, variant_name: value.variant_name, value: value.value, extra_price: value.extra_price))
    .toList();

    var _lstCombiValue1 = widget.product.combinationValue;
    List<CombinationValue> _lstCombiValue2 = _lstCombiValue1
      .where((value) => value.variants_id==variantID)
      .map((value) => CombinationValue(id: value.id, combination_id: value.combination_id, variants_value_id: value.variants_value_id, variants_id: value.variants_id))
      .toList();

    variantProductChoice = VariantProductChoice(choice: _lstValue, combiChoice: _lstCombiValue2, type: type,);

    return SizedBox(
      width: double.infinity,
      height: 60,
        
      child: variantProductChoice
    );
  }
}