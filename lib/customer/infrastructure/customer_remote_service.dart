import 'package:crud/api_end_point.dart';
import 'package:crud/core/infrastructure/app_response.dart';
import 'package:crud/core/infrastructure/dio_client.dart';
import 'package:crud/customer/infrastructure/models/customer_dto.dart';
import 'package:dio/dio.dart';

class CustomerRemoteService {
  static const String tag = 'CustomerRemoteService';
  final Dio _dioClient;

  CustomerRemoteService(this._dioClient);

  Future<AppResponse<List<CustomerDto>>> getCustomers(
      {String? branchId, String? modifiedDate}) async {
    final response = await _dioClient.get(
        'http://sumotrack_mb_app.systematic-solution.com/api/Customer/GetAllCustomer',
        queryParameters: {
          'ModifiedDate': modifiedDate ?? '',
          'BranchID': branchId ?? ''
        });

    return AppResponse.fromJson(
        response.data,
        (dynamic json) => response.data['Success'] && json != null
            ? (json as List<dynamic>)
                .map((e) => CustomerDto.fromJson(e))
                .toList()
            : []);
  }
}
