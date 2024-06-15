
class ColorProduct{
  int? id;
  late String? name;
  late int? codeHex;

  ColorProduct({this.name, this.codeHex});

  //get list from json
  ColorProduct.fromJson(Map<String, dynamic> e){
    id = e["id"];
    name = e["name"];
    codeHex = int.parse(e["codeHex"]);
  }

  //set data to json
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['codeHex'] = '$codeHex';
    return data;
  }
}