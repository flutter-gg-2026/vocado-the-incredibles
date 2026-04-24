// api_endpoints.dart
class ApiEndpoints {
  ApiEndpoints._();

  static const String baseUrl = 'https://api.example.com';

  // Auth
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh';

  // User
  static const String profile = '/user/profile';

  // Common
  static String userById(String id) => '/users/$id';

  // Transcript service
  static const String transcriptBaseUrl = 'https://api.gladia.io/v2';
  static const String transcriptLoad = '/upload';
  static const String transcriptJobCreate = '/pre-recorded';
  // To request data by id
  static String transcriptResultEndpoint(String id) =>
      '$transcriptJobCreate/$id';

  // Google-Gemini 3.1 Flash service
  static const String googleGeminiBaseUrl =
      'https://generativelanguage.googleapis.com';
  static const String geminiModel3Flash = 'gemini-3-flash-preview';
  static const String geminiModel25Flash = 'gemini-2.5-flash';
  // To request data by id
  /* static String googleGeminiModelEndpoint(String model, String key) =>
      '$googleGeminiBaseUrl/v1beta/models/$model:generateContent?key={$key}'; */
  static String googleGeminiModelEndpoint(String model) =>
      '$googleGeminiBaseUrl/v1beta/models/$model:generateContent';
}
