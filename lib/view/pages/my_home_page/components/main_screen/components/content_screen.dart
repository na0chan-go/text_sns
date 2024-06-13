import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/controllers/main_controller.dart';
import 'package:text_sns/view/common/byte_image.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final authController = AuthController.to;
    const style = TextStyle(fontSize: 30.0);
    return Column(
      children: [
        Obx(
          () => Text(MainController.to.rxPublicUser.value?.name ?? 'null',
              style: style),
        ),
        const SizedBox(height: 20.0),
        Obx(
          () => ByteImage(bytes: MainController.to.rxUint8List.value),
        ),
        ElevatedButton(
            onPressed: authController.onSignOutButtonPressed,
            child: const Text('ログアウト', style: style)),
      ],
    );
  }
}
