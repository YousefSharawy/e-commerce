import 'package:dio/dio.dart';
import 'package:e_commerce/core/shared/api_constatnt.dart';
import 'package:injectable/injectable.dart';
@module
abstract class ApiModule {
  Dio get dio => Dio(
    BaseOptions(
      baseUrl: ApiConstatnt.baseUrl,
      receiveDataWhenStatusError: true,
    ),
  );
}
