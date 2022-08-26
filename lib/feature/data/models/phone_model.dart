import 'package:effectivem_test/feature/domain/entities/phone_entity.dart';

class PhoneModel extends PhoneEntity {
  const PhoneModel({
    required super.id,
    required super.isNew,
    required super.title,
    required super.subtitle,
    required super.picture,
    required super.isFavorites,
    required super.isBuy,
    required super.discountPrice,
    required super.priceWithoutDiscount,
  });

  @override
  List<Object> get props => [
        id,
        isNew,
        title,
        subtitle,
        picture,
        isFavorites,
        isBuy,
      ];

  factory PhoneModel.fromJson(Map<String, dynamic> json) {
    return PhoneModel(
      id: json['id'],
      isNew: json['is_new'] ?? false,
      title: json['title'],
      subtitle: json['subtitle'] ?? "",
      picture: [
        json['picture'],
      ],
      isFavorites: json['is_favorites'] ?? false,
      isBuy: json['is_buy'] ?? false,
      discountPrice: json['price_without_discount'] ?? 0.0,
      priceWithoutDiscount: json['discount_price'] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'is_new': isNew,
      'title': title,
      'subtitle': subtitle,
      'picture': picture,
      'is_favorites': isFavorites ? isFavorites : false,
      'is_buy': isBuy ? isBuy : false,
    };
  }
}
