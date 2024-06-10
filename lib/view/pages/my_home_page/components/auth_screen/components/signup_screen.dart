import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/auth_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late double? _deviceHeight;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _deviceHeight = size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          _titleWidget(),
          _signupForm(),
          _positiveButton(),
        ],
      ),
    );
  }

  // タイトル関数
  Widget _titleWidget() {
    return const Text(
      '新規登録',
      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
    );
  }

  // 入力フォーム関数
  Widget _signupForm() {
    return SizedBox(
      height: _deviceHeight! * 0.30,
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              _emailTextField(),
              _passwordTextField(),
            ],
          )),
    );
  }

  // email入力をする関数
  Widget _emailTextField() {
    final controller = AuthController.to;
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'メールアドレス',
      ),
      // フォームフィールドの情報を変数に保存する
      onSaved: controller.setEmail,
      validator: (value) {
        // メールアドレスのバリデーション
        return GetUtils.isEmail(value!) ? null : 'メールアドレスを入力してください';
      },
    );
  }

  // password入力をする関数
  Widget _passwordTextField() {
    final controller = AuthController.to;
    return TextFormField(
      obscureText: true, // パスワードを隠す
      decoration: const InputDecoration(
        hintText: 'パスワード',
      ),
      onSaved: controller.setPassword,
      validator: (value) {
        // パスワードのバリデーション
        return value!.length >= 8 ? null : 'パスワードは8文字以上で入力してください';
      },
    );
  }

  // 送信ボタン関数
  Widget _positiveButton() {
    return ElevatedButton(
      onPressed: () {
        // バリデーションを行う
        if (_formKey.currentState!.validate()) {
          // フォームフィールドの情報を変数に保存する
          _formKey.currentState!.save();
        }
      },
      child: const Text('送信'),
    );
  }
}
