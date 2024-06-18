import 'package:clothes_app/elementes/typeitem_list.dart';
import 'package:clothes_app/objects/category.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget{

  _CategoryPage createState() => _CategoryPage();
}

class _CategoryPage extends State<CategoryPage>{

  
  List<Category> lstCategory = ListCategory.getList();


  //gender=0 is women
  //gender=1 is man
  int? _gender=0;
  void _changeList(){
    switch(_gender){
      case 0:
        setState(() {
          _gender = 1;
        });
        break;
      case 1:
        setState(() {
          _gender = 0;
        });
        break;
      default:
        setState(() {
          _gender = 0;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //header
      appBar: _CustomHeader(),

      //body
      body: SingleChildScrollView(scrollDirection: Axis.vertical, child: _CustomBody(),),
    );
  }

  PreferredSize _CustomHeader(){
    return PreferredSize(
      //height of header
      preferredSize: Size.fromHeight(230), 

      // header body
      child: Container(
        //header have 2 parts
        //1 is search bar
        //2 is category list

        //custom style of header using Container Widget
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 10.0, color: Colors.grey)
          ]
        ),
        padding: EdgeInsets.only(top: 40, left: 20, right: 20),

        //content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            //search bar
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search, size: 30, color: Colors.black,),
                hintText: 'Search....',
                hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                labelStyle: TextStyle(fontSize: 20, color: Colors.grey),
                focusColor: Colors.white,
                fillColor: Colors.grey,
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 0), borderRadius: BorderRadius.all(Radius.circular(20))),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 0), borderRadius: BorderRadius.all(Radius.circular(20))),
              ),

              onChanged: (value){

              },
            ),
            
            //category list
            TypeItemList(title: '',)
          ],
        ),
      )
    );
  }

  Widget _CustomBody(){
    return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 50),

        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,

            children: [
              //button gender
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  //women
                  GestureDetector(
                    onTap: () => _changeList(),
                    child: Container(
                      width: 170,
                      height: 50,
                      decoration: BoxDecoration(
                        color: _gender==0?Color(0xFF0060FF):Colors.grey[300],
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                      ),
                      child: Center(child: Text('Women', style: TextStyle(fontSize: 20, color: _gender==0?Colors.white:Color(0xFF000000)),),),
                    ),
                  ),
                  //man
                  GestureDetector(
                    onTap: () => _changeList(),
                    child: Container(
                      width: 170,
                      height: 50,
                      decoration: BoxDecoration(
                        color: _gender==1?Color(0xFF0060FF):Colors.grey[300],
                        borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
                      ),
                      child: Center(child: Text('Man', style: TextStyle(fontSize: 20, color: _gender==1?Colors.white:Color(0xFF000000)),),),
                    ),
                  ),
                ],
              ),
              //list category
              // SingleChildScrollView(child: _CustomListCategory(), scrollDirection: Axis.vertical,)
              Container(
                child: _CustomListCategory(),
              )
            ],
          ),
        );
  }

  Widget _CustomListCategory(){
    return GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: lstCategory.length,
        shrinkWrap: true,
        physics: ScrollPhysics(),

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 0.0, //khoang cach giua hang
          crossAxisSpacing: 5.0, //khoang cach giua cot
          childAspectRatio: 0.8,
        ), 
        itemBuilder: (BuildContext context, int index){
          return  _CategoryItem(lstCategory[index],);
        },
      );
  }

  Widget _CategoryItem(Category category){
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
        width: 70,
        height: 100,
        margin: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Container(
                width: double.infinity,
                height: 170,
                padding: EdgeInsets.zero,

                child: Image.asset(category.image, fit: BoxFit.cover,),
              ),
              const SizedBox(height: 10,),
              Text(category.TenLSP, style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.w500),)
            ],
          ),
        ),
      ),
    );
  }
}