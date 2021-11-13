import 'package:api_auth_demo/global/url.dart';
import 'package:api_auth_demo/modules/authentication/model/AuthModel.dart';
import 'package:api_auth_demo/modules/authentication/model/user_model.dart';
import 'package:api_auth_demo/modules/dashboard/model/user_info_model.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:shared_preferences/shared_preferences.dart';

class AuthState extends GetxController {
  AuthState() {}

  final onClicked = false.obs;

  isActive(bool value) {
    onClicked.value = true;
    update();
  }

  RxBool onUpdate = false.obs;
  isUpdated( bool value){
    onUpdate.value= value;
  }

  final password = ''.obs;
  final username = ''.obs;
  final email = ''.obs;
  final confirmUsername = ''.obs;

  setPassword(String p) {
    password.value = p;
    update();
  }

  setUsername(String u) {
    username.value = u;
    update();
  }

  setConfirmUsername(String uN) {
    confirmUsername.value = uN;
    update();
  }

  setEmail(String e) {
    email.value = e;
    update();
  }

  RxBool isLogin = false.obs;

  late String _token;

  String get token => _token;

  setToken(String secretToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', secretToken);
    checkToken();
  }

  checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token')!;
    update();
  }

  removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  //**************************************************************//
  //**************************************************************//
  //***************             LOGIN                 ************//
  //**************************************************************//
  //**************************************************************//



  Future<AuthModel?> login(
      {required String username, required String password}) async {
    String path = apiBaseUrl + "/wp-json/jwt-auth/v1/token";
    try {
      Dio.Dio dio = Dio.Dio();
      dio.options.headers['content-Type'] = 'application/x-www-form-urlencoded';

      Dio.Response response = await dio.post(path,
          queryParameters: {"username": username, "password": password});

      if (response.statusCode == 200) {
        var responseJson = response.data;
        AuthModel log = AuthModel.fromJson(responseJson);
        setToken("Bearer" + " " + log.token);

        isLogin.value = true;
        return log;

      }
    } on Dio.DioError catch (ex) {
      print(ex.message);
      return null;
    }
  }

//**************************************************************//
//**************************************************************//
//***************        UPDATE PROFILE             ************//
//**************************************************************//
//**************************************************************//
  UserInfoModel? userInfo ;
  final firstname = ''.obs;
  final lastname = ''.obs;

  setFirstName(String fn) {
    firstname.value = fn;
    update();
  }

  setLastName(String ln) {
    lastname.value = ln;
    update();
  }

  Future<bool> updateProfile(
      {required String firstName, required String lastName}) async {
    Map updateUser = {'first_name': '', 'last_name': ''};
    updateUser["first_name"]=firstName;
    updateUser["last_name"]=lastName;

    try {
      Dio.Dio dio = Dio.Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Authorization'] = token;

      Dio.Response response = await dio.post(
          "https://apptest.dokandemo.com/wp-json/wp/v2/users/me",
          data: updateUser);

      print(response.statusCode);

      if (response.statusCode == 200) {
        var responseJson = response.data;
        UserInfoModel log = UserInfoModel.fromJson(responseJson);
        userInfo = log;
        return true;

      }
    } on Dio.DioError catch (ex) {
      print(ex.message);
      return false;
    }
    return false;

  }

//**************************************************************//
//**************************************************************//
//***************        REGISTER USER              ************//
//**************************************************************//
//**************************************************************//

  Map register = {'username': '', 'password': '', 'email': ''};

  Future<bool> registerUser(
      {required String username,
      required String password,
      required String email}) async {
    String path = apiBaseUrl + "/wp-json/wp/v2/users/register";
    try {
      Dio.Dio dio = Dio.Dio();
      dio.options.headers['content-Type'] = 'application/json';

      register['username'] = username;
      register['email'] = email;
      register['password'] = password;

      Dio.Response response = await dio.post(path, data: register);

      if (response.statusCode == 200) {
        return true;
      }
    } on Dio.DioError catch (ex) {
      print(ex.message);
      return false;
    }
    return false;
  }



  // Future<UserInfoModel?> fetchProfileInfo() async {
  //
  //   try {
  //     Dio.Dio dio = Dio.Dio();
  //     dio.options.headers['content-Type'] = 'application/json';
  //     dio.options.headers['Authorization'] = token;
  //
  //     Dio.Response response = await dio.get(
  //         "https://apptest.dokandemo.com/wp-json/wp/v2/users/me");
  //
  //     print(response.statusCode);
  //
  //     if (response.statusCode == 200) {
  //       var responseJson = response.data;
  //       UserInfoModel log = UserInfoModel.fromJson(responseJson);
  //       userInfo= log;
  //
  //       print(userInfo);
  //
  //       return log;
  //
  //     }
  //   } on Dio.DioError catch (ex) {
  //     print(ex.message);
  //     return null;
  //   }
  // }



}






