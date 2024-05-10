import 'package:flutter/material.dart';

class AlertPopup extends StatelessWidget{

  late String title = '';
  late String content = '';

  AlertPopup({super.key, required this.title, required this.content});

  static void ShowAlertPopup(BuildContext context, String title, String content){
    showDialog(context: context, builder: ((context) => AlertPopup(title: title, content: content)));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: (){Navigator.of(context).pop();}, 
          child: const Text('Close')
          )
      ],
    );
  }

}