import 'package:clothes_app/objects/combination_pro.dart';
import 'package:clothes_app/objects/variants_pro.dart';
import 'package:clothes_app/screens/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/v4.dart';

class VariantProductChoice extends StatefulWidget{

  final List<VariantsValue> choice;
  final List<CombinationValue> combiChoice;
  String? type;
  

  VariantProductChoice({required this.choice, required this.combiChoice, this.type});

  _VariantProductChoice createState() => _VariantProductChoice();
}

class _VariantProductChoice extends State<VariantProductChoice>{


  VariantsValue? selectedValue;

  void setSelectedValue(VariantsValue? value){
    setState(() {
      selectedValue = value;
    });
  }

  addVariantCart(int index, bool isChange){
    if(widget.combiChoice.isNotEmpty){
      ProductDetailPage.lstChoice.removeWhere((item) => item.variants_id == widget.combiChoice[index].variants_id);
      ProductDetailPage.lstChoice.add(widget.combiChoice[index]);
      ProductDetailPage.changeVariant = isChange;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProductDetailPage.lstChoice = [];
    setState(() {
      addVariantCart(0, false);
    });
  }
  
  int? _value=0;

  @override
  Widget build(BuildContext context) {
    return InlineChoice<VariantsValue>.single(
      clearable: true,
      value: selectedValue,
      onChanged: setSelectedValue,
      itemCount: widget.choice.isNotEmpty?widget.choice.length:0, 
      itemBuilder: (selection, index){

        Color colorName = Colors.transparent;
        if (widget.type=='color'){
          String? value = '${widget.choice[index].value}';
          colorName = Color(int.parse(value));
        }

        // bool isSelected = selection.selected(widget.choice[index]);
        // _value=0;
        bool isSelected = _value==index;
        // bool onSelect = false;

        return ChoiceChip(
            selected: isSelected,
            onSelected: (bool selected){
              setState((){
                // ProductDetailPage.cart.id = Uuid().v4();
                _value = selected ? index : 0;
                addVariantCart(index, true);
              });
            },
            // selection.onSelected(widget.choice[index]),

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