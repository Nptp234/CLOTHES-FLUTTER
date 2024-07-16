class DeliveryAddress{
  String? name, address, phone;
  int? id;

  DeliveryAddress({this.id, this.name, this.address, this.phone});

  DeliveryAddress.fromJson(Map<String, dynamic> e){
    id = e['id'];
    name = e['name'];
    address = e['address'];
    phone = e['phone'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['phone'] = phone;
    return data;
  }
}