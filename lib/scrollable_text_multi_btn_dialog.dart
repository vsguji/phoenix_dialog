import 'package:flutter/material.dart';
import 'package:phoenix_base/phoenix.dart';
import 'package:phoenix_dialog/content_multi_btn_export_dialog.dart';

///  纯文本展示Dialog 超过定高可滚动
///  可有操作区域也可没有皂搓区域
class ScrollableTextMultiBtnDialog extends Dialog {
  /// 标题
  final String? title;

  /// 是否可关闭 默认true支持关闭
  final bool isClose;

  /// 中间富文本内容
  final String contentText;

  /// 文字颜色 默认 Color(0xFF666666)
  final Color textColor;

  /// 文字字体大小 默认 16
  final double textFontSize;

  /// 提交按钮文字
  final String? submitText;

  /// 次要按钮文案，为空则不显示次要按钮
  final String? secondaryButtonText;

  /// 操作按钮背景色
  final Color? submitBgColor;

  /// 提交操作
  final VoidCallback? onSubmitClick;

  /// 次要按钮回调
  final VoidCallback? onSecondaryButtonClick;

  /// 富文本超链接点击回调
  final HyperLinkCallback? linksCallback;

  /// 是否展示底部操作区域 默认true展示
  final bool isShowOperateWidget;

  const ScrollableTextMultiBtnDialog(
      {super.key,
      this.title,
      this.isClose = true,
      required this.contentText,
      this.textColor = const Color(0xFF666666),
      this.textFontSize = 16,
      this.submitText,
      this.secondaryButtonText,
      this.onSubmitClick,
      this.onSecondaryButtonClick,
      this.submitBgColor,
      this.linksCallback,
      this.isShowOperateWidget = true});

  @override
  Widget build(BuildContext context) {
    return ScrollableTextMultiBtn(
        title: title,
        isClose: isClose,
        contentText: contentText,
        textColor: textColor,
        textFontSize: textFontSize,
        submitText: submitText,
        onSubmitClick: onSubmitClick,
        submitBgColor: submitBgColor,
        linksCallback: linksCallback,
        isShowOperateWidget: isShowOperateWidget);
  }
}

class ScrollableTextMultiBtn extends StatelessWidget {
  /// 标题
  final String? title;

  /// 是否可关闭
  final bool isClose;

  /// 中间富文本内容
  final String contentText;

  /// 文字颜色
  final Color? textColor;

  /// 文字字体
  final double? textFontSize;

  /// 提交按钮文字
  final String? submitText;

  /// 次要按钮文案，为空则不显示次要按钮
  final String? secondaryButtonText;

  /// 提交操作
  final VoidCallback? onSubmitClick;

  /// 操作按钮背景色
  final Color? submitBgColor;

  /// 次要按钮回调
  final VoidCallback? onSecondaryButtonClick;

  /// 富文本超链接点击回调
  final HyperLinkCallback? linksCallback;

  /// 是否展示底部操作区域
  final bool isShowOperateWidget;

  const ScrollableTextMultiBtn(
      {super.key,
      this.title,
      this.isClose = true,
      required this.contentText,
      this.textColor,
      this.textFontSize,
      this.submitText,
      this.secondaryButtonText,
      this.onSubmitClick,
      this.submitBgColor,
      this.onSecondaryButtonClick,
      this.linksCallback,
      this.isShowOperateWidget = true});

  @override
  Widget build(BuildContext context) {
    return ContentMultiBtnExportWidget(
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 8, 0),
        child: Container(
          constraints: const BoxConstraints(maxHeight: 220),
          child: Scrollbar(
            radius: const Radius.circular(2.0),
            thickness: 4.0,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: SingleChildScrollView(
                primary: true,
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  BrnCSS2Text.toTextView(contentText,
                      linksCallback: linksCallback,
                      defaultStyle: TextStyle(
                          fontSize: textFontSize,
                          color: textColor,
                          fontWeight: FontWeight.normal))
                ]),
              ),
            ),
          ),
        ),
      ),
      title: title,
      isClose: isClose,
      submitText: submitText,
      submitBgColor: submitBgColor,
      onSubmit: () {
        if (onSubmitClick != null) {
          onSubmitClick!();
        }
      },
      isShowOperateWidget: isShowOperateWidget,
    );
  }
}
