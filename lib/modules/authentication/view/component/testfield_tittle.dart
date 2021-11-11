import 'package:api_auth_demo/global/constant.dart';
import 'package:flutter/material.dart';


class TextFieldTittle extends StatelessWidget {
  const TextFieldTittle({
    Key? key, required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
          color: kGray3,
          fontSize: 16,
          fontWeight: FontWeight.w700),
    );
  }
}