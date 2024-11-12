import 'dart:developer';

import 'package:crud/api_end_point.dart';
import 'package:crud/product/domain/product_model.dart';
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
      final response = await _dio.get(ApiEndPoint.getmusic);
      log('response url ${response.realUri}');
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

  Future<Either<ResponseInfoError, NetworkResult<String>>> deleteMusic(
      String id) async {
    try {
      final response = await _dio.delete('${ApiEndPoint.getmusic}/$id');
      log('delete music $response');
      if (response.statusCode == AppStrings.statusCode) {
        // var resData = response.data as List;
        // var json = resData.map((e) => MusicModel.formJson(e)).toList();
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
            code: e.response!.statusCode.toString(),
            message: e.response!.statusMessage));
      } else {
        rethrow;
      }
    }
  }

  Future<Either<ResponseInfoError, NetworkResult<List<ProductModel>>>>
      getProducts() async {
    try {
      final response = await _dio.get(ApiEndPoint.getProducts);
      var resData = response.data as List;
      log('response product data $resData');
      if (response.statusCode == AppStrings.statusCode) {
        var jsonData = resData.map((e) => ProductModel.fromJson(e)).toList();
        return right(NetworkResult.result(jsonData));
      } else {
        return left(ResponseInfoError(code: response.statusCode.toString()));
      }
    } on DioException catch (e) {
      return left(ResponseInfoError(code: e.response!.statusCode.toString()));
    }
  }

  Future<Either<ResponseInfoError, NetworkResult<String>>> deleteProduct(
      String id) async {
    try {
      final response = await _dio.delete('${ApiEndPoint.deleteProduct}$id');
      if (response.statusCode == AppStrings.statusCode) {
        return right(NetworkResult.result(response.statusMessage.toString()));
      } else {
        return left(ResponseInfoError(code: response.statusCode.toString()));
      }
    } on DioException catch (e) {
      return left(ResponseInfoError(code: e.response!.statusCode.toString()));
    }
  }

  Future<Either<ResponseInfoError, NetworkResult<String>>> updateMusic(
      MusicModel music) async {
    try {
      final body = {
        "music_title": music.music_title,
        "album_name": music.album_name,
        "artist_name": music.artist_name,
        "music_id": music.music_id
      };
      final response = await _dio
          .put('${ApiEndPoint.getmusic}/${music.music_id}', data: body);
      log('update response $response');
      //var resData = response.data as List;
      if (response.statusCode == AppStrings.statusCode) {
        //var jsonData = resData.map((e) => MusicModel.fromJson(e)).toList();
        return right(NetworkResult.result(response.statusMessage.toString()));
      } else {
        return left(ResponseInfoError(code: response.statusCode.toString()));
      }
    } on DioException catch (e) {
      return left(ResponseInfoError(code: e.response!.statusCode.toString()));
    }
  }

  Future<Either> fetchLeagues() async {
    final dio = Dio();

    try {
      final response = await dio.get(
        'https://api-football-v1.p.rapidapi.com/v3/leagues',
        options: Options(
          headers: {
            'x-rapidapi-key':
                '74a06f19cdmsh5c97d8c27d98a64p103110jsna38df45d56a4',
            'x-rapidapi-host': 'api-football-v1.p.rapidapi.com',
          },
        ),
      );

      if (response.statusCode == AppStrings.statusCode) {
        var resData = response.data as List;
        // var jsonData = resData.map((e) => MusicModel.fromJson(e)).toList();
        return right(resData);
      } else {
        return left(ResponseInfoError(code: response.statusCode.toString()));
      }
    } on DioException catch (e) {
      return left(ResponseInfoError(code: e.response!.statusCode.toString()));
    }
  }
}
