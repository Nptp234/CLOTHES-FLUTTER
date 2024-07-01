import 'package:clothes_app/objects/variants_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:choice/choice.dart';
import 'package:flutter/material.dart';

class VariantProductChoice extends StatefulWidget{

  final List<VariantsValue> choice;
  String? type;

  VariantProductChoice({required this.choice, this.type});

  _VariantProductChoice createState() => _VariantProductChoice();
}

class _VariantProductChoice extends State<VariantProductChoice>{


  VariantsValue? selectedValue;

  void setSelectedValue(VariantsValue? value){
    setState(() {
      selectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InlineChoice<VariantsValue>.single(
      clearable: true,
      value: selectedValue,
      onChanged: setSelectedValue,
      itemCount: widget.choice.length, 
      itemBuilder: (selection, index){

        Color colorName = Colors.transparent;
        if (widget.type=='color'){
          String? value = '${widget.choice[index].value}';
          colorName = Color(int.parse(value));
        }

        bool isSelected = selection.selected(widget.choice[index]);

        return ChoiceChip(
          selected: selection.selected(widget.choice[index]),
          onSelected: selection.onSelected(widget.choice[index]),
          selectedColor: Color(0xFF0060FF),
          showCheckmark: false,
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
          label: widget.type=='color'?
          Container(
            width: 24, // Adjust size as needed
            height: 24, // Adjust size as needed
            decoration: BoxDecoration(
              color: colorName,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.transparent,
                width: 2,
              ),
            ),
          )
          :Text(widget.choice[index].value!.toUpperCase()),
        );
      },

      listBuilder: ChoiceList.createScrollable(
        spacing: 10,
        direction: Axis.horizontal,
        runSpacing: 10,
      ),
    );
  }

}