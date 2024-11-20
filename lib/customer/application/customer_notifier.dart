import 'package:crud/core/domain/response_info_error.dart';
import 'package:crud/customer/domian/customer_model.dart';
import 'package:crud/customer/infrastructure/repository/customer_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
part 'customer_notifier.freezed.dart';

@freezed
class GetAllCustomerState with _$GetAllCustomerState {
  const factory GetAllCustomerState.initial() = _Initial;
  const factory GetAllCustomerState.loading() = _Loading;
  const factory GetAllCustomerState.empty() = _Empty;
  const factory GetAllCustomerState.error(ResponseInfoError error) = _Error;
  const factory GetAllCustomerState.noConnection() = _NoConnection;
  const factory GetAllCustomerState.success(List<CustomerModel> customers) =
      _Success;
}

class GetAllCustomerNotifer extends StateNotifier<GetAllCustomerState> {
  final CustomerRepository _respository;

  GetAllCustomerNotifer(this._respository)
      : super(const GetAllCustomerState.initial());

  Future<void> getAllCustomers() async {
    state = const GetAllCustomerState.loading();
    final fos = await _respository.getAllCustomer();
    state = fos.fold(
        (l) => GetAllCustomerState.error(l),
        (r) => r.when(
            noConnection: () => const GetAllCustomerState.noConnection(),
            result: (result) => GetAllCustomerState.success(result)));
  }
}
