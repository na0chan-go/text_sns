import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/abstract/simple_form_controller.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/enums/reauthenticate_purpose.dart';
import 'package:text_sns/repository/auth_repository.dart';
import 'package:text_sns/ui_core/ui_helper.dart';
import 'package:text_sns/ui_core/validator_core.dart';
import 'package:text_sns/view/pages/reauthenticate_page.dart';
import 'package:text_sns/view/pages/update_email_page.dart';
import 'package:text_sns/view/pages/update_password_page.dart';

class ReauthenticateController extends SimpleFormController {
  @override
  String get title => '再認証';
  @override
  String get hintText => '現在のパスワード';
  @override
  String? Function(String? p1)? get validator => ValidatorCore.password;
  @override
  String get positiveButtonText => '送信';
  @override
  String get successMsg => '再認証に成功しました';
  @override
  String get failureMsg => '再認証に失敗しました';
  @override
  bool get obscureText => true;

  @override
  void onPositiveButtonPressed() async {
    if (!ValidatorCore.isValidPassword(text)) return; // パスワードが有効でなければ終了させる
    final repository = AuthRepository();
    final user = AuthController.to.rxAuthUser.value;
    if (user == null) return;
    final result = await repository.reauthenticateWithCredential(user, text);
    result.when(success: (_) {
      const key = ReauthenticatePage.purposeKey;
      final purpose = Get.parameters[key];
      if (purpose == null) return;
      final enumPurpose = ReauthenticatePurpose.values.byName(purpose);
      debugPrint('enumPurpose: $enumPurpose');
      switch (enumPurpose) {
        case ReauthenticatePurpose.updateEmail:
          Get.to(const UpdateEmailPage());
          break;
        case ReauthenticatePurpose.updatePassword:
          Get.to(const UpdatePasswordPage());
          break;
        case ReauthenticatePurpose.deleteUser:
          // TODO: ユーザー削除処理を追加
          break;
      }
      UiHelper.showFlutterToast(successMsg);
    }, failure: () {
      UiHelper.showFlutterToast(failureMsg);
    });
  }
}
