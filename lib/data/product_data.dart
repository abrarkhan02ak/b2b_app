import '../models/product.dart';

final List<Product> products = [
  Product(
    code: 'P001',
    name: 'Face Cream',
    price: '₹120',
    category: 'Cosmetics',
    image: 'assets/images/facecream.jpg',
    description: 'Skin Care Face Cream',
    stock: 50,
  ),
  Product(
    code: 'P002',
    name: 'Shampoo',
    price: '₹180',
    category: 'Hair Care',
    image: 'assets/images/shampoo.jpg',
    description: 'Hair Care Shampoo',
    stock: 30,
  ),
  Product(
    code: 'P003',
    name: 'Soap',
    price: '₹40',
    category: 'Bath',
    image: 'assets/images/soap.jpg',
    description: 'Bath Soap',
    stock: 100,
  ),
];
