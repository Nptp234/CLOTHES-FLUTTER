import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';

class SliderBanner extends StatefulWidget{

  SliderBanner({super.key});

  @override
  _SliderBanner createState() => _SliderBanner();
}

class _SliderBanner extends State<SliderBanner>{

  //temp list for slider
  List<Image> carouselItems = [
    Image.asset('assets/banner1.png', fit: BoxFit.fitWidth, width: 400,),
    Image.asset('assets/banner2.png', fit: BoxFit.fitWidth, width: 400,),
    Image.asset('assets/banner3.png', fit: BoxFit.fitWidth, width: 400,),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          CarouselSlider(
            items: carouselItems, 
            options: CarouselOptions(
              autoPlay: true,
              enableInfiniteScroll: true,
              height: 200,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            )
          ),

          DotsIndicator(
            dotsCount: carouselItems.length,
            position: _currentIndex,
            decorator: DotsDecorator(
              activeColor: Color(0xFF2B39B9),
              activeSize: const Size(30.0, 10.0),
              size: const Size(10.0, 10.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}