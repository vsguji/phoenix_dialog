import 'package:flutter/material.dart';
import 'package:phoenix_base/phoenix.dart';
import 'package:phoenix_dialog/extension/dialog_total_config.dart';
import 'package:phoenix_line/phoenix_line.dart';

import 'content_export_dialog.dart';
import 'extension/dialog_assets.dart';

typedef MultiSelectDialogClickSubmitCallback = bool Function(
    List<MultiSelectItem> data);
typedef MultiSelectDialogOnItemClickCallback = void Function(
    BuildContext dialogContext, int index);

/// 多选item
class MultiSelectItem {
  /// 选项编号
  String code;

  /// 选项内容
  String content;

  /// 是否选中
  bool isChecked;

  MultiSelectItem(this.code, this.content, {this.isChecked = false});
}

/// 屏幕中间弹出多选列表弹框
/// 多用于反馈场景底部有操作按钮，可支持自定义底部操作区域
class MultiSelectDialog extends Dialog {
  /// 是否可关闭  默认true 可关闭
  final bool isClose;

  /// 标题
  final String title;

  /// 描述文案
  final String? messageText;

  /// 描述widget
  final Widget? messageWidget;

  /// 选项集合
  final List<MultiSelectItem> conditions;

  /// 操作按钮文案
  final String? submitText;

  /// 点击操作按钮
  final MultiSelectDialogClickSubmitCallback? onSubmitClick;

  /// 点击选项操作 可供埋点需求用
  final MultiSelectDialogOnItemClickCallback? onItemClick;

  /// 操作按钮背景色
  final Color? submitBgColor;

  /// 自定义widget
  final Widget? customWidget;

  /// 是否支持滚动 默认true支持滚动
  final bool isCustomFollowScroll;

  /// 是否展示底部操作区域 默认true展示
  final bool isShowOperateWidget;

  MultiSelectDialog({
    this.isClose = true,
    this.title = "",
    required this.conditions,
    this.messageText,
    this.messageWidget,
    this.customWidget,
    this.isCustomFollowScroll = true,
    this.submitText,
    this.submitBgColor,
    this.onSubmitClick,
    this.onItemClick,
    this.isShowOperateWidget = true,
  });

  @override
  Widget build(BuildContext context) {
    return MultiSelect(
        isClose: isClose,
        title: title,
        messageText: messageText,
        messageWidget: messageWidget,
        customWidget: customWidget,
        isCustomFollowScroll: isCustomFollowScroll,
        conditions: conditions,
        submitText: submitText ?? BrnIntl.of(context).localizedResource.submit,
        onSubmitClick: onSubmitClick,
        onItemClick: onItemClick,
        submitBgColor: submitBgColor ??
            BaseThemeConfig.instance.getConfig().commonConfig.brandPrimary,
        isShowOperateWidget: isShowOperateWidget);
  }
}

class MultiSelect extends StatefulWidget {
  /// 是否可关闭
  final bool isClose;

  /// 标题
  final String? title;

  /// 描述文案
  final String? messageText;

  /// 描述widget
  final Widget? messageWidget;

  /// 选项集合
  final List<MultiSelectItem> conditions;

  /// 操作按钮文案
  final String? submitText;

  /// 点击操作按钮
  final MultiSelectDialogClickSubmitCallback? onSubmitClick;

  /// 点击选项操作
  final MultiSelectDialogOnItemClickCallback? onItemClick;

  /// 操作按钮背景色
  final Color? submitBgColor;

  /// 自定义widget
  final Widget? customWidget;

  /// 是否支持滚动
  final bool isCustomFollowScroll;

  /// 是否展示底部操作区域
  final bool isShowOperateWidget;

  MultiSelect({
    this.isClose = true,
    this.title,
    this.messageText,
    this.messageWidget,
    this.customWidget,
    this.isCustomFollowScroll = true,
    required this.conditions,
    this.submitText,
    this.submitBgColor,
    this.onSubmitClick,
    this.onItemClick,
    this.isShowOperateWidget = true,
  });

  @override
  State<StatefulWidget> createState() {
    return MultiSelectPickerWidgetState();
  }
}

class MultiSelectPickerWidgetState extends State<MultiSelect> {
  @override
  Widget build(BuildContext context) {
    return ContentExportWidget(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _generateContentWidget(),
          Container(
            constraints: const BoxConstraints(maxHeight: 300),
            child: widget.isCustomFollowScroll
                ? SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) =>
                                _buildItem(context, index),
                            itemCount: widget.conditions.length),
                        widget.customWidget != null
                            ? Container(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 12),
                                child: widget.customWidget,
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  )
                : Column(
                    children: <Widget>[
                      Expanded(
                        child: ListView.builder(
                            itemBuilder: (context, index) =>
                                _buildItem(context, index),
                            itemCount: widget.conditions.length),
                      ),
                      widget.customWidget != null
                          ? Container(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 12),
                              child: widget.customWidget,
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
          )
        ],
      ),
      title: widget.title,
      isClose: widget.isClose,
      submitText: widget.submitText,
      submitBgColor: widget.submitBgColor,
      isShowOperateWidget: widget.isShowOperateWidget,
      onSubmit: () {
        List<MultiSelectItem> tempList = [];
        if (widget.onSubmitClick != null) {
          for (int i = 0; i < widget.conditions.length; i++) {
            if (widget.conditions[i].isChecked) {
              tempList.add(widget.conditions[i]);
            }
          }
          if (widget.onSubmitClick!(tempList)) Navigator.of(context).pop();
        }
      },
    );
  }

  /// 内容widget 以 messageWidget 为准，
  /// 若无则以 messageText 生成widget 填充，
  /// 都没设置则为空 Container
  Widget _generateContentWidget() {
    if (widget.messageWidget != null) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8, left: 20, right: 20),
        child: widget.messageWidget,
      );
    }

    if (!PhoenixTools.isEmpty(widget.messageText)) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8, left: 20, right: 20),
        child: Text(
          widget.messageText!,
          style: BaseThemeConfig.instance
              .getConfig()
              .dialogConfig
              .contentTextStyle
              .generateTextStyle(),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildItem(BuildContext context, int index) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            widget.conditions[index].isChecked =
                !widget.conditions[index].isChecked;
          });
          if (widget.onItemClick != null) {
            widget.onItemClick!(context, index);
          }
        },
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Text(widget.conditions[index].content,
                          style: TextStyle(
                              fontWeight: widget.conditions[index].isChecked
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                              fontSize: 16,
                              color: widget.conditions[index].isChecked
                                  ? BaseThemeConfig.instance
                                      .getConfig()
                                      .commonConfig
                                      .brandPrimary
                                  : BaseThemeConfig.instance
                                      .getConfig()
                                      .commonConfig
                                      .colorTextBase))),
                  Container(
                      alignment: Alignment.center,
                      height: 44,
                      child: widget.conditions[index].isChecked
                          ? PhoenixTools.getAssetImageWithBandColor(
                              DialogAssets.iconMultiSelected,
                              package: 'phoenix_dialog')
                          : PhoenixTools.getAssetImage(
                              DialogAssets.iconUnSelect,
                              package: 'phoenix_dialog')),
                ],
              ),
            ),
            index != widget.conditions.length - 1
                ? const Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0), child: Line())
                : const SizedBox.shrink()
          ],
        ));
  }
}
