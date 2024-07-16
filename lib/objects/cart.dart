import 'dart:collection';

import 'package:clothes_app/data/json/product_js_action.dart';
import 'package:clothes_app/objects/combination_pro.dart';
import 'package:clothes_app/objects/product_obj.dart';
import 'package:clothes_app/objects/variants_pro.dart';

class Cart{
  int? amount, bill_id;
  String? id;
  double? main_price;

  Product? product;
  List<CartVariant>? lstCartVariant = [];

  int quantity = 0;

  Cart({this.id, this.bill_id, this.amount, this.main_price, this.product, this.lstCartVariant});

  Cart.fromJson(Map<String, dynamic> e){
    id = e['id'];
    bill_id = e['bill_id'];
    amount = e['amount'];
    main_price = double.parse('${e['main_price']}');
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bill_id'] = bill_id;
    data['amount'] = amount;
    data['main_price'] = main_price;
    return data;
  }

  Product getProduct(){
    return product!;
  }

  addCartVariant(CartVariant cartVariant){
    if (!lstCartVariant!.contains(cartVariant)){
      lstCartVariant!.add(cartVariant);
    }
  }

  removeCartVariant(int value_id){
    lstCartVariant!.removeWhere((cartV) => cartV.valuecombi_id == value_id);
  }


}

class CartVariant{
  int? valuecombi_id, id;
  String? cart_id;

  int? variantID, valueID;
  String? variantName, variantValue;

  ProductJSAction productJSAction = ProductJSAction();

  CartVariant({this.id, this.cart_id, this.valuecombi_id});

  CartVariant.fromJson(Map<String, dynamic> e){
    id = e['id'];
    cart_id = e['cart_id'];
    valuecombi_id = e['valuecombi_id'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cart_id'] = cart_id;
    data['valuecombi_id'] = valuecombi_id;
    return data;
  }

  Future<void> getVariantID() async {
    if (productJSAction.listCombinationValue.isEmpty) {
      await productJSAction.getAllListCombinationValue();
    }
    variantID = productJSAction.listCombinationValue
        .firstWhere((valuecombi) => valuecombi.id == valuecombi_id)
        .variants_id;
  }

  Future<void> getValueID() async {
    if (productJSAction.listCombinationValue.isEmpty) {
      await productJSAction.getAllListCombinationValue();
    }
    valueID = productJSAction.listCombinationValue
        .firstWhere((valuecombi) => valuecombi.id == valuecombi_id)
        .variants_value_id;
  }

  Future<void> getVariantName() async {
    await getVariantID();
    await productJSAction.getVariantName(variantID);
    variantName = productJSAction.variantName;
  }

  Future<void> getVariantValue() async {
    await getValueID();
    await productJSAction.getVariantValue(valueID);
    variantValue = productJSAction.variantValue;
  }

}