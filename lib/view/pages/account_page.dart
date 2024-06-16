import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/view/common/basic_page.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});
  static const path = '/account';
  @override
  Widget build(BuildContext context) {
    final controller = AuthController.to;
    return BasicPage(
      appBarTitle: 'アカウントページ',
      child: ListView(
        children: [
          Obx(() {
            final authUser = controller.rxAuthUser.value;
            final data = authUser == null ? 'Null' : authUser.email!;
            return ListTile(
              title: Text(data),
              trailing: InkWell(
                onTap: controller.onEditEmailButtonPressed,
                child: const Icon(Icons.edit),
              ),
            );
          }),
          ListTile(
            title: const Text('ログアウトを行う'),
            onTap: controller.onSignOutButtonPressed,
          ),
        ],
      ),
    );
  }
}
