import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/verify_email_controller.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyEmailController());
    const style = TextStyle(fontSize: 40.0);
    return const Center(
        child: Text(
      'メールアドレスを認証する',
      style: style,
    ));
  }
}
