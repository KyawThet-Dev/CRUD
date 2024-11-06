import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:crud/core/application/network_result.dart';
import 'package:crud/core/config/app_strings.dart';
import 'package:crud/core/domain/response_info_error.dart';
import 'package:crud/core/infrastructure/dio_extensions.dart';
import 'package:crud/home/domain/music_model.dart';

class MusicModelRemote {
  final Dio _dio;

  MusicModelRemote(this._dio);

  Future<Either<ResponseInfoError, NetworkResult<List<MusicModel>>>>
      getMusic() async {
    try {
      final response = await _dio
          .get('https://66f2801171c84d80587581a3.mockapi.io/api/music/music');
      log('response $response');
      var resData = response.data as List;

      if (response.statusCode == AppStrings.statusCode) {
        var jsonData = resData.map((e) => MusicModel.formJson(e)).toList();
        log('jsonData$jsonData');
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
            code: e.response!.statusCode.toString(),
            message: e.response!.statusMessage));
      } else {
        rethrow;
      }
    }
  }
}
