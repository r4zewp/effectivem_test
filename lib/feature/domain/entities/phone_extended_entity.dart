import 'package:equatable/equatable.dart';

class PhoneExtendedEntity extends Equatable {
  final int id;
  final String title;
  final List<String> images;
  final bool isFavorites;
  final double rating;
  final String sd;
  final String ssd; // RAM? :)
  final String cpu;
  final String camera;
  final List<String> capacities;
  final List<String> colors;
  final int price;

  const PhoneExtendedEntity({
    required this.id,
    required this.title,
    required this.images,
    required this.isFavorites,
    required this.camera,
    required this.capacities,
    required this.colors,
    required this.cpu,
    required this.rating,
    required this.sd,
    required this.ssd,
    required this.price,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        images,
        isFavorites,
        camera,
        colors,
        rating,
        cpu,
        ssd,
        sd,
        capacities,
        price,
      ];
}
