import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:text_sns/repository/auth_repository.dart';
import 'package:text_sns/ui_core/ui_helper.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find<AuthController>();
  final rxAuthUser = Rx<User?>(FirebaseAuth.instance.currentUser);
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

  void onPositiveButtonPressed() async {
    if (GetUtils.isEmail(email) && password.length >= 8) {
      rxIsLoginMode.value
          ? await _signInWithEmailAndPassword()
          : await _createUserWithEmailAndPassword();
    }
  }

  void onSignOutButtonPressed() async {
    await _signOut();
  }

  Future<void> _createUserWithEmailAndPassword() async {
    final repository = AuthRepository();
    final result = await repository.createUserWithEmailAndPassword(
        email.trim(), password.trim());
    result.when(
      success: (res) {
        rxAuthUser.value = res;
        UiHelper.showFlutterToast('新規登録が成功しました');
      },
      failure: () {
        UiHelper.showFlutterToast('新規登録が失敗しました');
      },
    );
  }

  Future<void> _signInWithEmailAndPassword() async {}

  Future<void> _signOut() async {
    final repository = AuthRepository();
    final result = await repository.signOut();
    result.when(
      success: (_) {
        rxAuthUser.value = null;
        UiHelper.showFlutterToast('ログアウトが成功しました');
      },
      failure: () {
        UiHelper.showFlutterToast('ログアウトが失敗しました');
      },
    );
  }

  void onToggleIsLoginModeButtonPressed() => _toggleIsLoginMode();
  void _toggleIsLoginMode() => rxIsLoginMode.value = !rxIsLoginMode.value;
}
