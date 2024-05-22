import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category{
  String MaLSP='';
  String TenLSP='';
  String iconData;

  Category({required this.MaLSP, required this.TenLSP, required this.iconData});
}

class ListCategory{
  static List<Category> lstCategory = [
    Category(MaLSP: '01', TenLSP: 'T-Shirt', iconData: 'assets/tshirt.png'),
    Category(MaLSP: '02', TenLSP: 'Pant', iconData: 'assets/pants.png'),
    Category(MaLSP: '03', TenLSP: 'Dress', iconData: 'assets/dress.png'),
    Category(MaLSP: '04', TenLSP: 'Jacket', iconData: 'assets/jacket.png'),
    Category(MaLSP: '05', TenLSP: 'Accessory', iconData: 'assets/accessories.png'),
  ];

  static List<Category> getList() => lstCategory;
}