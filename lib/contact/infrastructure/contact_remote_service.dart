import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:crud/core/config/app_strings.dart';
import 'package:crud/core/domain/response_info_error.dart';
import 'package:crud/core/infrastructure/dio_extensions.dart';
import 'package:crud/core/application/network_result.dart';
import 'package:crud/contact/domain/contact.dart';

class ContactRemoteService {
  final Dio _dio;
  ContactRemoteService(this._dio);

  Future<Either<ResponseInfoError, NetworkResult<List<Contact>>>>
      getContacts() async {
    try {
      final response = await _dio
          .get('https://646ccc017b42c06c3b2c0977.mockapi.io/api/contact/');
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
      final response = await _dio.post(
          'https://646ccc017b42c06c3b2c0977.mockapi.io/api/contact/',
          data: body);
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
      final response = await _dio.put(
          'https://646ccc017b42c06c3b2c0977.mockapi.io/api/contact/${contact.id}',
          data: body);
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
      final response = await _dio.delete(
          'https://646ccc017b42c06c3b2c0977.mockapi.io/api/contact/$id');
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
