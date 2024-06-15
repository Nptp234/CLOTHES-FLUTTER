
class Category{
  String MaLSP='';
  String TenLSP='';
  String iconData;
  String image;

  Category({required this.MaLSP, required this.TenLSP, required this.iconData, required this.image});
}

class ListCategory{
  static List<Category> lstCategory = [
    Category(MaLSP: '01', TenLSP: 'T-Shirt', iconData: 'assets/tshirt.png', image: 'assets/imgFiles/t-shirt.png'),
    Category(MaLSP: '02', TenLSP: 'Pant', iconData: 'assets/pants.png', image: 'assets/imgFiles/long-pant.png'),
    Category(MaLSP: '03', TenLSP: 'Dress', iconData: 'assets/dress.png', image: 'assets/imgFiles/dress.png'),
    Category(MaLSP: '04', TenLSP: 'Jacket', iconData: 'assets/jacket.png', image: 'assets/imgFiles/jacket.png'),
    Category(MaLSP: '05', TenLSP: 'Accessory', iconData: 'assets/accessories.png', image: 'assets/imgFiles/glasses.png'),
  ];

  static List<Category> getList() => lstCategory;
}