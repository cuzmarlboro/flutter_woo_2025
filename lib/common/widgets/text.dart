import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_woo_2025/common/style/scale.dart';

// 排版类型
enum TextWidgetType {
  h1, // 标题1
  h2, // 标题2
  h3, // 标题3
  h4, // 标题4
  body, // 正文
  label, // 标签
  muted, // 提示
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text, // 文字
    this.type, // 排版类型
    this.size, // 字体大小
    this.scale, // 缩放
    this.textStyle, // 文字样式
    this.color, // 颜色
    this.weight, // 重量
    this.maxLines, // 最大行数
    this.softWrap, // 自动换行
    this.overflow, // 溢出
    this.textAlign, // 对齐方式
    this.fontStyle, // 字体样式
  });

  /// 文字
  final String text;

  /// 排版类型
  final TextWidgetType? type;

  /// 缩放 large medium small
  final WidgetScale? scale;

  /// 组件样式
  final TextStyle? textStyle;

  /// 字体样式
  final FontStyle? fontStyle;

  /// 颜色
  final Color? color;

  /// 大小
  final double? size;

  /// 重量
  final FontWeight? weight;

  /// 行数
  final int? maxLines;

  /// 自动换行
  final bool? softWrap;

  /// 溢出
  final TextOverflow? overflow;

  /// 对齐方式
  final TextAlign? textAlign;

  /// h1
  const TextWidget.h1(
    this.text, {
    super.key,
    this.scale,
    this.size,
    this.color,
    this.weight = FontWeight.w800,
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.textAlign,
    this.textStyle,
    this.fontStyle,
  }) : type = TextWidgetType.h1;

  /// h2
  const TextWidget.h2(
    this.text, {
    super.key,
    this.scale,
    this.size,
    this.color,
    this.weight = FontWeight.w600,
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.textAlign,
    this.textStyle,
    this.fontStyle,
  }) : type = TextWidgetType.h2;

  /// h3
  const TextWidget.h3(
    this.text, {
    super.key,
    this.scale,
    this.size,
    this.color,
    this.weight = FontWeight.w600,
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.textAlign,
    this.textStyle,
    this.fontStyle,
  }) : type = TextWidgetType.h3;

  /// h4
  const TextWidget.h4(
    this.text, {
    super.key,
    this.scale,
    this.size,
    this.color,
    this.weight = FontWeight.w600,
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.textAlign,
    this.textStyle,
    this.fontStyle,
  }) : type = TextWidgetType.h4;

  /// body
  const TextWidget.body(
    this.text, {
    super.key,
    this.scale,
    this.size,
    this.color,
    this.weight = FontWeight.w400,
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.textAlign,
    this.textStyle,
    this.fontStyle,
  }) : type = TextWidgetType.body;

  /// label
  const TextWidget.label(
    this.text, {
    super.key,
    this.scale,
    this.size,
    this.color,
    this.weight = FontWeight.w400,
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.textAlign,
    this.textStyle,
    this.fontStyle,
  }) : type = TextWidgetType.label;

  /// muted
  const TextWidget.muted(
    this.text, {
    super.key,
    this.scale,
    this.size,
    this.color,
    this.weight = FontWeight.w400,
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.textAlign,
    this.textStyle,
    this.fontStyle,
  }) : type = TextWidgetType.muted;

  /// 文字尺寸
  double _fontSize() {
    // 计算字体
    // https://tailwindcss.com/docs/font-size
    double fontSize = size ?? 0;
    if (fontSize == 0) {
      switch (type) {
        case TextWidgetType.h1:
          fontSize = 36;
        case TextWidgetType.h2:
          fontSize = 30;
        case TextWidgetType.h3:
          fontSize = 24;
        case TextWidgetType.h4:
          fontSize = 20;
        case TextWidgetType.body:
          fontSize = 16;
        case TextWidgetType.label:
          fontSize = 14;
        case TextWidgetType.muted:
          fontSize = 12;
        default:
          fontSize = 14;
      }
    }

    // 计算缩放
    // https://m3.material.io/styles/typography/type-scale-tokens
    switch (scale) {
      case WidgetScale.large:
        return fontSize * 1.3;
      case WidgetScale.medium:
        return fontSize;
      case WidgetScale.small:
        return fontSize * 0.8;
      default:
        return fontSize;
    }
  }

  Color _color(BuildContext context) {
    if (color != null) {
      return color!;
    }

    switch (type) {
      case TextWidgetType.h1:
      case TextWidgetType.h2:
      case TextWidgetType.h3:
      case TextWidgetType.h4:
      case TextWidgetType.body:
      case TextWidgetType.label:
        return context.colors.scheme.onSurface;
      case TextWidgetType.muted:
        return context.colors.scheme.onSurface.withOpacity(0.8);
      default:
        return context.colors.scheme.onSurface;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: _color(context), // 颜色
        fontSize: _fontSize(), // 字体大小
        fontWeight: weight, // 重量
        fontStyle: fontStyle, // 字体样式
      ),
      maxLines: maxLines, // 最大行数
      softWrap: softWrap, // 自动换行
      overflow: overflow, // 溢出
      textAlign: textAlign, // 对齐方式
    );
  }
}
