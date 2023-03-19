import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class ProductModel extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String category;
  @HiveField(3)
  final String imageUrl;
  @HiveField(4)
  final double price;
  @HiveField(5)
  final bool isRecommended;
  @HiveField(6)
  final bool isPopular;

  const ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });

  @override
  List<Object?> get props =>
      [id, name, category, imageUrl, price, isRecommended, isPopular];

  static ProductModel fromSnapShot(DocumentSnapshot snap) {
    final ProductModel products = ProductModel(
        id: snap['id'],
        name: snap['name'],
        category: snap['category'],
        imageUrl: snap['imageUrl'],
        price: snap['price'],
        isRecommended: snap['isRecommended'],
        isPopular: snap['isPopular']);

    return products;
  }

  static List<ProductModel> products = [
    const ProductModel(
        id: '0',
        name: 'Soft Drink #1',
        category: 'Soft Drinks',
        imageUrl:
            'https://images.unsplash.com/photo-1517959105821-eaf2591984ca?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHNvZGF8ZW58MHx8MHx8&w=1000&q=80',
        price: 2.99,
        isRecommended: true,
        isPopular: false),
    const ProductModel(
        id: '1',
        name: 'Soft Drink #2',
        category: 'Soft Drinks',
        imageUrl:
            'https://images.unsplash.com/photo-1556881286-fc6915169721?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c29mdCUyMGRyaW5rfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
        price: 2.99,
        isRecommended: true,
        isPopular: false),
    const ProductModel(
        id: '2',
        name: 'Soft Drink #3',
        category: 'Soft Drinks',
        imageUrl:
            'https://images.unsplash.com/photo-1527156231393-7023794f363c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y29sZCUyMGRyaW5rc3xlbnwwfHwwfHw%3D&w=1000&q=80',
        price: 2.99,
        isRecommended: false,
        isPopular: true),
    const ProductModel(
        id: '3',
        name: 'Smoothies #1',
        category: 'Smoothies',
        imageUrl:
            'https://images.unsplash.com/photo-1600718374662-0483d2b9da44?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHNtb290aGllfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
        price: 2.99,
        isRecommended: true,
        isPopular: false),
    const ProductModel(
        id: '4',
        name: 'Smoothies #2',
        category: 'Smoothies',
        imageUrl:
            'https://images.unsplash.com/photo-1589733955941-5eeaf752f6dd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8ZnJ1aXQlMjBzbW9vdGhpZXxlbnwwfHwwfHw%3D&w=1000&q=80',
        price: 2.99,
        isRecommended: false,
        isPopular: true),
  ];
}
