import 'package:api_auth_demo/global/constant.dart';
import 'package:api_auth_demo/modules/authentication/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'component/custom_button.dart';
import 'component/screen_tittle.dart';
import 'component/testfield_tittle.dart';
import 'component/text_field.dart';
import 'login.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthState state = Get.find();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:   [
              const ScreenTittle(
                tittle: 'Create new account',
              ),
              const TextFieldTittle(
                name: 'Username',
              ),
              const SizedBox(
                height: 16,
              ),
              TextFieldWidget(
                hintText: 'Username',
                obscureText: false,
                suffixIconData: Icons.account_box_rounded,
                onChanged: (value) {
                  state.setUsername(value);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              const TextFieldTittle(
                name: 'Email',
              ),
              const SizedBox(
                height: 16,
              ),
              TextFieldWidget(
                hintText: 'Email',
                obscureText: false,
                suffixIconData: Icons.email,
                onChanged: (value) {
                  state.setEmail(value);
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
                obscureText: false,
                suffixIconData: Icons.visibility,
                onChanged: (value) {
                  state.password(value);
                },
              ),


              const SizedBox(
                height: 36,
              ),
              CustomButton(
                buttonName: 'Sign Up',
                onTap: () async{
                  Get.snackbar("Wait a minute!", "The API response in horribly slow!",
                      backgroundColor: Colors.greenAccent,duration: const Duration( seconds: 4),
                      icon: const Icon(Icons.check));

               bool result=  await state
                      .registerUser(
                      username: state.username.value,
                      password: state.password.value,
                      email: state.email.value);

               if(result){
                 Get.to(SignIn(),
                   transition: Transition.leftToRightWithFade
                 );
                 Get.snackbar("Attention!", "Login Success!",
                     backgroundColor: Colors.greenAccent,duration: const Duration( seconds: 2),
                     icon: const Icon(Icons.check));

               }

               else{
                 Get.snackbar("Bad Luck!", "Time out or you already have a account with this email",
                     backgroundColor: kRed,duration: const Duration( seconds: 3),
                     icon: const Icon(Icons.check));
               }



                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
