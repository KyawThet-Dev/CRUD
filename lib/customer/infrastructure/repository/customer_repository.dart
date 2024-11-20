import 'package:crud/core/application/network_result.dart';
import 'package:crud/core/domain/response_info_error.dart';
import 'package:crud/customer/domian/customer_model.dart';
import 'package:crud/customer/infrastructure/customer_remote_service.dart';
import 'package:crud/customer/infrastructure/extension.dart';
import 'package:crud/customer/infrastructure/services/customer_local_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CustomerRepository {
  final CustomerRemoteService _customerRemoteService;
  final CustomerLocalService _customerLocalService;

  CustomerRepository(this._customerRemoteService, this._customerLocalService);

  Future<Either<ResponseInfoError, NetworkResult<List<CustomerModel>>>>
      getAllCustomer() async {
    try {
      final result = await _customerRemoteService.getCustomers();
      if (result.success) {
        await _customerLocalService.addAll(result.data ?? []);
        return Right(NetworkResult.result(result.data!.domainList));
      } else {
        return left(
            ResponseInfoError(code: result.code, message: result.message));
      }
    } on DioException catch (e) {
      return left(ResponseInfoError(code: e.message));
    }
  }
}
