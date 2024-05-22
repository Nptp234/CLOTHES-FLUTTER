import 'package:carousel_slider/carousel_slider.dart';
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
    Image.network('https://img.freepik.com/free-photo/natures-beauty-captured-colorful-flower-close-up-generative-ai_188544-8593.jpg?size=626&ext=jpg&ga=GA1.1.2082370165.1715990400&semt=sph'),
    Image.network('https://hips.hearstapps.com/hmg-prod/images/close-up-of-blossoming-rose-flower-royalty-free-image-1580853844.jpg'),
    Image.network('https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512_640.jpg'),
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
              height: 270,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
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
          )
        ],
      ),
    );
  }
}