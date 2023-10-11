import 'package:flutter/material.dart';
import 'package:phoenix_base/phoenix.dart';
import 'package:phoenix_dialog/extension/dialog_total_config.dart';
import 'package:phoenix_line/phoenix_line.dart';

import 'config/dialog_config.dart';
import 'dialog.dart';
import 'dialog_utils.dart';
import 'extension/dialog_assets.dart';

typedef SingleSelectOnSubmitCallback = Function(String? data);
typedef SingleSelectOnItemClickCallback = void Function(
    BuildContext dialogContext, int index);

/// 单选列表弹框
class SingleSelectDialog extends Dialog {
  /// 用于控制是否可以响应点击外部关闭弹窗，true 关闭，false 不关闭，默认 true
  final bool isClose;

  /// 弹窗标题
  final String title;

  /// 描述文案，优先级较 messageWidget 低，优先使用 messageWidget
  final String? messageText;

  /// 描述widget
  final Widget? messageWidget;

  /// 时间区间最大值
  final List<String> conditions;

  /// 确定/提交 按钮文案，默认 '提交'
  final String? submitText;

  /// 提交按钮点击回调
  final SingleSelectOnSubmitCallback? onSubmitClick;

  /// item 点击回调
  final SingleSelectOnItemClickCallback? onItemClick;

  /// 提交按钮背景颜色
  final Color? submitBgColor;

  /// 选中的选项名称
  final String? checkedItem;

  /// 单选列表底部自定义 Widget
  final Widget? customWidget;

  /// 内容是否可滑动。默认为 true
  final bool isCustomFollowScroll;

  /// 是否在点击时让 Diallog 消失，默认为 true
  final bool canDismissOnConfirmClick;

  /// 点击关闭按钮回调
  final VoidCallback? onCloseClick;

  const SingleSelectDialog(
      {super.key,
      this.isClose = true,
      this.title = "",
      this.messageText,
      this.messageWidget,
      required this.conditions,
      this.submitText,
      this.submitBgColor,
      this.onSubmitClick,
      this.onItemClick,
      this.checkedItem,
      this.customWidget,
      this.onCloseClick,
      this.canDismissOnConfirmClick = true,
      this.isCustomFollowScroll = true});

  @override
  Widget build(BuildContext context) {
    return SingleSelectDialogWidget(
      isClose: isClose,
      title: title,
      messageText: messageText,
      messageWidget: messageWidget,
      conditions: conditions,
      submitText: submitText ?? BrnIntl.of(context).localizedResource.submit,
      onSubmitClick: onSubmitClick,
      onItemClick: onItemClick,
      submitBgColor: submitBgColor,
      checkedItem: checkedItem,
      customWidget: customWidget,
      canDismissOnConfirmClick: canDismissOnConfirmClick,
      isCustomFollowScroll: isCustomFollowScroll,
      onCloseClick: onCloseClick,
    );
  }
}

/// 单选列表弹框 widget
// ignore: must_be_immutable
class SingleSelectDialogWidget extends StatefulWidget {
  final bool isClose;
  final String title;
  final String? messageText;
  final Widget? messageWidget;
  final List<String>? conditions;
  final String submitText;
  final SingleSelectOnSubmitCallback? onSubmitClick;
  final SingleSelectOnItemClickCallback? onItemClick; //可供埋点需求用
  final Color? submitBgColor;
  String? checkedItem; // 选择项目

  final Widget? customWidget;

  final bool isCustomFollowScroll;

  final bool canDismissOnConfirmClick;

  /// 点击关闭按钮回调
  final VoidCallback? onCloseClick;

  DialogConfig? themeData;

  SingleSelectDialogWidget(
      {super.key,
      this.isClose = true,
      this.title = "",
      this.messageText,
      this.messageWidget,
      this.conditions,
      this.submitText = "",
      this.submitBgColor,
      this.onSubmitClick,
      this.onItemClick,
      this.checkedItem,
      this.customWidget,
      this.onCloseClick,
      this.isCustomFollowScroll = true,
      this.canDismissOnConfirmClick = true,
      this.themeData}) {
    themeData ??= DialogConfig();
    themeData = BaseThemeConfig.instance
        .getConfig(configId: themeData!.configId)
        .dialogConfig
        .merge(themeData);
  }

  @override
  State<StatefulWidget> createState() {
    return SingleSelectDialogWidgetState();
  }
}

class SingleSelectDialogWidgetState extends State<SingleSelectDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0x33999999),
        body: Container(
            alignment: Alignment.center,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 300),
              decoration: BoxDecoration(
                //背景
                color: widget.themeData?.backgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(
                    DialogUtils.getDialogRadius(
                        widget.themeData!))), //设置四周圆角 角度
              ),
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 28, 20, 12),
                        child: Text(
                          widget.title,
                          style: DialogUtils.getDialogTitleStyle(
                              widget.themeData!),
                        ),
                      ),
                      _generateContentWidget(),
                      Container(
                        constraints: const BoxConstraints(maxHeight: 300),
                        child: widget.isCustomFollowScroll
                            ? SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) =>
                                            _buildItem(context, index),
                                        itemCount:
                                            widget.conditions?.length ?? 0),
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
                                        itemCount:
                                            widget.conditions?.length ?? 0),
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
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
                          child: GestureDetector(
                            child: Container(
                                decoration: BoxDecoration(
                                  //背景
                                  color: BaseThemeConfig.instance
                                      .getConfig()
                                      .commonConfig
                                      .brandPrimary,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(6.0)), //设置四周圆角 角度
                                ),
                                alignment: Alignment.center,
                                height: 48,
                                color: widget.submitBgColor,
                                child: Text(widget.submitText,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 18))),
                            onTap: () {
                              if (widget.canDismissOnConfirmClick) {
                                Navigator.of(context).pop();
                              }
                              if (widget.onSubmitClick != null) {
                                widget.onSubmitClick!(widget.checkedItem);
                              }
                            },
                          ))
                    ],
                  ),
                  widget.isClose
                      ? Positioned(
                          right: 0.0,
                          child: GestureDetector(
                              onTap: () {
                                if (widget.onCloseClick != null) {
                                  widget.onCloseClick!();
                                } else {
                                  Navigator.of(context).pop();
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: PhoenixTools.getAssetImage(
                                    DialogAssets.iconPickerClose,
                                    package: 'phoenix_dialog'),
                              )))
                      : const SizedBox.shrink()
                ],
              ),
            )));
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
          style: cContentTextStyle,
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildItem(BuildContext context, int index) {
    if (widget.conditions == null) {
      return const SizedBox.shrink();
    } else {
      return Container(
          child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      for (dynamic item in widget.conditions!) {
                        if (widget.conditions![index] == item) {
                          if (widget.onItemClick != null &&
                              widget.checkedItem != item) {
                            widget.onItemClick!(context, index);
                          }
                          widget.checkedItem = item;
                          break;
                        }
                      }
                    });
                  },
                  child: Text(widget.conditions![index],
                      style: TextStyle(
                          fontWeight:
                              widget.conditions![index] == widget.checkedItem
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                          fontSize: 16,
                          color: widget.conditions![index] == widget.checkedItem
                              ? BaseThemeConfig.instance
                                  .getConfig()
                                  .commonConfig
                                  .brandPrimary
                              : BaseThemeConfig.instance
                                  .getConfig()
                                  .commonConfig
                                  .colorTextBase)),
                )),
                GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    height: 44,
                    child: widget.checkedItem == widget.conditions![index]
                        ? PhoenixTools.getAssetImageWithBandColor(
                            DialogAssets.iconSingleSelected,
                            package: 'phoenix_dialog')
                        : PhoenixTools.getAssetImage(DialogAssets.iconUnSelect,
                            package: 'phoenix_dialog'),
                  ),
                  onTap: () {
                    if (widget.onItemClick != null) {
                      widget.onItemClick!(context, index);
                    }
                    setState(() {
                      widget.checkedItem = widget.conditions![index];
                    });
                  },
                )
              ],
            ),
          ),
          index != widget.conditions!.length - 1
              ? const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0), child: Line())
              : const SizedBox.shrink()
        ],
      ));
    }
  }
}
