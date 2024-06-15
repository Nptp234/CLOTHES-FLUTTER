class SizeProduct{
  int? id;
  String? name, detail;
  SizeProduct({this.name});

  //get list from json
  SizeProduct.fromJson(Map<String, dynamic> e){
    id = e["id"];
    name = e["name"];
    detail = e["detail"];
  }

  //set data to json
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['detail'] = detail;
    return data;
  }
}