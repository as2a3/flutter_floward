import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio createDio({bool isProduction = true,}) {
  // ignore: omit_local_variable_types
  final Dio dio = Dio();
  dio.options = BaseOptions();

  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ),
  );
  return dio;
}
