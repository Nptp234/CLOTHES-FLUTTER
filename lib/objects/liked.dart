class LikedProduct{
  int? productID, userID;
  
  LikedProduct({this.productID, this.userID});

  LikedProduct.fromJson(Map<String, dynamic> e){
    productID = int.parse(e['product_id']);
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productID'] = productID;
    return data;
  }
}