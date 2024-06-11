import 'package:flutter/widgets.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 40.0);
    return const Center(
        child: Text(
      'メールアドレスを認証する',
      style: style,
    ));
  }
}
