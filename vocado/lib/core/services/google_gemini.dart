import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/network/api_endpoints.dart';
import 'package:vocado/core/network/dio_client.dart';

@lazySingleton
class GoogleGemini {
  final DioClient _dioClient;

  GoogleGemini(this._dioClient) {
    _dioClient.dio.options.baseUrl = ApiEndpoints.googleGeminiBaseUrl;
    _dioClient.dio.options.headers = {
      "Content-Type": "application/json",
      "x-goog-api-key": dotenv.env['google_gemini'],
    };
  }

  Future<Map<String, dynamic>> getTaskStructured({
    required String content,
  }) async {
    final body = {
      "systemInstruction": {
        "parts": [
          {
            "text":
                'Extract required info from content and if some is missing respond with "not enough info" otherwise Respond with exact absolute response json format with no ```json as "{ "task": "task from content", "assignee": "member name", "due_date": "yyyy-mm-dd" }"',
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

    /* final taskJson = await _dioClient.post(
      ApiEndpoints.googleGeminiModelEndpoint(ApiEndpoints.geminiModel25Flash),
      data: body,
    );

    log(taskJson.data.toString());

    final response =
        taskJson.data['candidates'][0]['content']['parts'][0]['text'];

    log(response.toString());

    if ((response as String).contains('not enough info')) {
      throw Exception('No Task is recognized');
    } */

    final json = jsonDecode(
      '{ "task": "finish the proposal", "assignee": "Hatem", "due_date": "2025-04-25" }',
    );

    log('Google Service Finished');

    return json;
  }
}
