import 'package:api_auth_demo/global/constant.dart';
import 'package:api_auth_demo/modules/authentication/state/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData suffixIconData;
  final bool obscureText;
  final ValueChanged<String> onChanged;

  const TextFieldWidget(
      {Key? key,
      required this.hintText,
      required this.suffixIconData,
      required this.obscureText,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Get.put(SignInState());

    return TextField(
      onChanged: onChanged,
      obscureText: obscureText,
      cursorColor: kGray7,
      style: const TextStyle(
        color: kGray2,
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: kGray9, width: 2)),
        hintStyle: const TextStyle(
            fontWeight: FontWeight.w500, fontSize: 16, color: kGray6),
        focusColor: kPrimaryColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: kPrimaryColor, width: 2),
        ),
        hintText: hintText,
        suffixIcon: GestureDetector(
          onTap: () {
            state.onClicked.value = !state.onClicked.value;
          },
          child: Icon(
            suffixIconData,
            size: 18,
            color: kGray5,
          ),
        ),
      ),
    );
  }
}
