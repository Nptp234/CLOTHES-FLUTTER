import 'dart:ui';

import 'package:clothes_app/menus/bottom_menu.dart';
import 'package:clothes_app/objects/user.dart';
import 'package:clothes_app/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideHomeMenu extends StatelessWidget{

  UserAcount user;
  SideHomeMenu({required this.user});

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                // DrawerHeader(
                //   padding: EdgeInsets.zero,
                //   child: CustomDrawerHeader(),
                // ),
                CustomDrawerHeader(user: user,),

                _TitleMenuItem(title: 'Cart', icon: Icons.shopping_bag, gotoWidget: BottomMenu(child: HomePage()),),
                _TitleMenuItem(title: 'Wishlist', icon: CupertinoIcons.heart_fill, gotoWidget: BottomMenu(child: HomePage()),),
                _TitleMenuItem(title: 'Setting', icon: Icons.settings, gotoWidget: BottomMenu(child: HomePage()),),
              ],
            ),
          ),
          Container(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: _TitleMenuItem(title: 'Logout', icon: Icons.logout, gotoWidget: BottomMenu(child: HomePage()),),
            ),
          )
        ],
      )
    );
  }
}

// ignore: must_be_immutable
class _TitleMenuItem extends StatelessWidget{

  String title;
  IconData icon;
  Widget gotoWidget;
  // int idTitle;
  _TitleMenuItem({required this.title, required this.icon, required this.gotoWidget});
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 20,),
          Text(title),
        ],
      ),
      
      onTap: (){
        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => gotoWidget),
        );
      },
    );
  }
}

class CustomDrawerHeader extends StatelessWidget{

  UserAcount user;
  CustomDrawerHeader({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 25, bottom: 30),
      height: 180,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.blueAccent[700],
              borderRadius: const BorderRadius.horizontal(right: Radius.circular(40))
            ),
          ),

          Container(
            padding: const EdgeInsets.all(20),
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AvatarDrawer(context),
                const SizedBox(height: 15,),
                Text(user.name, style: TextStyle(fontSize: 19, color: Colors.white),),
                Text(user.email, style: TextStyle(fontSize: 17, color: Colors.white),),
              ],
            ),
          ),
          
        ],
      ),
    );
  }

  Widget AvatarDrawer(BuildContext context){
    
    String imgPath = 'assets/arvarta.png';

    
    return ClipRRect(
      borderRadius: BorderRadius.circular(100.0),
      child: Stack(
        children: [
          Container(
            height: 70,
            width: 70,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.grey.shade200.withOpacity(0.3)
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
              child: Image.asset(
                imgPath,
                fit: BoxFit.cover
              ),
            ),
          ),
        ],
      )     
    );
  }
  
}