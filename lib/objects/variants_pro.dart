class ProductVariants{
  int? id;
  String? name;

  ProductVariants({this.id, this.name});

  ProductVariants.fromJson(Map<String, dynamic> e){
    id = e['id'];
    name = e['name'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class VariantsValue{
  int? id, variant_id;
  int? extra_price;
  String? value;

  VariantsValue({this.id, this.variant_id, this.value, this.extra_price});

  VariantsValue.fromJson(Map<String, dynamic> e){
    id = e['id'];
    variant_id = e['variant_id'];
    value = e['value'];
    extra_price = e['extra_price'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['variant_id'] = variant_id;
    data['value'] = value;
    data['extra_price'] = extra_price;
    return data;
  }
}