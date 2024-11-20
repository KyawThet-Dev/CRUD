// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerDto _$CustomerDtoFromJson(Map<String, dynamic> json) => CustomerDto(
      customerID: stringFromJson(json['CustomerID']),
      customerName: stringFromJson(json['CustomerName']),
      cutomerCode: stringFromJson(json['CustomerCode']),
      cutomerEmail: stringFromJson(json['CustomerEmail']),
      customerPhone: stringFromJson(json['CustomerPhone']),
      customerAddress: stringFromJson(json['CustomerAddress']),
      active: stringFromJson(json['Active']),
    );

Map<String, dynamic> _$CustomerDtoToJson(CustomerDto instance) =>
    <String, dynamic>{
      'CustomerID': instance.customerID,
      'CustomerName': instance.customerName,
      'CustomerCode': instance.cutomerCode,
      'CustomerEmail': instance.cutomerEmail,
      'CustomerPhone': instance.customerPhone,
      'CustomerAddress': instance.customerAddress,
      'Active': instance.active,
    };
