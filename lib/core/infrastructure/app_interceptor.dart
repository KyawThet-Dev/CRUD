// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:crud/core/infrastructure/app_response.dart';
import 'package:dio/dio.dart';

class AppInterceptor extends Interceptor {
  static AppInterceptor? _instance;

  AppInterceptor._private();

  factory AppInterceptor() {
    return _instance ??= AppInterceptor._private();
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Tries to add Authorization header only if Authorization header
    // not existed
    // if (!options.headers.containsKey(HttpHeaders.authorizationHeader)) {
    // const token = "FakeToken";

    // if (state.token != null) {
    // options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    // }
    // }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Maps custom response
    final responseData = mapResponseData(
      requestOptions: response.requestOptions,
      response: response,
    );

    return handler.resolve(responseData);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // Logger.clap('AppInterceptor err type', err.type);
    // Logger.clap('AppInterceptor err code', err.response?.statusCode);
    // Logger.clap('AppInterceptor err message', err.response?.statusMessage);
    // Logger.clap('AppInterceptor err options', err.requestOptions);
    // Logger.clap('AppInterceptor handler', handler);
    // Gets custom error message
    final errorMessage = getErrorMessage(err, err.response?.statusCode);
    // Logger.clap('AppInterceptor getErrorMessage', errorMessage);
    // Maps custom response
    final responseData = mapResponseData(
      requestOptions: err.requestOptions,
      response: err.response,
      customMessage: errorMessage,
      isErrorResponse: true,
    );
    // Logger.clap('AppInterceptor responseData', responseData.statusCode);
    // Logger.clap('AppInterceptor responseData', responseData.statusMessage);

    return handler.resolve(responseData);
  }
}

/// Custom error messages
class DioErrorMessage {
  static const badRequestException = "Invalid request";
  static const internalServerErrorException =
      "Unknown error occurred, please try again later.";
  static const conflictException = "Conflict occurred";
  static const unauthorizedException = "Access denied";
  static const notFoundException =
      "The requested information could not be found";
  static const unexpectedException = "Unexpected error occurred.";
  static const noInternetConnectionException =
      "No internet connection detected, please try again.";
  static const deadlineExceededException =
      "The connection has timed out, please try again.";
  static const userCancelException = "User cancel the request.";
}

String getErrorMessage(DioError dioError, int? statusCode) {
  // Logger.clap('AppInterceptor statusCode', statusCode);
  String errorMessage = "";
  switch (dioError.type) {
    case DioErrorType.connectionTimeout:
    case DioErrorType.sendTimeout:
    case DioErrorType.receiveTimeout:
      errorMessage = DioErrorMessage.deadlineExceededException;
      break;
    case DioErrorType.connectionError:
      errorMessage = DioErrorMessage.noInternetConnectionException;
      break;
    case DioErrorType.badResponse:
      switch (statusCode) {
        case 400:
          errorMessage = DioErrorMessage.badRequestException;
          break;
        case 401:
          errorMessage = DioErrorMessage.unauthorizedException;
          break;
        case 404:
          errorMessage = DioErrorMessage.notFoundException;
          break;
        case 409:
          errorMessage = DioErrorMessage.conflictException;
          break;
        case 500:
          errorMessage = DioErrorMessage.internalServerErrorException;
          break;
      }
      break;
    case DioErrorType.cancel:
      errorMessage = DioErrorMessage.userCancelException;
      break;
    case DioErrorType.unknown:
      if (dioError.error is SocketException) {
        errorMessage = DioErrorMessage.noInternetConnectionException;
      } else {
        errorMessage = DioErrorMessage.unexpectedException;
      }
      break;
    case DioErrorType.badCertificate:
      break;
  }

  return errorMessage;
}

Response<dynamic> mapResponseData({
  Response<dynamic>? response,
  required RequestOptions requestOptions,
  String customMessage = "",
  bool isErrorResponse = false,
}) {
  final bool hasResponseData = response?.data != null;
  // Logger.clap('mapResponseData statusCode', response?.statusCode);
  // Logger.clap('mapResponseData statusMessage', response?.statusMessage);
  // Logger.clap('mapResponseData isErrorResponse', isErrorResponse);
  // Logger.clap('mapResponseData customMessage', customMessage);
  // Logger.clap('mapResponseData hasResponseData', hasResponseData);

  Map<String, dynamic>? responseData = response?.data;
  // Logger.clap('mapResponseData responseData', responseData);

  if (hasResponseData) {
    responseData!.addAll({
      "statusCode": response?.statusCode,
      "statusMessage": response?.statusMessage,
    });
  }
  // Logger.clap('mapResponseData responseData update', responseData);

  return Response(
    requestOptions: requestOptions,
    data: hasResponseData
        ? responseData
        : AppResponse(
            success: isErrorResponse ? false : true,
            message: customMessage,
            statusCode: response?.statusCode,
            statusMessage: response?.statusMessage,
            // description: DioErrorMessage.noInternetConnectionException,
            description: "Data is not received from server.",
          ).toJson((value) => null),
  );
}
