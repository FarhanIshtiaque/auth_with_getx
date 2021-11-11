import 'package:get/get.dart';

class SignInState extends GetxController{
  final onClicked = false.obs;

  isActive(bool value) {
    onClicked.value = true;
    update();
  }

}