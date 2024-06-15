
import 'package:clothes_app/elementes/item_list.dart';
import 'package:clothes_app/elementes/slider.dart';
import 'package:clothes_app/elementes/typeitem_list.dart';
import 'package:clothes_app/menus/side_menu.dart';
import 'package:clothes_app/objects/user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage>{

  UserAcount user = UserAcount();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: _headerHome(),
      drawer: SideHomeMenu(user: user),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              //slider
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: SliderBanner(),
              ),

              //category list
              Padding(padding: EdgeInsets.all(20), child: TypeItemList(title: 'Shop by category',),),

              //product list 1
              ItemList(title: 'Popular man shirt', categoryId: 1,),
            ],
          ),
        )
      ),
    );
  }


  PreferredSize _headerHome(){
    return PreferredSize(
      preferredSize: const Size.fromHeight(200),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color(0xFF0060FF),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),

        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                children: [
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: (){ 
                        if(scaffoldKey.currentState!.isDrawerOpen){
                          scaffoldKey.currentState!.closeDrawer();
                          //close drawer, if drawer is open
                        }else{
                          scaffoldKey.currentState!.openDrawer();
                          //open drawer, if drawer is closed
                        } 
                      }, 
                      icon: const Icon(Icons.menu, size: 30, color: Colors.white,)
                    ),
                  ),
                  const Expanded(
                    flex: 7,
                    child: Text('Wellcome to MyClothes!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center,),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_bag, size: 30, color: Colors.white,)),
                  )
                ],
              ),

              Container(
                height: 50,
                padding: EdgeInsets.zero,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search, size: 30, color: Colors.black,),
                          hintText: 'Search....',
                          focusColor: Colors.white,
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 0), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), topLeft: Radius.circular(20))),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 0), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), topLeft: Radius.circular(20))),
                        ),
                        onChanged: (value) {
                          
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 20,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color(0xFF003285),
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20))
                          // borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: IconButton(
                          onPressed: (){}, 
                          icon: const Icon(Icons.arrow_forward, size: 30, color: Colors.white,),
                        )
                      )
                    )
                  ],
                )
              )
            ],
          ),
        )
      ),
    );
  }
}