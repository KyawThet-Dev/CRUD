import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_sample_crud/core/config/app_strings.dart';
import 'package:flutter_sample_crud/core/domain/response_info_error.dart';
import 'package:flutter_sample_crud/core/infrastructure/dio_extensions.dart';
import 'package:flutter_sample_crud/core/application/network_result.dart';
import 'package:flutter_sample_crud/contact/domain/contact.dart';

class ContactRemoteService {
  final Dio _dio;
  ContactRemoteService(this._dio);

  Future<Either<ResponseInfoError, NetworkResult<List<Contact>>>>
      getContacts() async {
    try {
      final response = await _dio.get('/');
      var resData = response.data as List;
      if (response.statusCode == AppStrings.statusCode) {
        var jsonData = resData.map((e) => Contact.fromJson(e)).toList();
        // print(jsonData);
        return right(NetworkResult.result(jsonData));
      } else {
        return left(ResponseInfoError(
            code: response.statusCode.toString(),
            message: response.statusMessage));
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return right(const NetworkResult.noConnection());
      } else if (e.error != null) {
        return left(ResponseInfoError(
            code: e.response?.statusCode.toString(),
            message: e.response?.statusMessage));
      } else {
        rethrow;
      }
    }
  }

  Future<Either<ResponseInfoError, NetworkResult<String>>> addContact(
      String name, String phone) async {
    final body = {
      "createdAt": DateTime.now().toString(),
      "name": name,
      "phone": phone,
      "id": ''
    };
    try {
      final response = await _dio.post('/', data: body);
      if (response.statusCode == AppStrings.createCode) {
        return right(NetworkResult.result(response.statusMessage.toString()));
      } else {
        return left(ResponseInfoError(
            code: response.statusCode.toString(),
            message: response.statusMessage));
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return right(const NetworkResult.noConnection());
      } else if (e.error != null) {
        return left(ResponseInfoError(
            code: e.response?.statusCode.toString(),
            message: e.response?.statusMessage));
      } else {
        rethrow;
      }
    }
  }

  Future<Either<ResponseInfoError, NetworkResult<String>>> updateContact(
      Contact contact) async {
    final body = {
      "createdAt": DateTime.now().toString(),
      "name": contact.name,
      "phone": contact.phone,
      "id": contact.id
    };
    try {
      final response = await _dio.put('/${contact.id}', data: body);
      print(response.data);
      print(response.statusCode);
      print(response.statusMessage);
      if (response.statusCode == AppStrings.statusCode) {
        return right(NetworkResult.result(response.statusMessage.toString()));
      } else {
        return left(ResponseInfoError(
          code: response.statusCode.toString(),
          message: response.statusMessage,
        ));
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return right(const NetworkResult.noConnection());
      } else if (e.error != null) {
        return left(ResponseInfoError(
            code: e.response?.statusCode.toString(),
            message: e.response?.statusMessage));
      } else {
        rethrow;
      }
    }
  }

  Future<Either<ResponseInfoError, NetworkResult<String>>> deleteContact(
      String id) async {
    try {
      final response = await _dio.delete('/$id');
      print(response.data);
      print(response.statusCode);
      print(response.statusMessage);
      if (response.statusCode == AppStrings.statusCode) {
        return right(NetworkResult.result(response.statusMessage.toString()));
      } else {
        return left(ResponseInfoError(
          code: response.statusCode.toString(),
          message: response.statusMessage,
        ));
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return right(const NetworkResult.noConnection());
      } else if (e.error != null) {
        return left(ResponseInfoError(
            code: e.response?.statusCode.toString(),
            message: e.response?.statusMessage));
      } else {
        rethrow;
      }
    }
  }
}
