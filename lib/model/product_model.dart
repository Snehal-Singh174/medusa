import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const ProductModel({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });
  @override
  List<Object?> get props =>
      [name, category, imageUrl, price, isRecommended, isPopular];

  static List<ProductModel> products = [
    const ProductModel(
        name: 'Soft Drink #1',
        category: 'Soft Drink',
        imageUrl:
        'https://images.unsplash.com/photo-1517959105821-eaf2591984ca?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHNvZGF8ZW58MHx8MHx8&w=1000&q=80',
        price: 2.99,
        isRecommended: true,
        isPopular: false),
    const ProductModel(
        name: 'Soft Drink #2',
        category: 'Soft Drink',
        imageUrl:
        'https://images.unsplash.com/photo-1556881286-fc6915169721?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c29mdCUyMGRyaW5rfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
        price: 2.99,
        isRecommended: true,
        isPopular: false),
    const ProductModel(
        name: 'Soft Drink #3',
        category: 'Soft Drink',
        imageUrl:
        'https://images.unsplash.com/photo-1527156231393-7023794f363c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y29sZCUyMGRyaW5rc3xlbnwwfHwwfHw%3D&w=1000&q=80',
        price: 2.99,
        isRecommended: false,
        isPopular: true),
    const ProductModel(
        name: 'Smoothies #1',
        category: 'Smoothies',
        imageUrl:
        'https://images.unsplash.com/photo-1600718374662-0483d2b9da44?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHNtb290aGllfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
        price: 2.99,
        isRecommended: true,
        isPopular: false),
    const ProductModel(
        name: 'Smoothies #2',
        category: 'Smoothies',
        imageUrl:
        'https://images.unsplash.com/photo-1589733955941-5eeaf752f6dd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8ZnJ1aXQlMjBzbW9vdGhpZXxlbnwwfHwwfHw%3D&w=1000&q=80',
        price: 2.99,
        isRecommended: false,
        isPopular: true),
  ];
}
