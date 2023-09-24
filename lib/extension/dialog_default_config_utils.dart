/*
 * @Author: lipeng 1162423147@qq.com
 * @Date: 2023-09-24 11:14:35
 * @LastEditors: lipeng 1162423147@qq.com
 * @LastEditTime: 2023-09-24 11:19:57
 * @FilePath: /phoenix_dialog/lib/extension/dialog_default_config_utils.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:phoenix_base/phoenix.dart';

import '../config/dialog_config.dart';

/// Dialog默认配置
extension BaseDialogConfigUtils on BaseDefaultConfigUtils {
  ///
  static DialogConfig defaultDialogConfig = DialogConfig(
    dialogWidth: 300.0,
    radius: BaseDefaultConfigUtils.defaultCommonConfig.radiusLg,
    iconPadding: EdgeInsets.only(
        top: BaseDefaultConfigUtils.defaultCommonConfig.vSpacingXxl),
    titlePaddingSm: EdgeInsets.only(
      top: 12.0,
      left: BaseDefaultConfigUtils.defaultCommonConfig.hSpacingXxl,
      right: BaseDefaultConfigUtils.defaultCommonConfig.hSpacingXxl,
    ),
    titlePaddingLg: EdgeInsets.only(
      top: 28.0,
      left: BaseDefaultConfigUtils.defaultCommonConfig.hSpacingXxl,
      right: BaseDefaultConfigUtils.defaultCommonConfig.hSpacingXxl,
    ),
    titleTextStyle: BaseTextStyle(
      fontWeight: FontWeight.w600,
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeHead,
      color: BaseDefaultConfigUtils.defaultCommonConfig.colorTextBase,
    ),
    titleTextAlign: TextAlign.center,
    contentPaddingSm: EdgeInsets.only(
      top: 8.0,
      left: BaseDefaultConfigUtils.defaultCommonConfig.hSpacingXl,
      right: BaseDefaultConfigUtils.defaultCommonConfig.hSpacingXl,
    ),
    contentPaddingLg: EdgeInsets.only(
      top: 28.0,
      left: BaseDefaultConfigUtils.defaultCommonConfig.hSpacingXl,
      right: BaseDefaultConfigUtils.defaultCommonConfig.hSpacingXl,
    ),
    contentTextStyle: BaseTextStyle(
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeBase,
      color: BaseDefaultConfigUtils.defaultCommonConfig.colorTextImportant,
      decoration: TextDecoration.none,
    ),
    contentTextAlign: TextAlign.center,
    warningPaddingSm: EdgeInsets.only(
      top: 6.0,
      left: BaseDefaultConfigUtils.defaultCommonConfig.hSpacingXl,
      right: BaseDefaultConfigUtils.defaultCommonConfig.hSpacingXl,
    ),
    warningPaddingLg: EdgeInsets.only(
      top: 28.0,
      left: BaseDefaultConfigUtils.defaultCommonConfig.hSpacingXl,
      right: BaseDefaultConfigUtils.defaultCommonConfig.hSpacingXl,
    ),
    warningTextAlign: TextAlign.center,
    warningTextStyle: BaseTextStyle(
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeBase,
      color: BaseDefaultConfigUtils.defaultCommonConfig.brandError,
      decoration: TextDecoration.none,
    ),
    dividerPadding: const EdgeInsets.only(top: 28.0),
    mainActionTextStyle: BaseTextStyle(
      color: BaseDefaultConfigUtils.defaultCommonConfig.brandPrimary,
      fontWeight: FontWeight.w600,
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeSubHead,
    ),
    assistActionsTextStyle: BaseTextStyle(
      color: BaseDefaultConfigUtils.defaultCommonConfig.colorTextBase,
      fontWeight: FontWeight.w600,
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeSubHead,
    ),
    mainActionBackgroundColor:
        BaseDefaultConfigUtils.defaultCommonConfig.fillBase,
    assistActionsBackgroundColor:
        BaseDefaultConfigUtils.defaultCommonConfig.fillBase,
    bottomHeight: 44.0,
    backgroundColor: BaseDefaultConfigUtils.defaultCommonConfig.fillBase,
  );
}
