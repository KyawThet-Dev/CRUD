import 'package:crud/customer/domian/customer_model.dart';
import 'package:crud/customer/infrastructure/models/customer_dto.dart';

extension CustomerDtoListX on List<CustomerDto> {
  List<CustomerModel> get domainList => map((e) => e.domainModel).toList();
}
