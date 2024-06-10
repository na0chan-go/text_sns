import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find<AuthController>();
  final rxAuthUser = Rx<User?>(null);
  final rxIsLoginMode = true.obs;
  String email = '';
  String password = '';

  void setEmail(String? value) {
    // valueがnullの場合はreturn
    if (value == null) return;
    email = value;
  }

  void setPassword(String? value) {
    // valueがnullの場合はreturn
    if (value == null) return;
    password = value;
  }

  void onToggleIsLoginModeButtonPressed() => _toggleIsLoginMode();
  void _toggleIsLoginMode() => rxIsLoginMode.value = !rxIsLoginMode.value;
}
