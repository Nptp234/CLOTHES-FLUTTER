import 'package:clothes_app/elementes/slider.dart';
import 'package:clothes_app/elementes/typeitem_list.dart';
import 'package:clothes_app/objects/user.dart';
import 'package:flutter/material.dart';
import 'package:clothes_app/elementes/item_list.dart';

class HomePage extends StatelessWidget{

  User user = User();

  //temp list for slider
  List<Image> carouselItems = [
    Image.network('https://img.freepik.com/free-photo/natures-beauty-captured-colorful-flower-close-up-generative-ai_188544-8593.jpg?size=626&ext=jpg&ga=GA1.1.2082370165.1715990400&semt=sph'),
    Image.network('https://hips.hearstapps.com/hmg-prod/images/close-up-of-blossoming-rose-flower-royalty-free-image-1580853844.jpg'),
    Image.network('https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512_640.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [

          //header
          SliverAppBar(
            pinned: true,
            floating: true,
            elevation: 4.0, //shadow for scrolling up
            title: Text('Wellcome ${user.name}'),

            //icon ben trai title
            leading: IconButton(
              onPressed: () {}, 
              icon: const Icon(Icons.menu)
            ),

            // icon nam ben phai
            actions: [
              IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.shopping_bag)
              ),
              
              const SizedBox(width: 20,),
            ],

          ),

          //body
          SliverFillRemaining(
            hasScrollBody: true,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      //slider/banner
                      // Expanded(flex: 0, child: SliderBanner(),),
                      SliderBanner(),
                      const SizedBox(height: 40,),

                      //search bar
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          prefixIcon: const Icon(Icons.search),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(width: 1,color: Color.fromRGBO(184, 142, 47, 1.000)),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),),
                          contentPadding: const EdgeInsets.all(10),
                        ),
                        
                        style: const TextStyle(fontSize: 15.0, color: Color.fromARGB(255, 0, 0, 0)),
                        
                        onSubmitted: (value) {
                          
                        },
                      ),
                      const SizedBox(height: 40,),

                      //list type item
                      TypeItemList(),

                      //list item
                      ItemProductList(lstName: 'T-Shirt'),
                      ItemProductList(lstName: 'Pant'),
                      ItemProductList(lstName: 'Dress'),




                    ],
                  ),
                )
              ),
            ),
          ),
        ],
      );
  }

}