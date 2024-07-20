class LikedProduct{
  String? productID, userID;
  
  LikedProduct({this.productID, this.userID});

  LikedProduct.fromJson(Map<dynamic, dynamic> e){
    productID = e['product_id'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productID'] = productID;
    return data;
  }
}