import 'package:api_auth_demo/global/constant.dart';
import 'package:flutter/material.dart';

class ScreenTittle extends StatelessWidget {
  const ScreenTittle({
    Key? key, required this.tittle,
  }) : super(key: key);

  final String tittle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 48,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/weDevs.png',
              height:28,
            ),
            const SizedBox(
              width: 8,
            ),
            const Text(
              'weDevs',
              style: TextStyle(
                  color: kDeepBlue,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
        const SizedBox(
          height: 24,
        ),
         Text(
          tittle,
          style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: kGray3),
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}