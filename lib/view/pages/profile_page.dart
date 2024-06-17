import 'package:flutter/material.dart';
import 'package:text_sns/view/common/basic_page.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/main_controller.dart';
import 'package:text_sns/view/common/byte_image.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  static const path = '/profile/:uid';
  static String generatePath(String uid) => '/profile/$uid';
  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 30.0);
    return BasicPage(
      appBarTitle: '自分のプロフィール',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Obx(
              () => Text(MainController.to.rxPublicUser.value?.name ?? 'null',
                  style: style),
            ),
            const SizedBox(height: 20.0),
            Obx(
              () => ByteImage(
                bytes: MainController.to.rxUint8List.value,
                length: 120.0,
              ),
            ),
            const SizedBox(height: 20.0),
            Obx(() {
              final publicUser = MainController.to.rxPublicUser.value;
              if (publicUser == null) {
                return const SizedBox.shrink();
              } else {
                final data = publicUser.isAppropriate ? '適切な画像です' : '不適切な画像です';
                return Text(data, style: style);
              }
            }),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
