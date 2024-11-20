// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:crud/customer/domian/customer_model.dart';

import '../../../core/presentation/helpers/global_utils.dart';
part 'customer_dto.g.dart';

@JsonSerializable()
@Entity(tableName: 'Customer')
class CustomerDto {
  @primaryKey
  @JsonKey(name: 'CustomerID', fromJson: stringFromJson)
  @ColumnInfo(name: 'customerID')
  final String customerID;
  @JsonKey(name: 'CustomerName', fromJson: stringFromJson)
  @ColumnInfo(name: 'customerName')
  final String customerName;
  @JsonKey(name: 'CustomerCode', fromJson: stringFromJson)
  @ColumnInfo(name: 'customerCode')
  final String cutomerCode;
  @JsonKey(name: 'CustomerEmail', fromJson: stringFromJson)
  @ColumnInfo(name: 'customerEmail')
  final String cutomerEmail;
  @JsonKey(name: 'CustomerPhone', fromJson: stringFromJson)
  @ColumnInfo(name: 'customerPhone')
  final String customerPhone;
  @JsonKey(name: 'CustomerAddress', fromJson: stringFromJson)
  @ColumnInfo(name: 'customerAddress')
  final String customerAddress;
  @JsonKey(name: 'Active', fromJson: stringFromJson)
  @ColumnInfo(name: 'active')
  final String active;

  CustomerDto(
      {required this.customerID,
      required this.customerName,
      required this.cutomerCode,
      required this.cutomerEmail,
      required this.customerPhone,
      required this.customerAddress,
      required this.active});

  factory CustomerDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerDtoToJson(this);

  CustomerModel get domainModel => toDomain();
  CustomerModel toDomain() => CustomerModel(
      customerID: customerID,
      customerName: customerName,
      customerCode: cutomerCode,
      customerEmail: cutomerEmail,
      customerPhone: customerPhone,
      customerAddress: customerAddress,
      active: active);

  @override
  String toString() {
    return 'CustomerDto(customerID: $customerID, customerName: $customerName, cutomerCode: $cutomerCode, cutomerEmail: $cutomerEmail, customerPhone: $customerPhone, customerAddress: $customerAddress, active: $active)';
  }
}
