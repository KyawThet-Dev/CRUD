import 'package:crud/core/infrastructure/app_database.dart';
import 'package:crud/core/shared/providers.dart';
import 'package:crud/customer/application/customer_notifier.dart';
import 'package:crud/customer/infrastructure/customer_remote_service.dart';
import 'package:crud/customer/infrastructure/repository/customer_repository.dart';
import 'package:crud/customer/infrastructure/services/customer_local_service.dart';
import 'package:crud/customer/infrastructure/services/dao/customer_dao.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appFloorDBProvider = Provider(
  (ref) => AppFloorDB(),
);
final customerDaoProvider = Provider<CustomerDao>((ref) {
  return ref.watch(appFloorDBProvider).instance.customerDao;
});
final customerRemoteServiceProvider = Provider<CustomerRemoteService>((ref) {
  return CustomerRemoteService(ref.watch(dioProvider));
});
final customerLocalServiceProvider = Provider<CustomerLocalService>((ref) {
  return CustomerLocalService(ref.watch(customerDaoProvider));
});
final customerRepositoryProvider = Provider((ref) {
  return CustomerRepository(ref.watch(customerRemoteServiceProvider),
      ref.watch(customerLocalServiceProvider));
});
final getAllCustomerNotiferProvider =
    StateNotifierProvider<GetAllCustomerNotifer, GetAllCustomerState>((ref) {
  return GetAllCustomerNotifer(ref.watch(customerRepositoryProvider));
});
