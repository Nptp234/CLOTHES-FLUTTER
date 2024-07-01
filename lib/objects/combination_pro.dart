class ProductCombinationVariants{
  int? id, product_id, variants_id;

  ProductCombinationVariants({this.id, this.product_id, this.variants_id});

  ProductCombinationVariants.fromJson(Map<String, dynamic> e){
    id = e['id'];
    product_id = e['product_id'];
    variants_id = e['variants_id'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = product_id;
    data['variants_id'] = variants_id;
    return data;
  }
}

class CombinationValue{
  int? combination_id, variants_value_id, variants_id;

  CombinationValue({this.combination_id, this.variants_value_id, this.variants_id});

  CombinationValue.fromJson(Map<String, dynamic> e){
    combination_id = e['combination_id'];
    variants_id = e['variants_id'];
    variants_value_id = e['variants_value_id'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['combination_id'] = combination_id;
    data['variants_id'] = variants_id;
    data['variants_value_id'] = variants_value_id;
    return data;
  }
}