/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-08 18:27:37
 * @LastEditTime: 2025-04-09 01:19:10
 * @FilePath: /flutter_woo_2025/lib/common/api/user.dart
 * @Description: 用户 api
 */
import 'package:flutter_woo_2025/common/index.dart';

class UserApi {
  /// 注册
  static Future<bool> register(UserRegisterReq? req) async {
    var res = await WPHttpService.to.post(
      '/users/register',
      data: req,
    );

    if (res.statusCode == 201) {
      return true;
    }
    return false;
  }

  /// 登录
  static Future<UserTokenModel> login(UserLoginReq? req) async {
    var res = await WPHttpService.to.post(
      '/users/login',
      data: req,
    );
    return UserTokenModel.fromJson(res.data);
  }

  /// Profile
  static Future<UserProfileModel> profile() async {
    var res = await WPHttpService.to.get(
      '/users/me',
    );
    return UserProfileModel.fromJson(res.data);
  }
}
