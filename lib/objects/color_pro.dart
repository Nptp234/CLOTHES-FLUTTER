class ColorProduct{
  String? id;
  String name;
  String? codeARGBDecimal='', codeARGBHex='';
  int codeHex;

  ColorProduct({required this.name, required this.codeHex});
}

class ListColorPro{
  static List<ColorProduct> lstColor = [
    ColorProduct(name: 'Red', codeHex: 0xFFF44336),
    ColorProduct(name: 'Pink', codeHex: 0xFFE91E63),
    ColorProduct(name: 'Orange', codeHex: 0xFFFF9800),
    ColorProduct(name: 'Amber', codeHex: 0xFFFFC107),
  ];

  static List<ColorProduct> getList() => lstColor;
}