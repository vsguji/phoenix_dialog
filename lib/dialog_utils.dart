/*
 * @Author: lipeng 1162423147@qq.com
 * @Date: 2023-09-13 20:09:03
 * @LastEditors: lipeng 1162423147@qq.com
 * @LastEditTime: 2023-09-24 11:22:46
 * @FilePath: /phoenix_dialog/lib/brn_dialog_utils.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';

import 'config/dialog_config.dart';

/// 弹窗的工具类
class DialogUtils {
  /// dialog标题配置
  static TextStyle getDialogTitleStyle(DialogConfig themeData) {
    return themeData.titleTextStyle.generateTextStyle();
  }

  /// dialog圆角配置
  static double getDialogRadius(DialogConfig themeData) {
    return themeData.radius;
  }
}
