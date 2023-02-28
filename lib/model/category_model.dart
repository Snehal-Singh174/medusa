import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String name;
  final String imageUrl;

  const CategoryModel({required this.name, required this.imageUrl});

  @override
  List<Object?> get props => [name, imageUrl];

  static List<CategoryModel> categories = [
    const CategoryModel(
      name: 'Soft Drink',
      imageUrl:
      'https://images.unsplash.com/photo-1629186235045-80d4147d90dc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c29kYXxlbnwwfHwwfHw%3D&w=1000&q=80',
    ),
    const CategoryModel(
      name: 'Smoothies',
      imageUrl:
      'https://images.unsplash.com/photo-1622597467836-f3285f2131b8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHNtb290aGllfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
    ),
    const CategoryModel(
      name: 'Water',
      imageUrl:
      'https://images.unsplash.com/photo-1558169550-45825435a09b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Ym90dGxlJTIwb2YlMjB3YXRlcnxlbnwwfHwwfHw%3D&w=1000&q=80',
    ),
    const CategoryModel(
      name: 'Hoodie',
      imageUrl:
      'https://images.unsplash.com/photo-1625880014195-928b3ee7008b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8aG9vZGllJTIwZ2lybHxlbnwwfHwwfHw%3D&w=1000&q=80',
    ),
    const CategoryModel(
      name: 'Jeans',
      imageUrl:
      'https://images.unsplash.com/photo-1600717535275-0b18ede2f7fc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGplYW5zfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
    ),
  ];
}
