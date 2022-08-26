import 'package:equatable/equatable.dart';

class PhoneEntity extends Equatable {
  final int id;
  final bool isNew;
  final String title;
  final String subtitle;
  final List<String> picture;
  final bool isFavorites;
  final bool isBuy;
  final int priceWithoutDiscount;
  final int discountPrice;

  const PhoneEntity({
    required this.id,
    required this.isNew,
    required this.title,
    required this.subtitle,
    required this.picture,
    required this.isFavorites,
    required this.isBuy,
    required this.discountPrice,
    required this.priceWithoutDiscount,
  });

  @override
  List<Object?> get props => [
        id,
        isNew,
        title,
        subtitle,
        picture,
        isFavorites,
        isBuy,
      ];
}
