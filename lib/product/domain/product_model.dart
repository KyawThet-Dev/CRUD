import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final String name;
  final String price;
  final String id;

  ProductModel({required this.name, required this.price, required this.id});

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
  @override
  String toString() => 'ProductModel(name: $name, price: $price, id: $id)';
}
