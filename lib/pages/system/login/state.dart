/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-06 01:55:42
 * @LastEditTime: 2025-04-06 02:49:52
 * @FilePath: /flutter_woo_2025/lib/pages/system/login/state.dart
 * @Description: 
 */
import 'package:get/get.dart';

class LoginState {
  // title
  final _title = "11111".obs;
  set title(value) => _title.value = value;
  get title => _title.value;
}
