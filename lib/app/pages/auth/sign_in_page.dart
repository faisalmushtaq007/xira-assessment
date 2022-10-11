import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
        providerConfigs: const [EmailProviderConfiguration(), PhoneProviderConfiguration()],
        footerBuilder: (context, _) {
          return Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'By signing in, you agree to our terms and conditions.',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 30,),
                  Text(
                    'Admin credentials are: faisal@admin.com : 123456',
                    style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w300),
                  ),
                ],
              ));
        });
  }
}
