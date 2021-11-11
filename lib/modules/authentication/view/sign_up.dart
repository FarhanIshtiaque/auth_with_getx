import 'package:flutter/material.dart';

import 'component/custom_button.dart';
import 'component/screen_tittle.dart';
import 'component/testfield_tittle.dart';
import 'component/text_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:   [
              const ScreenTittle(
                tittle: 'Sign up to weDevs',
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
                onChanged: (value) {},
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
                onChanged: (value) {},
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
                onChanged: (value) {},
              ),


              const SizedBox(
                height: 36,
              ),
              CustomButton(
                buttonName: 'Sign Up',
                onTap: (){

                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
