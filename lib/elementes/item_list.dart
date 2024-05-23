
import 'package:clothes_app/elementes/title_seeall.dart';
import 'package:clothes_app/objects/category.dart';
import 'package:flutter/material.dart';


class ItemList extends StatelessWidget {
   ItemList({super.key});

  List<Category> lstCategory = ListCategory.getList();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,

        children: [
          TitleSeeAll(title: 'Newest'),
          
          //list
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: lstCategory.length,
              shrinkWrap: true,
              
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),

                  child: Item(iconData: lstCategory[index].iconData, title: lstCategory[index].TenLSP),
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
  Item({super.key, required this.iconData, required this.title});

  String iconData, title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.amberAccent[700]?.withOpacity(0.5),
              ),
              padding: const EdgeInsets.all(15),
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.minPositive,
                    height: double.minPositive,
                  ),
                  Image.asset(
                    iconData,
                    color: Colors.black,
                    width: 130,
                    height: 150,
                  ),
                  Positioned(
                    top: 0,
                    left: 90,
                    child: InkWell(       
                      child: IconButton(
                      iconSize: 34, // tăng kích thước của hình trái tim
                      splashColor: Colors.transparent, // đặt màu sắc của khung khi nhấn vào nút thành màu trong suốt
                      icon: Icon(Icons.favorite),// hình trái tim
                      color: Colors.grey,
                      onPressed: () {
                      // hành động khi nhấn nút
                      
                      },
      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Text(title, style: TextStyle(fontSize: 20, color: Colors.black),),
            Text(title, style: TextStyle(fontSize: 20, color: Colors.black),),
          ],
        ),
      ),
    );
  }
}