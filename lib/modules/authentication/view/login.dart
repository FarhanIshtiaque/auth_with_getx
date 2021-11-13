import 'package:api_auth_demo/global/constant.dart';
import 'package:api_auth_demo/modules/authentication/state/auth_state.dart';
import 'package:api_auth_demo/modules/dashboard/view/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'component/custom_button.dart';
import 'component/screen_tittle.dart';
import 'component/testfield_tittle.dart';
import 'component/text_field.dart';
import 'sign_up.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Get.put(AuthState());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ScreenTittle(
                tittle: 'Sign in to weDevs',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextFieldTittle(
                      name: 'Username',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                     TextFieldWidget(
                        hintText: 'Username',
                        obscureText: false,
                        suffixIconData: Icons.email,
                        onChanged: (value) {
                          state.setUsername(value);
                        },
                      ),

                    const SizedBox(
                      height: 16,
                    ),
                    const TextFieldTittle(
                      name: 'Password',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                     TextFieldWidget(
                        hintText: 'Password',
                        obscureText: true,
                        suffixIconData: Icons.visibility,
                        onChanged: (value) {
                          state.setPassword(value);

                        },
                      ),

                    const SizedBox(
                      height: 12,
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forget Password',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomButton(
                      buttonName: 'Sign In',
                      onTap: () {
                        Get.snackbar("Wait a minute!", "The API response in horribly slow :p",
                            backgroundColor: Colors.greenAccent,duration: const Duration( seconds: 4),
                            icon: const Icon(Icons.check));
                        state
                            .login(
                                username: state.username.value,
                                password: state.password.value)
                            .then((data) {
                          if (data!.token != null) {
                            Get.to(Dashboard());
                            Get.snackbar("Attention!", "Login Success!",
                                backgroundColor: Colors.greenAccent,duration: const Duration( seconds: 2),
                                icon: const Icon(Icons.check));
                          } else {
                            Get.snackbar("Attention!", "Login Failed!",
                                backgroundColor: Colors.redAccent,
                                icon: Icon(Icons.warning));
                          }
                        });
                      },
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    const SizedBox(
                      height: 108,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(SignUp(), transition: Transition.rightToLeft);
                        },
                        child: RichText(
                          text: const TextSpan(
                            text: 'Don\'t have an account?',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: kGray3),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' Sign Up',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: kPrimaryColor)),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
