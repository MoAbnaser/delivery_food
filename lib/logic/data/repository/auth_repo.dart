import 'package:food_delivery/logic/data/api/api_client.dart';
import 'package:food_delivery/models/signup_body_model.dart';
import 'package:food_delivery/utils/constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> registration(SignUpBody signUpBody) async {
    Response response = await apiClient.postData(
        Constants.registrationUri, signUpBody.toJson());
    return response;
  }

  Future<Response> logIn(String email, String password) async {

    Response response = await apiClient
        .postData(Constants.logInUri, {'email': email, 'password': password});
    return response;
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(Constants.token, token);
  }

  Future<void> saveUserNumberAndPassword(String number, String password) async {
    try {
      await sharedPreferences.setString(Constants.phone, number);
      await sharedPreferences.setString(Constants.password, password);
    } catch (e) {
      throw e;
    }
  }

  Future<String> getUserToken() async {
    return await sharedPreferences.getString(Constants.token) ?? 'None';
  }
}
