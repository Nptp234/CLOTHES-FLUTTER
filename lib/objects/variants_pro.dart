class ProductVariants{
  String? id;
  String? name;

  ProductVariants({this.id, this.name});

  ProductVariants.fromJson(Map<dynamic, dynamic> e){
    id = e['id'];
    name = e['Name'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Name'] = name;
    return data;
  }
}

class VariantsValue{
  String? id, variant_name, extra_price, value;

  VariantsValue({this.id, this.variant_name, this.value, this.extra_price});

  VariantsValue.fromJson(Map<dynamic, dynamic> e){
    id = e['id'];
    variant_name = e['VariantName'];
    value = e['Value'];
    extra_price = e['ExtraPrice'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['VariantName'] = variant_name;
    data['Value'] = value;
    data['ExtraPrice'] = extra_price;
    return data;
  }
}