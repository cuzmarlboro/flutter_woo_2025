/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-06 00:24:00
 * @LastEditTime: 2025-04-09 01:01:11
 * @FilePath: /flutter_woo_2025/lib/common/values/constants.dart
 * @Description: 常量
 */

class Constants {
  // wp 服务器
  static const wpApiBaseUrl = 'https://wpapi.ducafecat.tech';

  // 本地存储 key
  static const storageLanguageCode = 'language_code';

  // 是否已经打开过APP
  static const storageAlreadyOpen = 'already_open';

  // AES
  static const aesKey = 'aH5aH5bG0dC6aA3oN0cK4aU5jU6aK2lN'; // 加密密钥
  static const aesIV = 'hK6eB4aE1aF3gH5q'; // 加密向量

  // 登录鉴权
  static const storageToken = 'token'; // 登录成功后 token
  static const storageProfile = 'profile'; // 用户资料缓存
}
