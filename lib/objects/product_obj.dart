class Product{
  String? name, description, imageURL, categoryName;
  int? id, price, categoryID;

  Product({this.id, this.name, this.imageURL, this.price, this.categoryID, this.categoryName});

  Product.fromJson(Map<String, dynamic> e){
    id = e['id'];
    name = e['name'];
    description = e['description'];
    imageURL = e['imageURL'];
    price = e['price'];
    categoryID = e['categoryID'];
    categoryName = e['categoryName'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['imageURL'] = imageURL;
    data['price'] = price;
    data['categoryID'] = categoryID;
    data['categoryName'] = categoryName;
    return data;
  }
}