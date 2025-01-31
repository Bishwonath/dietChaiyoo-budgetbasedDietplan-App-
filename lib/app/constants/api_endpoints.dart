class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String baseUrl = "http://10.0.2.2:3000/api";

  //=====================Auth Routes===============================
  static  String registerUser = "/auth/register";
  static  String loginUser = "/auth/login";
  static  String uploadImage = "/user/uploadimage";
}
