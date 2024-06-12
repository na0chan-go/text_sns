import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/controllers/my_home_page_controller.dart';
import 'package:text_sns/controllers/remote_config_controller.dart';
import 'package:text_sns/view/pages/my_home_page/components/auth_screen/auth_screen.dart';
import 'package:text_sns/view/pages/my_home_page/components/verify_email_screen.dart';
import 'package:text_sns/view/pages/my_home_page/components/maintenance_screen.dart';
import '../../../flavors.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MyHomePageController());
    final authController = Get.put(AuthController());
    final remoteConfigController = Get.put(RemoteConfigController());
    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
      ),
      body: Obx(() {
        const style = TextStyle(fontSize: 60.0);
        final authUser = authController.rxAuthUser.value;
        if (remoteConfigController.rxIsMaintenanceMode.value == true) {
          return const MaintenanceScreen();
        } else if (authUser == null) {
          return const AuthScreen();
        } else if (!authUser.emailVerified) {
          return const VerifyEmailScreen();
        } else {
          return ElevatedButton(
              onPressed: authController.onSignOutButtonPressed,
              child: const Text('ログアウト', style: style));
        }
      }),
    );
  }
}
