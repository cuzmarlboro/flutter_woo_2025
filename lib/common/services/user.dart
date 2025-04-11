/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-09 01:11:49
 * @LastEditTime: 2025-04-11 23:25:54
 * @FilePath: /flutter_woo_2025/lib/common/services/user.dart
 * @Description: 
 */
import 'dart:convert';
import 'package:get/get.dart';

import '../index.dart';

class UserService extends GetxService {
  static UserService get to => Get.find();

  // 是否登录
  final _isLogin = false.obs;

  // 用户令牌
  String token = '';

  // 用户的资料
  final _profile = UserProfileModel().obs;

  /// 是否登录
  bool get isLogin => _isLogin.value;

  /// 用户 profile
  UserProfileModel get profile => _profile.value;

  /// 是否有令牌 token
  bool get hasToken => token.isNotEmpty;

  /// 送货地址
  String get shipping =>
      "${profile.shipping?.address1}, ${profile.shipping?.postcode}, ${profile.shipping?.state}, ${profile.shipping?.country}";

  /// 注销
  Future<void> logout() async {
    await Storage().remove(Constants.storageToken);
    _profile(UserProfileModel());
    _isLogin.value = false;
    token = '';
  }

  @override
  void onInit() {
    super.onInit();
    // 读 token
    token = Storage().getString(Constants.storageToken);
    // 读 profile
    var profileOffline = Storage().getString(Constants.storageProfile);
    if (profileOffline.isNotEmpty) {
      _profile(UserProfileModel.fromJson(jsonDecode(profileOffline)));
    }
  }

  /// 设置令牌
  Future<void> setToken(String value) async {
    await Storage().setString(Constants.storageToken, value);
    token = value;
  }

  /// 获取用户 profile
  Future<void> getProfile() async {
    if (token.isEmpty) return;
    UserProfileModel result = await UserApi.profile();
    _profile(result);
    _isLogin.value = true;

    Storage().setString(Constants.storageProfile, jsonEncode(result));
  }

  /// 设置用户 profile
  Future<void> setProfile(UserProfileModel profile) async {
    if (token.isEmpty) return;
    _isLogin.value = true;
    _profile(profile);
    Storage().setString(Constants.storageProfile, jsonEncode(profile));
  }

  /// 检查是否登录
  Future<bool> checkIsLogin() async {
    if (_isLogin.value == false) {
      await Get.toNamed(RouteNames.systemLogin);
      return false;
    }
    return true;
  }
}
