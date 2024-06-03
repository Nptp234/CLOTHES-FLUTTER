import 'package:flutter/material.dart';

class TitleSeeAll extends StatelessWidget{

  TitleSeeAll({super.key, required this.title});

  late String title = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(title, style: TextStyle(fontSize: 25, color:Colors.black, fontWeight: FontWeight.bold),),
          TextButton(
            onPressed: () {}, 
            child: const Text('See more', style: TextStyle(color: Color.fromRGBO(184, 142, 47, 1.000), fontSize: 20),)
          )
        ],
      ),
    );
  }

}