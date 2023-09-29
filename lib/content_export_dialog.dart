import 'package:flutter/material.dart';
import 'package:phoenix_base/phoenix.dart';
import 'package:phoenix_dialog/extension/dialog_total_config.dart';

import 'dialog_utils.dart';
import 'config/dialog_config.dart';
import 'extension/dialog_assets.dart';

/// 描述: 内容可扩展Dialog
// ignore: must_be_immutable
class ContentExportWidget extends StatelessWidget {
  /// 标题
  final String? title;

  /// 是否可关闭
  final bool isClose;

  /// 中间内容widget
  final Widget? contentWidget;

  /// 提交按钮文字
  final String? submitText;

  /// 内容最大高度
  final Color? submitBgColor;

  /// 提交操作
  final VoidCallback? onSubmit;

  /// 是否展示底部操作区域
  final bool isShowOperateWidget;

  /// the theme config for common bruno dialog
  DialogConfig? themeData;

  ContentExportWidget(this.contentWidget,
      {this.title,
      required this.isClose,
      this.submitText,
      this.onSubmit,
      this.submitBgColor,
      required this.isShowOperateWidget,
      this.themeData}) {
    themeData ??= DialogConfig();
    themeData = BaseThemeConfig.instance
        .getConfig(configId: themeData!.configId)
        .dialogConfig
        .merge(themeData);
  }

  /// 当content含TextField  键盘弹起遮挡内容
  /// 因此顶级父Widget 采用SingleChildScrollView

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0x33999999),
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 300),
                    decoration: BoxDecoration(
                      //背景
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(
                          DialogUtils.getDialogRadius(themeData!))), //设置四周圆角 角度
                    ),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            _generateTitleWidget(),
                            contentWidget ?? Container(),
                            _generateBottomWidget(context),
                          ],
                        ),
                        _generateCloseWidget(context),
                      ],
                    ),
                  ),
                )),
          ),
        ));
  }

  Widget _generateCloseWidget(BuildContext context) {
    if (isClose) {
      return Positioned(
          right: 0.0,
          child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: PhoenixTools.getAssetImage(DialogAssets.iconPickerClose,package: 'phoenix_dialog'),
              )));
    }
    return const SizedBox.shrink();
  }

  /// 构建Dialog标题
  Widget _generateTitleWidget() {
    return Padding(
      padding: null != title && title!.isNotEmpty
          ? const EdgeInsets.fromLTRB(20, 28, 20, 12)
          : const EdgeInsets.only(top: 20),
      child: null != title && title!.isNotEmpty
          ? Text(
              title!,
              style: DialogUtils.getDialogTitleStyle(themeData!),
            )
          : Container(),
    );
  }

  /// 构建底部操作按钮
  Widget _generateBottomWidget(BuildContext context) {
    return Padding(
        padding: isShowOperateWidget
            ? const EdgeInsets.fromLTRB(20, 12, 20, 20)
            : const EdgeInsets.only(top: 20),
        child: isShowOperateWidget
            ? GestureDetector(
                child: Container(
                    decoration: BoxDecoration(
                      //背景
                      color:
                          submitBgColor ?? themeData!.commonConfig.brandPrimary,
                      borderRadius: const BorderRadius.all(
                          Radius.circular(6.0)), //设置四周圆角 角度
                    ),
                    alignment: Alignment.center,
                    height: 48,
                    child: Text(submitText ?? "",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 18))),
                onTap: () {
                  if (onSubmit != null) onSubmit!();
                },
              )
            : const SizedBox.shrink());
  }
}
