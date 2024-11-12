import 'package:crud/flavors.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dartz/dartz.dart';

final dioProvider = Provider(
  (ref) => Dio()
    ..options = BaseOptions(
      baseUrl: F.baseUrl, // with sbs@gmail.com
      contentType: 'application/json',
    ),
);

final initializationProvider = FutureProvider<Unit>((ref) async {
  ref.watch(dioProvider);

  return unit;
});
