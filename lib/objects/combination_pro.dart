class ProductCombinationVariants{
  String? id, product_id, variants_id;

  ProductCombinationVariants({this.id, this.product_id, this.variants_id});

  ProductCombinationVariants.fromJson(Map<dynamic, dynamic> e){
    id = e['id'];
    product_id = e['ProductID'];
    variants_id = e['VariantID'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ProductID'] = product_id;
    data['VariantID'] = variants_id;
    return data;
  }
}

class CombinationValue{
  String? combination_id, variants_value_id, variants_id, id;

  CombinationValue({this.id, this.combination_id, this.variants_value_id, this.variants_id});

  CombinationValue.fromJson(Map<dynamic, dynamic> e){
    id = e['id'];
    combination_id = e['CombinationID'];
    variants_id = e['VariantID'];
    variants_value_id = e['VariantValueID'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['CombinationID'] = combination_id;
    data['VariantID'] = variants_id;
    data['VariantValueID'] = variants_value_id;
    return data;
  }
}