import '../models/product.dart';

final List<Product> products = [
  Product(
    code: 'P001',
    name: 'Face Cream',
    price: '120',
    category: 'Cosmetics',
    image: 'assets/images/facecream.jpg',
    description: 'Skin Care Face Cream',
    stock: 50,
  ),

  Product(
    code: 'P002',
    name: 'Shampoo',
    price: '180',
    category: 'Hair Care',
    image: 'assets/images/shampoo.jpg',
    description: 'Hair Care Shampoo',
    stock: 30,
  ),

  Product(
    code: 'P003',
    name: 'Bath Soap',
    price: '40',
    category: 'Bath',
    image: 'assets/images/soap.jpg',
    description: 'Quality Bath Soap',
    stock: 100,
  ),

  Product(
    code: 'P004',
    name: 'Hair Oil',
    price: '150',
    category: 'Hair Care',
    image: '',
    description: 'Natural Hair Oil',
    stock: 60,
  ),

  Product(
    code: 'P005',
    name: 'Toothpaste',
    price: '90',
    category: 'Dental Care',
    image: '',
    description: 'Fresh Mint Toothpaste',
    stock: 70,
  ),

  Product(
    code: 'P006',
    name: 'Perfume',
    price: '300',
    category: 'Fragrance',
    image: '',
    description: 'Long Lasting Perfume',
    stock: 40,
  ),
];
