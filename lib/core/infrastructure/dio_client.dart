import 'package:crud/core/infrastructure/app_interceptor.dart';
import 'package:crud/core/infrastructure/shared_prefs.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../flavors.dart';

class DioClient {
  static DioClient? _instance;

  static late Dio _dio;

  DioClient._() {
    _dio = createDioClient();
  }

  factory DioClient() {
    return _instance ??= DioClient._();
  }

  Dio get instance => _dio;

  Dio createDioClient() {
    final baseUrl = sharedPreferences.getString('baseUrl');
    final dio = Dio();
    dio.options = BaseOptions(
      baseUrl: baseUrl ?? F.baseUrl,
      headers: {
        Headers.acceptHeader: 'application/json',
        Headers.contentTypeHeader: 'application/json',
      },
    );

    if (F.appFlavor != Flavors.prod) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }

    dio.interceptors.add(AppInterceptor());

    return dio;
  }
}
