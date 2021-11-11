import 'package:api_auth_demo/modules/authentication/view/component/screen_tittle.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ScreenTittle(
              tittle: 'Welcome to weDevs',
            ),
            SizedBox(height: 50,)



          ],
        ),
      ),
    );
  }
}
