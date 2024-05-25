
import 'package:clothes_app/elementes/alert_popup.dart';
import 'package:clothes_app/elementes/title_seeall.dart';
import 'package:clothes_app/objects/product.dart';
import 'package:flutter/material.dart';


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
          SizedBox(
            height: 700,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: fillProducts.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //row
                mainAxisSpacing: 0.0, //khoang cach giua hang
                crossAxisSpacing: 10.0, //khoang cach giua cot
                childAspectRatio: 1.5,
              ),
              
              itemBuilder: (BuildContext context, int index) {
                
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  
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
        AlertPopup(title: product.proName, content: product.proPrices);
        AlertPopup.ShowAlertPopup(context, product.proName, product.proPrices);
      },

      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,

          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Colors.black),
              ),

              padding: const EdgeInsets.all(10),

              child: Stack(
                children: [
                  
                  Image.asset(
                    product.proImg,
                    width: 180,
                    height: 200,
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
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

                        const SizedBox(height: 7,),

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
            Text(product.proName, style: const TextStyle(fontSize: 20, color: Colors.black),),
            Text('${product.proPrices} VND', style: const TextStyle(fontSize: 20, color: Colors.black),),
          ],
        ),
      );
  }
}