import 'package:freezed_annotation/freezed_annotation.dart';
part 'customer_model.freezed.dart';

@freezed
class CustomerModel with _$CustomerModel {
  const factory CustomerModel(
      {required String customerID,
      required String customerName,
      required String customerCode,
      required String customerEmail,
      required String customerPhone,
      required String customerAddress,
      required String active}) = _CustomerModel;
}
