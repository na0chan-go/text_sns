import 'package:fluttertoast/fluttertoast.dart';

class UiHelper {
  static Future<void> showFlutterToast(String msg) async {
    await Fluttertoast.showToast(msg: msg);
  }
}
