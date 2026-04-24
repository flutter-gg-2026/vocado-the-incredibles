import 'package:dio/dio.dart';
import 'package:vocado/core/network/dio_client.dart';

extension SpeechToText on DioClient {
  final Dio _dio = dio;
}
