import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact {
  final String id;
  final String name;
  final String phone;
  final String createdAt;

  Contact({
    required this.id,
    required this.name,
    required this.phone,
    required this.createdAt,
  });

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);

  @override
  String toString() {
    return 'Contact(id: $id, name: $name, phone: $phone, createdAt: $createdAt)';
  }
}
