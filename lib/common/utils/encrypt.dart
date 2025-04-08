/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-08 18:07:58
 * @LastEditTime: 2025-04-08 18:19:45
 * @FilePath: /flutter_woo_2025/lib/common/utils/encrypt.dart
 * @Description: 加密
 */
import 'package:encrypt/encrypt.dart';

import '../index.dart';

class EncryptUtil {
  static final EncryptUtil _instance = EncryptUtil._internal();
  factory EncryptUtil() => _instance;

  // 私有构造函数
  EncryptUtil._internal() {
    encrypter = Encrypter(AES(
      key,
      mode: AESMode.cbc,
      padding: 'PKCS7',
    ));
  }

  final key = Key.fromUtf8(Constants.aesKey); // 加密密钥
  final iv = IV.fromUtf8(Constants.aesIV); // 加密向量
  late Encrypter encrypter; // 加密器

  /// aes加密
  String aesEncode(String content) {
    final encrypted = encrypter.encrypt(content, iv: iv);
    return encrypted.base64;
  }
}
