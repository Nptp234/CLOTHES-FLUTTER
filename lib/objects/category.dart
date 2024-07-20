
class Category{
  String? MaLSP='';
  String? TenLSP='';
  String? iconData;

  Category({this.MaLSP, this.TenLSP, this.iconData});

  //get data from json
  Category.fromJson(Map<String, dynamic> e){
    MaLSP = e['id'];
    TenLSP = e['Name'];
    iconData = e['Img'];
  }

  //set data to json
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = MaLSP;
    data['Name'] = TenLSP;
    data['Img'] = iconData;
    return data;
  }
}