import 'package:clothes_app/objects/color_pro.dart';
import 'package:clothes_app/objects/size_pro.dart';

class Products{

  String proName = '';
  String proPrices = '';
  String proGender = '';
  String proCategory = '';
  String proUpDate = '';
  String proLiked = '';
  String proImg = '';
  String proDes = '';
  List<ColorProduct> lstColor = [];
  List<SizeProduct> lstSize = [];
  
  Products({
    required this.proName, 
    required this.proCategory, 
    required this.proPrices, 
    required this.proGender, 
    required this.proDes,
    required this.proImg,
    required this.proUpDate,
    required this.proLiked,
    required this.lstColor,
    required this.lstSize,
  });

}

class ListProduct{

  static List<Products> lstProduct = [
    Products(proName: 'Gloria Vanderbilt Women Amanda Classic High Rise Tapered Jean', proCategory: 'T-Shirt', proPrices: '500000000000', proGender: 'Male',
    proDes: 'Casual shirt to wear out alert! Check out our new all-cotton flannel shirt! This shirt is made from 100% cotton, making it soft to the touch and gentle on the skin. The long-sleeve design is perfect for those cooler days or nights, while the button-up closure makes it easy to take on and off. The plaid design is perfect for any casual occasion, whether going to a barbecue or running errands. The shirt is made in Italy, so you know you’re getting a high-quality product.', 
    proImg: 'assets/img_detail.png', proUpDate: '25', proLiked: '10',
    lstColor: [ListColorPro.getList()[0], ListColorPro.getList()[1], ListColorPro.getList()[2], ListColorPro.getList()[3]],
    lstSize: [ListSizeProduct.getList()[0],ListSizeProduct.getList()[1],ListSizeProduct.getList()[2],ListSizeProduct.getList()[3],ListSizeProduct.getList()[4],ListSizeProduct.getList()[5]]),
    Products(proName: 'Shirt 2', proCategory: 'T-Shirt', proPrices: '50000', proGender: 'Male', 
    proDes: 'Casual shirt to wear out alert! Check out our new all-cotton flannel shirt! This shirt is made from 100% cotton, making it soft to the touch and gentle on the skin. The long-sleeve design is perfect for those cooler days or nights, while the button-up closure makes it easy to take on and off. The plaid design is perfect for any casual occasion, whether going to a barbecue or running errands. The shirt is made in Italy, so you know you’re getting a high-quality product.', 
    proImg: 'assets/t_shirt_img.png', proUpDate: '25', proLiked: '10',
    lstColor: [ListColorPro.getList()[2], ListColorPro.getList()[3]],
    lstSize: [ListSizeProduct.getList()[0],ListSizeProduct.getList()[1],ListSizeProduct.getList()[2],ListSizeProduct.getList()[3],ListSizeProduct.getList()[4],ListSizeProduct.getList()[5]]),
    Products(proName: 'Shirt 3', proCategory: 'T-Shirt', proPrices: '50000', proGender: 'Female', 
    proDes: 'Casual shirt to wear out alert! Check out our new all-cotton flannel shirt! This shirt is made from 100% cotton, making it soft to the touch and gentle on the skin. The long-sleeve design is perfect for those cooler days or nights, while the button-up closure makes it easy to take on and off. The plaid design is perfect for any casual occasion, whether going to a barbecue or running errands. The shirt is made in Italy, so you know you’re getting a high-quality product.', 
    proImg: 'assets/t_shirt_img.png', proUpDate: '25', proLiked: '10',
    lstColor: [ListColorPro.getList()[3], ListColorPro.getList()[2]],
    lstSize: [ListSizeProduct.getList()[0],ListSizeProduct.getList()[1],ListSizeProduct.getList()[2],ListSizeProduct.getList()[3],ListSizeProduct.getList()[4],ListSizeProduct.getList()[5]]),
    Products(proName: 'Shirt 4', proCategory: 'T-Shirt', proPrices: '50000', proGender: 'Female', 
    proDes: 'Casual shirt to wear out alert! Check out our new all-cotton flannel shirt! This shirt is made from 100% cotton, making it soft to the touch and gentle on the skin. The long-sleeve design is perfect for those cooler days or nights, while the button-up closure makes it easy to take on and off. The plaid design is perfect for any casual occasion, whether going to a barbecue or running errands. The shirt is made in Italy, so you know you’re getting a high-quality product.', 
    proImg: 'assets/t_shirt_img.png', proUpDate: '25', proLiked: '10',
    lstColor: [ListColorPro.getList()[0], ListColorPro.getList()[1], ListColorPro.getList()[2], ListColorPro.getList()[3]],
    lstSize: [ListSizeProduct.getList()[0],ListSizeProduct.getList()[1],ListSizeProduct.getList()[2],ListSizeProduct.getList()[3],ListSizeProduct.getList()[4],ListSizeProduct.getList()[5]]),
    Products(proName: 'Shirt 5', proCategory: 'T-Shirt', proPrices: '50000', proGender: 'Female', 
    proDes: 'Casual shirt to wear out alert! Check out our new all-cotton flannel shirt! This shirt is made from 100% cotton, making it soft to the touch and gentle on the skin. The long-sleeve design is perfect for those cooler days or nights, while the button-up closure makes it easy to take on and off. The plaid design is perfect for any casual occasion, whether going to a barbecue or running errands. The shirt is made in Italy, so you know you’re getting a high-quality product.', 
    proImg: 'assets/t_shirt_img.png', proUpDate: '25', proLiked: '10',
    lstColor: [ListColorPro.getList()[1], ListColorPro.getList()[2]],
    lstSize: [ListSizeProduct.getList()[0],ListSizeProduct.getList()[1],ListSizeProduct.getList()[2],ListSizeProduct.getList()[3],ListSizeProduct.getList()[4],ListSizeProduct.getList()[5]]),

    Products(proName: 'Pant 1', proCategory: 'Pant', proPrices: '30000', proGender: 'Male', 
    proDes: 'Casual shirt to wear out alert! Check out our new all-cotton flannel shirt! This shirt is made from 100% cotton, making it soft to the touch and gentle on the skin. The long-sleeve design is perfect for those cooler days or nights, while the button-up closure makes it easy to take on and off. The plaid design is perfect for any casual occasion, whether going to a barbecue or running errands. The shirt is made in Italy, so you know you’re getting a high-quality product.', 
    proImg: 'assets/pant_img.png', proUpDate: '25', proLiked: '10',
    lstColor: [ListColorPro.getList()[1], ListColorPro.getList()[2]],
    lstSize: [ListSizeProduct.getList()[0],ListSizeProduct.getList()[1],ListSizeProduct.getList()[2],ListSizeProduct.getList()[3],ListSizeProduct.getList()[4],ListSizeProduct.getList()[5]]),
    Products(proName: 'Pant 2', proCategory: 'Pant', proPrices: '30000', proGender: 'Male', 
    proDes: 'Casual shirt to wear out alert! Check out our new all-cotton flannel shirt! This shirt is made from 100% cotton, making it soft to the touch and gentle on the skin. The long-sleeve design is perfect for those cooler days or nights, while the button-up closure makes it easy to take on and off. The plaid design is perfect for any casual occasion, whether going to a barbecue or running errands. The shirt is made in Italy, so you know you’re getting a high-quality product.', 
    proImg: 'assets/pant_img.png', proUpDate: '25', proLiked: '10',
    lstColor: [ListColorPro.getList()[1], ListColorPro.getList()[2]],
    lstSize: [ListSizeProduct.getList()[0],ListSizeProduct.getList()[1],ListSizeProduct.getList()[2],ListSizeProduct.getList()[3],ListSizeProduct.getList()[4],ListSizeProduct.getList()[5]]),
    Products(proName: 'Pant 3', proCategory: 'Pant', proPrices: '30000', proGender: 'Female', 
    proDes: 'Casual shirt to wear out alert! Check out our new all-cotton flannel shirt! This shirt is made from 100% cotton, making it soft to the touch and gentle on the skin. The long-sleeve design is perfect for those cooler days or nights, while the button-up closure makes it easy to take on and off. The plaid design is perfect for any casual occasion, whether going to a barbecue or running errands. The shirt is made in Italy, so you know you’re getting a high-quality product.', 
    proImg: 'assets/pant_img.png', proUpDate: '25', proLiked: '10',
    lstColor: [ListColorPro.getList()[1], ListColorPro.getList()[2]],
    lstSize: [ListSizeProduct.getList()[0],ListSizeProduct.getList()[1],ListSizeProduct.getList()[2],ListSizeProduct.getList()[3],ListSizeProduct.getList()[4],ListSizeProduct.getList()[5]]),
    Products(proName: 'Pant 4', proCategory: 'Pant', proPrices: '30000', proGender: 'Female', 
    proDes: 'Casual shirt to wear out alert! Check out our new all-cotton flannel shirt! This shirt is made from 100% cotton, making it soft to the touch and gentle on the skin. The long-sleeve design is perfect for those cooler days or nights, while the button-up closure makes it easy to take on and off. The plaid design is perfect for any casual occasion, whether going to a barbecue or running errands. The shirt is made in Italy, so you know you’re getting a high-quality product.', 
    proImg: 'assets/pant_img.png', proUpDate: '25', proLiked: '10',
    lstColor: [ListColorPro.getList()[1], ListColorPro.getList()[2]],
    lstSize: [ListSizeProduct.getList()[0],ListSizeProduct.getList()[1],ListSizeProduct.getList()[2],ListSizeProduct.getList()[3],ListSizeProduct.getList()[4],ListSizeProduct.getList()[5]]),
    Products(proName: 'Pant 5', proCategory: 'Pant', proPrices: '30000', proGender: 'Female', 
    proDes: 'Casual shirt to wear out alert! Check out our new all-cotton flannel shirt! This shirt is made from 100% cotton, making it soft to the touch and gentle on the skin. The long-sleeve design is perfect for those cooler days or nights, while the button-up closure makes it easy to take on and off. The plaid design is perfect for any casual occasion, whether going to a barbecue or running errands. The shirt is made in Italy, so you know you’re getting a high-quality product.', 
    proImg: 'assets/pant_img.png', proUpDate: '25', proLiked: '10',
    lstColor: [ListColorPro.getList()[1], ListColorPro.getList()[2]],
    lstSize: [ListSizeProduct.getList()[0],ListSizeProduct.getList()[1],ListSizeProduct.getList()[2],ListSizeProduct.getList()[3],ListSizeProduct.getList()[4],ListSizeProduct.getList()[5]]),
    
    Products(proName: 'Dress 1', proCategory: 'Dress', proPrices: '30000', proGender: 'Female', 
    proDes: 'Casual shirt to wear out alert! Check out our new all-cotton flannel shirt! This shirt is made from 100% cotton, making it soft to the touch and gentle on the skin. The long-sleeve design is perfect for those cooler days or nights, while the button-up closure makes it easy to take on and off. The plaid design is perfect for any casual occasion, whether going to a barbecue or running errands. The shirt is made in Italy, so you know you’re getting a high-quality product.', 
    proImg: 'assets/dress_img.png', proUpDate: '25', proLiked: '10',
    lstColor: [ListColorPro.getList()[1], ListColorPro.getList()[2]],
    lstSize: [ListSizeProduct.getList()[0],ListSizeProduct.getList()[1],ListSizeProduct.getList()[2],ListSizeProduct.getList()[3],ListSizeProduct.getList()[4],ListSizeProduct.getList()[5]]),
    Products(proName: 'Dress 2', proCategory: 'Dress', proPrices: '30000', proGender: 'Female', 
    proDes: 'Casual shirt to wear out alert! Check out our new all-cotton flannel shirt! This shirt is made from 100% cotton, making it soft to the touch and gentle on the skin. The long-sleeve design is perfect for those cooler days or nights, while the button-up closure makes it easy to take on and off. The plaid design is perfect for any casual occasion, whether going to a barbecue or running errands. The shirt is made in Italy, so you know you’re getting a high-quality product.', 
    proImg: 'assets/dress_img.png', proUpDate: '25', proLiked: '10',
    lstColor: [ListColorPro.getList()[1], ListColorPro.getList()[2]],
    lstSize: [ListSizeProduct.getList()[0],ListSizeProduct.getList()[1],ListSizeProduct.getList()[2],ListSizeProduct.getList()[3],ListSizeProduct.getList()[4],ListSizeProduct.getList()[5]]),
    Products(proName: 'Dress 3', proCategory: 'Dress', proPrices: '30000', proGender: 'Female', 
    proDes: 'Casual shirt to wear out alert! Check out our new all-cotton flannel shirt! This shirt is made from 100% cotton, making it soft to the touch and gentle on the skin. The long-sleeve design is perfect for those cooler days or nights, while the button-up closure makes it easy to take on and off. The plaid design is perfect for any casual occasion, whether going to a barbecue or running errands. The shirt is made in Italy, so you know you’re getting a high-quality product.', 
    proImg: 'assets/dress_img.png', proUpDate: '25', proLiked: '10',
    lstColor: [ListColorPro.getList()[1], ListColorPro.getList()[2]],
    lstSize: [ListSizeProduct.getList()[0],ListSizeProduct.getList()[1],ListSizeProduct.getList()[2],ListSizeProduct.getList()[3],ListSizeProduct.getList()[4],ListSizeProduct.getList()[5]]),
    Products(proName: 'Dress 4', proCategory: 'Dress', proPrices: '30000', proGender: 'Female', 
    proDes: 'Casual shirt to wear out alert! Check out our new all-cotton flannel shirt! This shirt is made from 100% cotton, making it soft to the touch and gentle on the skin. The long-sleeve design is perfect for those cooler days or nights, while the button-up closure makes it easy to take on and off. The plaid design is perfect for any casual occasion, whether going to a barbecue or running errands. The shirt is made in Italy, so you know you’re getting a high-quality product.', 
    proImg: 'assets/dress_img.png', proUpDate: '25', proLiked: '10',
    lstColor: [ListColorPro.getList()[1], ListColorPro.getList()[2]],
    lstSize: [ListSizeProduct.getList()[0],ListSizeProduct.getList()[1],ListSizeProduct.getList()[2],ListSizeProduct.getList()[3],ListSizeProduct.getList()[4],ListSizeProduct.getList()[5]]),
    Products(proName: 'Dress 5', proCategory: 'Dress', proPrices: '30000', proGender: 'Female', 
    proDes: 'Casual shirt to wear out alert! Check out our new all-cotton flannel shirt! This shirt is made from 100% cotton, making it soft to the touch and gentle on the skin. The long-sleeve design is perfect for those cooler days or nights, while the button-up closure makes it easy to take on and off. The plaid design is perfect for any casual occasion, whether going to a barbecue or running errands. The shirt is made in Italy, so you know you’re getting a high-quality product.', 
    proImg: 'assets/dress_img.png', proUpDate: '25', proLiked: '10',
    lstColor: [ListColorPro.getList()[1], ListColorPro.getList()[2]],
    lstSize: [ListSizeProduct.getList()[0],ListSizeProduct.getList()[1],ListSizeProduct.getList()[2],ListSizeProduct.getList()[3],ListSizeProduct.getList()[4],ListSizeProduct.getList()[5]]),
  ];

  static List<Products> getList() => lstProduct;

}