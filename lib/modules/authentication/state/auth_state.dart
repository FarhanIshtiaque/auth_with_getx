import 'package:api_auth_demo/global/url.dart';
import 'package:api_auth_demo/modules/authentication/model/AuthModel.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:shared_preferences/shared_preferences.dart';

class AuthState extends GetxController{


  AuthState(){}

  final onClicked = false.obs;

  isActive(bool value) {
    onClicked.value = true;
    update();
  }

  final password = ''.obs;
  final username = ''.obs;
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

  RxBool isLogin= false.obs;

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


Future<AuthModel?> login({required String username, required String password}) async{
  String path = apiBaseUrl + "/jwt-auth/v1/token";
  try {
    Dio.Dio dio = Dio.Dio();
    dio.options.headers['content-Type'] = 'application/x-www-form-urlencoded';

     Dio.Response response = await dio.post(path, queryParameters:{"username": username, "password": password});


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


  Future updateProfile({required String firstName, required String lastName}) async{
    String path = apiBaseUrl + "/wp-json/wp/v2/users/me";

    try {

      Dio.Dio dio = Dio.Dio();
      dio.options.headers['content-Type'] = 'application/json';

      dio.options.headers['Authorization'] = token;

      Dio.Response response = await dio.post(path, data:{"first_name": firstName, "last_name": lastName});
      print(response);


    } on Dio.DioError catch (ex) {
      print(ex.message);
      return null;
    }
  }

}