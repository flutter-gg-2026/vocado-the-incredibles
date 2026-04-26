import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/network/api_endpoints.dart';
import 'package:vocado/core/network/dio_client.dart';

@lazySingleton
class SpeechToText {
  final DioClient _dioClient;

  SpeechToText(this._dioClient) {
    _dioClient.dio.options.baseUrl = ApiEndpoints.transcriptBaseUrl;
    _dioClient.dio.options.headers = {
      'Accept': 'application/json',
      "Content-Type": "multipart/form-data",
      "x-gladia-key": dotenv.env['gladia_key'],
    };
  }

  Future<Map<String, dynamic>> transcriptAudio(File audio) async {
    try {
      final FormData formData = FormData.fromMap({
        "audio": await MultipartFile.fromFile(
          audio.path,
          filename: "taskAudio.m4a",
        ),
      });

      final audioUrl = await _uploadFile(formData);
      final resultUrl = await _createJob(audioUrl['audio_url']);
      final result = await _getTranscript(resultUrl['id']);

      final String transcript =
          result["result"]["transcription"]["full_transcript"];
      final translation =
          result["result"]["translation"]["results"][0]["full_transcript"];

      log('$translation: $transcript');

      return {'arabic': transcript, 'english': translation};
    } catch (error) {
      log(error.toString());
      throw FailureExceptions.getException(error);
    }
  }

  Future<Map<String, dynamic>> _uploadFile(FormData formData) async {
    log('Uploading audio file');

    final uploadResponse = await _dioClient.dio.post(
      ApiEndpoints.transcriptLoad,
      data: formData,
    );

    if (uploadResponse.statusCode != 200) {
      throw Exception(uploadResponse.statusMessage);
    }

    log("Uploading complete!");

    return uploadResponse.data;
  }

  Future<Map<String, dynamic>> _createJob(String audioUrl) async {
    final jobResponse = await _dioClient.dio.post(
      ApiEndpoints.transcriptJobCreate,
      data: {
        "audio_url": audioUrl,
        "language_config": {
          "languages": ["ar", "en"],
          "code_switching": false,
        },
        "diarization": true,
        "diarization_config": {
          "number_of_speakers": 3,
          "min_speakers": 1,
          "max_speakers": 5,
        },
        "translation": true,
        "translation_config": {
          "model": "base",
          "target_languages": ["en"],
          "context_adaptation": true,
          "context": "Business meeting discussing quarterly results",
          "informal": false,
        },
        "subtitles": true,
        "subtitles_config": {
          "formats": ["srt", "vtt"],
        },
      },
      options: Options().copyWith(
        headers: {"Content-Type": "application/json"},
      ),
    );

    if (jobResponse.statusCode != 201) {
      throw Exception(jobResponse.statusMessage);
    }

    return jobResponse.data;
  }

  Future<Map<String, dynamic>> _getTranscript(String transId) async {
    bool isDone = false;
    Response<dynamic> resultResponse;

    log("Transcription is loading!...");

    do {
      resultResponse = await _dioClient.dio.get(
        ApiEndpoints.transcriptResultEndpoint(transId),
      );

      if (resultResponse.data['status'] == 'done') {
        isDone = true;
        log("Process complete!");
        break;
      } else if (resultResponse.data['status'] == 'error') {
        throw Exception(resultResponse.statusMessage);
      } else {
        await Future.delayed(Duration(seconds: 3));
      }
    } while (!isDone);

    return resultResponse.data;
  }
}
