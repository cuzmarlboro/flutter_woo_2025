/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-09 01:01:29
 * @LastEditTime: 2025-04-09 01:01:34
 * @FilePath: /flutter_woo_2025/lib/common/models/request/user_login.dart
 * @Description: 用户登录请求
 */
/// 用户登录
class UserLoginReq {
  String? username;
  String? password;

  UserLoginReq({
    this.username,
    this.password,
  });

  factory UserLoginReq.fromJson(Map<String, dynamic> json) {
    return UserLoginReq(
      username: json['username'] as String?,
      password: json['password'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
}
