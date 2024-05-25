class Products{

  String proName = '';
  String proPrices = '';
  String proGender = '';
  String proCategory = '';
  String proUpDate = '';
  String proLiked = '';
  String proImg = '';
  
  Products({
    required this.proName, 
    required this.proCategory, 
    required this.proPrices, 
    required this.proGender, 
    required this.proImg,
    required this.proUpDate,
    required this.proLiked,
  });

}

class ListProduct{

  static List<Products> lstProduct = [
    Products(proName: 'Shirt 1', proCategory: 'T-Shirt', proPrices: '50000', proGender: 'Male', proImg: 'assets/t_shirt_img.png', proUpDate: '25', proLiked: '10'),
    Products(proName: 'Shirt 2', proCategory: 'T-Shirt', proPrices: '50000', proGender: 'Male', proImg: 'assets/t_shirt_img.png', proUpDate: '25', proLiked: '10'),
    Products(proName: 'Shirt 3', proCategory: 'T-Shirt', proPrices: '50000', proGender: 'Female', proImg: 'assets/t_shirt_img.png', proUpDate: '25', proLiked: '10'),
    Products(proName: 'Shirt 4', proCategory: 'T-Shirt', proPrices: '50000', proGender: 'Female', proImg: 'assets/t_shirt_img.png', proUpDate: '25', proLiked: '10'),
    Products(proName: 'Shirt 5', proCategory: 'T-Shirt', proPrices: '50000', proGender: 'Female', proImg: 'assets/t_shirt_img.png', proUpDate: '25', proLiked: '10'),

    Products(proName: 'Pant 1', proCategory: 'Pant', proPrices: '30000', proGender: 'Male', proImg: 'assets/pant_img.png', proUpDate: '25', proLiked: '10'),
    Products(proName: 'Pant 2', proCategory: 'Pant', proPrices: '30000', proGender: 'Male', proImg: 'assets/pant_img.png', proUpDate: '25', proLiked: '10'),
    Products(proName: 'Pant 3', proCategory: 'Pant', proPrices: '30000', proGender: 'Female', proImg: 'assets/pant_img.png', proUpDate: '25', proLiked: '10'),
    Products(proName: 'Pant 4', proCategory: 'Pant', proPrices: '30000', proGender: 'Female', proImg: 'assets/pant_img.png', proUpDate: '25', proLiked: '10'),
    Products(proName: 'Pant 5', proCategory: 'Pant', proPrices: '30000', proGender: 'Female', proImg: 'assets/pant_img.png', proUpDate: '25', proLiked: '10'),
    
    Products(proName: 'Dress 1', proCategory: 'Dress', proPrices: '30000', proGender: 'Female', proImg: 'assets/dress_img.png', proUpDate: '25', proLiked: '10'),
    Products(proName: 'Dress 2', proCategory: 'Dress', proPrices: '30000', proGender: 'Female', proImg: 'assets/dress_img.png', proUpDate: '25', proLiked: '10'),
    Products(proName: 'Dress 3', proCategory: 'Dress', proPrices: '30000', proGender: 'Female', proImg: 'assets/dress_img.png', proUpDate: '25', proLiked: '10'),
    Products(proName: 'Dress 4', proCategory: 'Dress', proPrices: '30000', proGender: 'Female', proImg: 'assets/dress_img.png', proUpDate: '25', proLiked: '10'),
    Products(proName: 'Dress 5', proCategory: 'Dress', proPrices: '30000', proGender: 'Female', proImg: 'assets/dress_img.png', proUpDate: '25', proLiked: '10'),
  ];

  static List<Products> getList() => lstProduct;

}