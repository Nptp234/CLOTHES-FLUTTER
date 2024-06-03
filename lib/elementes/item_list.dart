
import 'package:clothes_app/elementes/alert_popup.dart';
import 'package:clothes_app/elementes/title_seeall.dart';
import 'package:clothes_app/objects/product.dart';
import 'package:clothes_app/screens/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class ItemProductList extends StatelessWidget {
  
  ItemProductList({super.key, required this.lstName});

  String lstName = '';

  final List<Products> lstProduct = ListProduct.getList();

  @override
  Widget build(BuildContext context) {

    //loc danh sach theo category
    List<Products> fillProducts = lstProduct.where((product) => product.proCategory == lstName).toList();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,

        children: [
          TitleSeeAll(title: lstName),
          
          //list
          Container(
            margin: EdgeInsets.all(10),
            height: 700,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: fillProducts.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //row
                mainAxisSpacing: 20.0, //khoang cach giua hang
                crossAxisSpacing: 10.0, //khoang cach giua cot
                childAspectRatio: 1.5,
              ),
              
              itemBuilder: (BuildContext context, int index) {
                
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  
                  child: Item(product: fillProducts[index],),
                );
              }, 
            ),
          )
        ],
        
      ),
    );
  }
}
class Item extends StatelessWidget {

  Item({super.key, required this.product});

  final Products product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: (){
        // AlertPopup(title: product.proName, content: product.proPrices);
        // AlertPopup.ShowAlertPopup(context, product.proName, product.proPrices);
        
        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => ProductDetailPage(product: product)));
      },

      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,

          children: [
            Container(
              height: 250,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(10),
              //   color: Colors.white,
              //   border: Border.all(color: Colors.black),
              // ),

              padding: EdgeInsets.zero,

              child: Stack(
                alignment: Alignment.center,
                children: [

                  SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        product.proImg,
                        fit: BoxFit.fill,
                        filterQuality: FilterQuality.high,
                      ),
                    )
                  ),
                  
                  

                  Positioned(
                    top: 15,
                    right: 15,
                    child: Column(

                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.green[200]?.withOpacity(0.5),
                          ),
                          padding: const EdgeInsets.all(0),

                          child: InkWell(       
                            child: IconButton(
                              iconSize: 25,
                              icon: const Icon(Icons.favorite_border),
                              color: Colors.black,
                              onPressed: () {},
                            ),
                          ),
                        ),

                        const SizedBox(height: 15,),

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.orange[200]?.withOpacity(0.5),
                          ),
                          padding: const EdgeInsets.all(0),

                          child: InkWell(       
                            child: IconButton(
                              iconSize: 25,
                              icon: const Icon(Icons.shopping_bag_outlined),
                              color: Colors.black,
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),

            Text(product.proGender, style: const TextStyle(fontSize: 15, color: Colors.black),),
            Text(product.proName, style: const TextStyle(fontSize: 20, color: Colors.black), overflow: TextOverflow.ellipsis, maxLines: 1,),
            Text('${product.proPrices} VND', style: const TextStyle(fontSize: 20, color: Colors.black),),
          ],
        ),
      );
  }
}