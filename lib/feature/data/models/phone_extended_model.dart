import 'package:effectivem_test/feature/domain/entities/phone_extended_entity.dart';

class PhoneExtendedModel extends PhoneExtendedEntity {
  const PhoneExtendedModel({
    required super.id,
    required super.title,
    required super.images,
    required super.isFavorites,
    required super.camera,
    required super.capacities,
    required super.colors,
    required super.cpu,
    required super.rating,
    required super.sd,
    required super.ssd,
    required super.price,
  });

  factory PhoneExtendedModel.fromJson(Map<String, dynamic> json) {
    return PhoneExtendedModel(
      id: json['id'],
      title: json['title'],
      images: json['images'],
      isFavorites: json['is_favorites'],
      camera: json['camera'],
      capacities: json['capacity'],
      colors: json['color'],
      cpu: json['cpu'],
      rating: json['rating'],
      sd: json['sd'],
      ssd: json['ssd'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'images': images,
      'isFavorites': isFavorites,
      'camera': camera,
      'capacities': capacities,
      'colors': colors,
      'cpu': cpu,
      'rating': rating,
      'sd': sd,
      'ssd': ssd,
      'price': price,
    };
  }
}
