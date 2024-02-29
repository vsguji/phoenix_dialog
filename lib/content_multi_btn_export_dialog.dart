import 'package:flutter/material.dart';
import 'package:phoenix_base/phoenix.dart';
import 'package:phoenix_btn/button/big_main_button.dart';
import 'package:phoenix_dialog/extension/dialog_total_config.dart';

import 'dialog_utils.dart';
import 'config/dialog_config.dart';
import 'extension/dialog_assets.dart';

/// 描述: 内容可扩展Dialog
// ignore: must_be_immutable
class ContentMultiBtnExportWidget extends StatelessWidget {
  /// 标题
  final String? title;

  /// 是否可关闭
  final bool isClose;

  /// 中间内容widget
  final Widget? contentWidget;

  /// 提交按钮文字
  final String? submitText;

  /// 次要按钮文案，为空则不显示次要按钮
  final String? secondaryButtonText;

  /// 内容最大高度
  final Color? submitBgColor;

  /// 次要按钮回调
  final VoidCallback? onSecondaryButtonClick;

  /// 提交操作
  final VoidCallback? onSubmit;

  /// 是否展示底部操作区域
  final bool isShowOperateWidget;

  /// the theme config for common bruno dialog
  DialogConfig? themeData;

  ContentMultiBtnExportWidget(this.contentWidget,
      {super.key,
      this.title,
      required this.isClose,
      this.submitText,
      this.secondaryButtonText,
      this.onSecondaryButtonClick,
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
                            ..._configDialogWidgets(context),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        ));
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
  /// 构建widgets框架
  List<Widget> _configDialogWidgets(BuildContext context) {
    List<Widget> widgets = [];
    //分割
    widgets.add(Container(
      height: 16,
      color: Colors.transparent,
    ));
    // 主要按钮
    widgets.add(_configMainButton(context));
    // 次要按钮相关
    if (secondaryButtonText != null) {
      //分割
      widgets.add(Container(
        height: 16,
        color: Colors.transparent,
      ));
      //次要按钮
      widgets.add(_configSecondaryButton(context));
    }
    return widgets;
  }

  /// 构建主按钮widget
  Widget _configMainButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: BigMainButton(
        title: submitText ?? BrnIntl.of(context).localizedResource.confirm,
        onTap: () {
          Navigator.of(context)
              .pop(submitText ?? BrnIntl.of(context).localizedResource.confirm);
        },
      ),
    );
  }

  /// 构建次按钮widget
  Widget _configSecondaryButton(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Center(
          child: Text(
            secondaryButtonText!,
            style: TextStyle(
              color: themeData!.commonConfig.brandPrimary,
              fontSize: 16,
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).pop(onSecondaryButtonClick);
        },
      ),
    );
  }
}
