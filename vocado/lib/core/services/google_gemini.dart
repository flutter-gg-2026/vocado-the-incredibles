import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/network/api_endpoints.dart';
import 'package:vocado/core/network/dio_client.dart';

@lazySingleton
class GoogleGemini {
  final DioClient _dioClient;

  late Dio _dio;

  GoogleGemini(this._dioClient) {
    _dio = _dioClient.dio;
    _dio.options.baseUrl = ApiEndpoints.googleGeminiBaseUrl;
    _dio.options.headers = {
      "Content-Type": "application/json",
      "x-goog-api-key": dotenv.env['google_gemini'],
    };
  }

  Future<Map<String, dynamic>> getTaskStructured({
    required String content,
  }) async {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.googleGeminiBaseUrl,
        headers: {
          "Content-Type": "application/json",
          "x-goog-api-key": dotenv.env['google_gemini'],
        },
      ),
    );
    final body = {
      "systemInstruction": {
        "parts": [
          {
            "text":
                '''"Extract required info from content and if some is missing respond with "not enough info" otherwise Respond with exact json format as { "task": "task from content", "assignee": "member name", "due_date": "yyyy-mm-dd" }"''',
          },
        ],
      },
      "contents": [
        {
          "parts": [
            {"text": content},
          ],
        },
      ],
    };

    log('Google Service Started');

    final taskJson = await dio.post(
      ApiEndpoints.googleGeminiModelEndpoint(ApiEndpoints.geminiModel),
      data: body,
    );

    final response =
        taskJson.data['candidates'][0]['content']['parts'][0]['text'];

    log(response.toString());

    if ((response as String).contains('not enough info')) {
      throw Exception('No Task is recognized');
    }

    final json = jsonDecode(response);

    log('Google Service Finished');

    return json;
  }
}
