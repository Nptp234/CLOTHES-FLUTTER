class SizeProduct{
  String? id, detail;
  String name;
  SizeProduct({required this.name});
}

class ListSizeProduct{
  static List<SizeProduct> lstSizedPro = [
    SizeProduct(name: 'S'),
    SizeProduct(name: 'M'),
    SizeProduct(name: 'L'),
    SizeProduct(name: 'XL'),
    SizeProduct(name: 'XXL'),
    SizeProduct(name: 'UL'),
  ];

  static List<SizeProduct> getList() => lstSizedPro;
}