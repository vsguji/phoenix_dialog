// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phoenix_base/phoenix.dart';
import 'package:phoenix_dialog/phoenix_dialog.dart';
import 'package:phoenix_loading/phoenix_loading.dart';

import 'list_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          ListItem(
            title: "富文本弹窗",
            isShowLine: false,
            isSupportTheme: true,
            describe: '富文本弹窗',
            onPressed: () {
              _showRichTextDialog(context);
            },
          ),
          ListItem(
            title: "无标题+无按钮",
            isSupportTheme: true,
            describe: '无标题、无按钮',
            onPressed: () {
              _showStyle0Dialog(context);
            },
          ),
          ListItem(
            title: "无标题+单按钮",
            isSupportTheme: true,
            describe: '无标题、辅助信息、单按钮',
            onPressed: () {
              _showStyle1Dialog(context);
            },
          ),
          ListItem(
            title: "无标题+单按钮，单行内容",
            isSupportTheme: true,
            describe: '无标题、辅助信息、单按钮',
            onPressed: () {
              _showStyle1Dialog0(context);
            },
          ),
          ListItem(
            title: "标题+信息+双按钮",
            isSupportTheme: true,
            describe: '有标题、双底部按钮、辅助信息为文案',
            onPressed: () {
              _showStyle4Dialog(context);
            },
          ),
          ListItem(
            title: "标题+信息+单按钮",
            isSupportTheme: true,
            describe: '有标题、单按钮、有辅助文案',
            onPressed: () {
              _showStyle2Dialog(context);
            },
          ),
          ListItem(
            title: "标题+信息+单按钮",
            describe: '有标题、单按钮、有【多行】辅助文案',
            onPressed: () {
              _showStyle2_1Dialog(context);
            },
          ),
          ListItem(
            title: "标题+信息+警示",
            isSupportTheme: true,
            describe: '有标题、单按钮、有辅助文案',
            onPressed: () {
              _showStyle9Dialog(context);
            },
          ),
          ListItem(
            title: "标题+信息+自定义警示UI",
            isSupportTheme: true,
            describe: '有标题、单按钮、有辅助文案',
            onPressed: () {
              _showStyle9_1Dialog(context);
            },
          ),
          ListItem(
            title: "标题+按钮",
            isSupportTheme: true,
            describe: '双个按钮、换行标题',
            onPressed: () {
              _showStyle8Dialog(context);
            },
          ),
          ListItem(
            title: "Icon+标题+信息+双按钮",
            isSupportTheme: true,
            describe: '双按钮、有头部Icon、辅助信息',
            onPressed: () {
              _showStyle71Dialog(context);
            },
          ),
          ListItem(
            title: "Icon+标题+单按钮",
            isSupportTheme: true,
            describe: '单按钮、有头部Icon',
            onPressed: () {
              _showStyle7Dialog(context);
            },
          ),
          ListItem(
            title: "多按钮 + 标题+信息",
            isSupportTheme: true,
            describe: '有标题、多按钮、辅助信息为文案',
            onPressed: () {
              _showStyle6Dialog(context);
            },
          ),
          ListItem(
            title: "多按钮 + 标题",
            isSupportTheme: true,
            describe: '标题、多按钮',
            onPressed: () {
              _showStyle5_1Dialog(context);
            },
          ),
          ListItem(
            title: "多按钮 + 信息",
            isSupportTheme: true,
            describe: '无标题、多按钮、辅助信息为文案',
            onPressed: () {
              _showStyle5Dialog(context);
            },
          ),
          ListItem(
            title: "标题+信息+输入+按钮",
            isSupportTheme: true,
            describe: '中间有输入框弹框',
            onPressed: () {
              _showMiddleInputDialog(context);
            },
          ),
          ListItem(
            title: "标题+输入+按钮",
            isSupportTheme: true,
            describe: '中间有输入框弹框',
            onPressed: () {
              _showMiddleInputDialog2(context);
            },
          ),
          ListItem(
            title: "标题+输入+按钮",
            isSupportTheme: true,
            describe: '中间有输入框弹框, 设置最大高度',
            onPressed: () {
              _showMiddleInputDialog3(context);
            },
          ),
          ListItem(
            title: "标题+单选选项+按钮",
            isSupportTheme: true,
            describe: '中间单选弹框（SingleSelectDialogWidget）',
            onPressed: () {
              _showMiddleSingleSelectPicker(context);
            },
          ),
          ListItem(
            title: "标题+多选选项+按钮",
            isSupportTheme: true,
            describe: '中间多选弹框（MultiSelectDialog）',
            onPressed: () {
              _showMiddleMultiSelectDialog(context);
            },
          ),
          ListItem(
            title: "标题+提示信息文本+多选选项+按钮",
            isSupportTheme: true,
            describe: '中间多选弹框（MultiSelectDialog）',
            onPressed: () {
              _showMiddleMultiSelectWithMessageDialog(context);
            },
          ),
          ListItem(
            title: "标题+提示信息Widget+多选选项+按钮",
            isSupportTheme: true,
            describe: '中间多选弹框（MultiSelectDialog）',
            onPressed: () {
              _showMiddleMultiSelectWithMessageWidgetDialog(context);
            },
          ),
          ListItem(
            title: "Loading Dialog",
            describe: 'LoadingDialog Example',
            onPressed: () {
              _showBrnLoadingDialog(context);
            },
          ),
          ListItem(
            title: "Safe Dialog",
            describe: '可以放心 pop 的 Dialog，防止误关闭页面',
            onPressed: () {
              _showSafeDialog(context);
            },
          ),
          ListItem(
            title: "Share Dialog",
            isSupportTheme: true,
            describe: '分享Dialog（五个 icon）',
            onPressed: () {
              _showBrnShareDialog5(context);
            },
          ),
          ListItem(
            title: "Share Dialog",
            isSupportTheme: true,
            describe: '分享Dialog（3个 icon）',
            onPressed: () {
              _showBrnShareDialog3(context);
            },
          ),
          ListItem(
            title: "Two Vertical Button Dialog（单按钮）",
            isSupportTheme: true,
            describe: '主次要按钮Dialog',
            onPressed: () {
              _showBrnOneVerticalButtonDialogDialog(context);
            },
          ),
          ListItem(
            title: "Two Vertical Button Dialog（双按钮）",
            describe: '主次要按钮Dialog',
            isSupportTheme: true,
            onPressed: () {
              _showBrnTwoVerticalButtonDialogDialog(context);
            },
          ),
          ListItem(
            title: "纯文本弹框",
            isSupportTheme: true,
            describe: '标题+纯本文内容+按钮',
            onPressed: () {
              _showStyle81Dialog(context);
            },
          ),
          ListItem(
            title: "纯文本弹框含富文本",
            isSupportTheme: true,
            describe: '标题+纯本文内容含富文本+按钮',
            onPressed: () {
              _showStyle82Dialog(context);
            },
          ),
          ListItem(
            title: "纯文本弹框无标题",
            isSupportTheme: true,
            describe: '纯本文内容+按钮',
            onPressed: () {
              _showStyle83Dialog(context);
            },
          ),
          ListItem(
            title: "纯文本弹框无操作按钮",
            isSupportTheme: true,
            describe: '标题+纯本文内容',
            onPressed: () {
              _showStyle84Dialog(context);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _showMiddleSingleSelectPicker(BuildContext context) {
    String hintText = "感兴趣待跟进";
    int selectedIndex = 0;
    var conditions = [
      "感兴趣待跟进",
      "感兴趣但不对本商圈没兴趣",
      "未接通",
      "接通",
      "号码错误",
      "dasdasda",
      "asdasfdg",
      "dadsadvq",
      "vzxczxc"
    ];
    showDialog(
        context: context,
        builder: (_) => StatefulBuilder(
              builder: (context, state) {
                return SingleSelectDialog(
                    isClose: true,
                    title: '请选择无效客源原因',
                    messageText: '请您评价该条线索请您评价该条线索请您评价该条线索请您评价该条线索请您评价该条线索',
                    conditions: conditions,
                    checkedItem: conditions[selectedIndex],
                    submitText: '提交',
                    isCustomFollowScroll: true,
                    customWidget: TextField(
                      //光标颜色
                      maxLines: 2,
                      cursorColor: const Color(0xFF0984F9),
                      //光标圆角弧度
                      cursorRadius: const Radius.circular(2.0),
                      style: const TextStyle(
                          fontSize: 14, color: Color(0xFF222222)),
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(8.0),
                        hintText: hintText,
                        hintStyle: const TextStyle(
                            fontSize: 14, color: Color(0xFFCCCCCC)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2.0),
                            borderSide: const BorderSide(
                              width: 0.5,
                              color: Color(0xFFCCCCCC),
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2.0),
                            borderSide: const BorderSide(
                              width: 0.5,
                              color: Color(0xFFCCCCCC),
                            )),
                      ),
                    ),
                    onItemClick: (BuildContext context, int index) {
                      hintText = conditions[index];
                      selectedIndex = index;
                      state(() {});
                    },
                    onSubmitClick: (data) {
                      //BrnToast.show(data!, context);
                    });
              },
            ));
  }

  ///多选弹框
  void _showMiddleMultiSelectDialog(BuildContext context) {
    List<MultiSelectItem> data = [];
    data.add(MultiSelectItem("100", "感兴趣待跟进"));
    data.add(MultiSelectItem("101", "感兴趣但对本商圈没兴趣", isChecked: true));
    data.add(MultiSelectItem("102", "接通后挂断/不感兴趣", isChecked: true));
    data.add(MultiSelectItem("103", "未接通"));
    data.add(MultiSelectItem("104", "投诉威胁"));
    data.add(MultiSelectItem("104", "号码错误"));
    data.add(MultiSelectItem("104", "号码错误"));
    data.add(MultiSelectItem("104", "号码错误"));
    showDialog(
        context: context,
        builder: (_) => MultiSelectDialog(
            title: "请您评价该条线索",
            isClose: true,
            conditions: data,
            onSubmitClick: (List<MultiSelectItem> data) {
              var str = "";
              data.forEach((item) {
                str = str + item.content + "  ";
              });
              // // BrnToast.show(str, context);
              return true;
            }));
  }

  void _showMiddleMultiSelectWithMessageWidgetDialog(BuildContext context) {
    String hintText = "感兴趣待跟进";
    List<MultiSelectItem> data = [];
    data.add(MultiSelectItem("100", "感兴趣待跟进"));
    data.add(MultiSelectItem("101", "感兴趣但对本商圈没兴趣", isChecked: true));
    data.add(MultiSelectItem("102", "接通后挂断/不感兴趣", isChecked: true));
    data.add(MultiSelectItem("102", "接通后挂断/不感兴趣", isChecked: true));
    data.add(MultiSelectItem("103", "未接通"));
    data.add(MultiSelectItem("103", "未接通"));
    data.add(MultiSelectItem("104", "其他"));
    showDialog(
        context: context,
        builder: (_) => StatefulBuilder(builder: (context, state) {
              return MultiSelectDialog(
                  title: "请您评价该条线索Widget",
                  messageWidget: const Row(
                    children: <Widget>[
                      Text(
                        "选择放弃原因（多选）",
                        style: cContentTextStyle,
                      ),
                    ],
                  ),
                  isClose: true,
                  conditions: data,
                  isCustomFollowScroll: false,
                  customWidget: TextField(
                    //光标颜色
                    maxLines: 2,
                    cursorColor: const Color(0xFF0984F9),
                    //光标圆角弧度
                    cursorRadius: const Radius.circular(2.0),
                    style:
                        const TextStyle(fontSize: 14, color: Color(0xFF222222)),
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(8.0),
                      hintText: hintText,
                      hintStyle: const TextStyle(
                          fontSize: 14, color: Color(0xFFCCCCCC)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2.0),
                          borderSide: const BorderSide(
                            width: 0.5,
                            color: Color(0xFFCCCCCC),
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2.0),
                          borderSide: const BorderSide(
                            width: 0.5,
                            color: Color(0xFFCCCCCC),
                          )),
                    ),
                  ),
                  onItemClick: (BuildContext context, int index) {
                    hintText = data[index].content;
                    state(() {});
                  },
                  onSubmitClick: (List<MultiSelectItem> data) {
                    var str = "";
                    data.forEach((item) {
                      str = str + item.content + "  ";
                    });
                    // // BrnToast.show(str, context);
                    return true;
                  });
            }));
  }

  ///多选弹框
  void _showMiddleMultiSelectWithMessageDialog(BuildContext context) {
    List<MultiSelectItem> data = [];
    data.add(MultiSelectItem("100", "感兴趣待跟进"));
    data.add(MultiSelectItem("101", "感兴趣但对本商圈没兴趣", isChecked: true));
    data.add(MultiSelectItem("102", "接通后挂断/不感兴趣", isChecked: true));
    data.add(MultiSelectItem("103", "未接通"));
    data.add(MultiSelectItem("104", "投诉威胁"));
    data.add(MultiSelectItem("104", "号码错误"));
    data.add(MultiSelectItem("104", "号码错误"));
    data.add(MultiSelectItem("104", "号码错误"));
    showDialog(
        context: context,
        builder: (_) => MultiSelectDialog(
            title: "请您评价该条线索",
            messageText: '请您评价该条线索请您评价该条线索请您评价该条线索请您评价该条线索请您评价该条线索',
            isClose: true,
            conditions: data,
            onSubmitClick: (List<MultiSelectItem> data) {
              var str = "";
              data.forEach((item) {
                str = str + item.content + "  ";
              });
              // BrnToast.show(str, context);
              return true;
            }));
  }

  ///通用弹框
  void _showRichTextDialog(BuildContext context) {
    DialogManager.showConfirmDialog(context,
        cancel: "取消",
        confirm: "确定",
        title: "标题",
        message: "辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息",
        messageWidget: Padding(
          padding: const EdgeInsets.only(top: 6, left: 24, right: 24),
          child: BrnCSS2Text.toTextView(
              "这是一条增使用标签修改文字颜色的example\<font color = '#8ac6d1'\>我是带颜色的文字</font>，"
              "这是颜色标签后边的文字", linksCallback: (String? text, String? linkUrl) {
            // BrnToast.show('$text clicked!  Url is $linkUrl', context);
          }),
        ),
        showIcon: true, onConfirm: () {
      // BrnToast.show("确定", context);
    }, onCancel: () {
      Navigator.pop(context);
    });
  }

  ///中间有输入框弹框
  void _showMiddleInputDialog(BuildContext context) {
    MiddleInputDialog(
        title: '拒绝理由 dismissOnActionsTap 点击Action不消失',
        message: "仅可输入数字。辅助内容辅助内容辅助内容辅助内容辅助内容辅助内容辅助内容辅助内容辅助内容 ",
        hintText: '提示信息',
        cancelText: '取消',
        confirmText: '确定',
        autoFocus: true,
        maxLength: 1000,
        maxLines: 2,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        textInputAction: TextInputAction.done,
        dismissOnActionsTap: false,
        barrierDismissible: true,
        onConfirm: (value) {
          // BrnToast.show(value, context);
        },
        onCancel: () {
          // BrnToast.show("取消", context);
          Navigator.pop(context);
        }).show(context);
  }

  ///中间有输入框弹框
  void _showMiddleInputDialog2(BuildContext context) {
    MiddleInputDialog(
        title: '拒绝理由',
        hintText: '提示信息',
        cancelText: '取消',
        confirmText: '确定',
        maxLength: 1000,
        maxLines: 2,
        barrierDismissible: false,
        inputEditingController: TextEditingController()..text = 'bbb',
        textInputAction: TextInputAction.done,
        onConfirm: (value) {
          // BrnToast.show(value, context);
        },
        onCancel: () {
          // BrnToast.show("取消", context);
          Navigator.pop(context);
        }).show(context);
  }

  ///中间有输入框弹框
  void _showMiddleInputDialog3(BuildContext context) {
    MiddleInputDialog(
        title: '拒绝理由-测试限制最长输入10个字符',
        hintText: '提示信息',
        cancelText: '取消',
        confirmText: '确定',
        maxLength: 10,
        barrierDismissible: false,
        textInputAction: TextInputAction.done,
        onConfirm: (value) {
          // BrnToast.show(value, context);
        },
        onCancel: () {
          // BrnToast.show("取消", context);
          Navigator.pop(context);
        }).show(context);
  }

  ///对话框样式一：无标题、单按钮
  void _showStyle1Dialog0(BuildContext context) {
    DialogManager.showSingleButtonDialog(context,
        label: "知道了", message: "辅助内容容信息", onTap: () {
      // BrnToast.show('知道了', context);
      Navigator.pop(context);
    });
  }

  ///对话框样式一：无标题、单按钮
  void _showStyle0Dialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return PhoenixDialog(
          messageText: "辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息",
          actionsText: [],
        );
      },
    );
  }

  ///对话框样式一：无标题、单按钮
  void _showStyle1Dialog(BuildContext context) {
    DialogManager.showSingleButtonDialog(context,
        label: "知道了", message: "辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息", onTap: () {
      // BrnToast.show('知道了', context);
      Navigator.pop(context);
    });
  }

  ///对话框样式二：有标题、单按钮、有辅助文案
  void _showStyle2Dialog(BuildContext context) {
    DialogManager.showSingleButtonDialog(context,
        title: "标题内容",
        label: "知道了",
        message: "辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息", onTap: () {
      // BrnToast.show('知道了', context);
      Navigator.pop(context);
    });
  }

  ///对话框样式二：有标题、单按钮、有辅助文案过多，上下滑动展示
  void _showStyle2_1Dialog(BuildContext context) {
    DialogManager.showSingleButtonDialog(context,
        title: "标题内容",
        label: "知道了",
        messageWidget: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 300),
            child: const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 8, left: 24, right: 24),
                child: Center(
                  child: Text(
                    '辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息AAA',
                    style: cContentTextStyle,
                    textAlign: cContentTextAlign,
                  ),
                ),
              ),
            )), onTap: () {
      // BrnToast.show('知道了', context);
      Navigator.pop(context);
    });
  }

  ///对话框样式四：有标题、底部按钮为两个，辅助信息为文案
  void _showStyle4Dialog(BuildContext context) {
    DialogManager.showConfirmDialog(context,
        title: "确定关注我吗？",
        cancel: '取消',
        confirm: '确定',
        message: "辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息", onConfirm: () {
      // BrnToast.show("确定", context);
    }, onCancel: () {
      // BrnToast.show("取消", context);
      Navigator.pop(context);
    });
  }

  ///对话框样式五：多按钮辅助信息为文案 无标题
  void _showStyle5_1Dialog(BuildContext context) {
    DialogManager.showMoreButtonDialog(context,
        actions: [
          '选项一',
          '选项二',
          '选项三',
        ],
        title: "标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题",
        indexedActionClickCallback: (index) {
      // BrnToast.show("$index", context);
    });
  }

  ///对话框样式五：多按钮辅助信息为文案 无标题
  void _showStyle5Dialog(BuildContext context) {
    DialogManager.showMoreButtonDialog(context,
        actions: [
          '选项一',
          '选项二',
          '选项三',
        ],
        message: "辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息",
        indexedActionClickCallback: (index) {
      // BrnToast.show("$index", context);
    });
  }

  ///对话框样式六：多按钮 有标题 辅助信息为文案
  void _showStyle6Dialog(BuildContext context) {
    DialogManager.showMoreButtonDialog(context,
        title: "确定关注我吗？",
        actions: [
          '选项一',
          '选项二',
          '选项三',
        ],
        message: "辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息",
        indexedActionClickCallback: (index) {
      // BrnToast.show("$index", context);
    });
  }

  ///对话框样式7.1：单按钮 有头部Icon、辅助信息为文案
  void _showStyle71Dialog(BuildContext context) {
    DialogManager.showConfirmDialog(context,
        showIcon: true,
        iconWidget: PhoenixTools.getAssetImage("icons/icon_warning.png",
            package: 'phoenix_dialog'),
        title: "这个是自定义 icon 展示",
        confirm: "确定",
        cancel: "取消",
        message: "辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信", onConfirm: () {
      // BrnToast.show("确定", context);
    }, onCancel: () {
      // BrnToast.show("取消", context);
      Navigator.pop(context);
    });
  }

  ///对话框样式七：单按钮 有头部Icon、辅助信息为文案
  void _showStyle7Dialog(BuildContext context) {
    DialogManager.showSingleButtonDialog(context,
        showIcon: true, title: "恭喜你完成填写", label: "确定", onTap: () {
      // BrnToast.show("确定", context);
      Navigator.pop(context);
    });
  }

  ///对话框样式八：两个按钮，换行标题
  void _showStyle8Dialog(BuildContext context) {
    DialogManager.showConfirmDialog(context,
        title: "标题内容,标题内容,标题内容标题内容,标题内容标题内容,标题内容",
        cancel: '取消',
        confirm: '确定', onConfirm: () {
      // BrnToast.show("确定", context);
    }, onCancel: () {
      // BrnToast.show("取消", context);
      Navigator.pop(context);
    });
  }

  ///对话框样式九：标准的对话框：有标题、双按钮、有警示文案和辅助信息
  void _showStyle9Dialog(BuildContext context) {
    DialogManager.showConfirmDialog(context,
        title: "标题内容？",
        cancel: '取消',
        confirm: '确定',
        warning: '警示文案',
        message: "辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息", onConfirm: () {
      // BrnToast.show("确定", context);
    }, onCancel: () {
      // BrnToast.show("取消", context);
      Navigator.pop(context);
    });
  }

  ///对话框样式九：标准的对话框：有标题、双按钮、有警示文案和辅助信息
  void _showStyle9_1Dialog(BuildContext context) {
    bool? status = false;
    DialogManager.showConfirmDialog(context,
        title: "标题内容？",
        cancel: '取消',
        confirm: '确定',
        warningWidget: StatefulBuilder(builder: (context, setState) {
          return Row(children: <Widget>[
            Checkbox(
              value: status,
              onChanged: (bool? aaa) {
                status = aaa;
                setState(() {});
              },
            ),
            const Expanded(child: Text('这个是测试协议，啦啦啦啦啦啦啦啦啦拉拉阿拉啦啦啦'))
          ]);
        }),
        message: "辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息",
        onConfirm: () {
          // BrnToast.show("确定", context);
        },
        onCancel: () {
          // BrnToast.show("取消", context);
          Navigator.pop(context);
        });
  }

  ///底部有输入框弹框
  void _showBrnLoadingDialog(BuildContext context) {
    // LoadingDialog.show(context).then((value) {
    //   // BrnToast.show('result: $value', context);
    // });
    // Future.delayed(const Duration(seconds: 5)).then((_) {
    //   LoadingDialog.dismiss(context, 'dismiss 定时取消');
    // });
  }

  ///安全关闭的弹框
  void _showSafeDialog(BuildContext context) {
    SafeDialog.show(
        context: context,
        tag: "AA",
        builder: (context) {
          return const PageLoading(
            content: 'Safe AA',
          );
        }).then((result) {
      // BrnToast.show('result: $result ', context);
    });

    SafeDialog.show(
        context: context,
        builder: (context) {
          return const PageLoading(
            content: 'Safe BB',
          );
        }).then((result) {
      // BrnToast.show('result: $result ', context);
    });

    Future.delayed(const Duration(seconds: 5)).then((_) {
      SafeDialog.dismiss(
          context: context, tag: "AA", result: 'delete dialog AA by tag AA');
    });

    Future.delayed(const Duration(seconds: 10)).then((_) {
      SafeDialog.dismiss(
          context: context, result: 'delete dialog BB by default tag');
    });
  }

  void _showBrnShareDialog3(BuildContext context) {
    ShareDialog brnShareDialog = ShareDialog(
      context: context,
      shareChannels: const [
        BaseShareItemConstants.shareWeiXin,
        BaseShareItemConstants.shareLink,
        BaseShareItemConstants.shareCustom
      ],
      titleText: "测试标题",
      descText: "测试辅助信息测试辅助信息测试辅助信息测试辅助信息测试辅助信息",
      clickCallBack: (int channel, int index) {
        // BrnToast.show("channel: $channel, index: $index", context);
      },
      getCustomChannelWidget: (int index) {
        if (index == 2) {
          return PhoenixTools.getAssetImage("images/icon_custom_share.png",
              package: 'phoenix_dialog');
        } else {
          return null;
        }
      },
      // 自定义图标
      getCustomChannelTitle: (int index) {
        if (index == 2) {
          return "自定义";
        } else {
          return null;
        }
      }, // 自定义名字
    );
    brnShareDialog.show();
  }

  void _showBrnShareDialog5(BuildContext context) {
    ShareDialog brnShareDialog = ShareDialog(
      context: context,
      shareChannels: const [
        BaseShareItemConstants.shareWeiXin,
        BaseShareItemConstants.shareCustom,
        BaseShareItemConstants.shareCustom,
        BaseShareItemConstants.shareLink,
        BaseShareItemConstants.shareCustom
      ],
      titleText: "测试标题",
      descText: "测试辅助信息测试辅助信息测试辅助信息测试辅助信息测试辅助信息",
      clickCallBack: (int channel, int index) {
        // BrnToast.show("channel: $channel, index: $index", context);
      },
      getCustomChannelWidget: (int index) {
        if (index == 1) {
          return PhoenixTools.getAssetImage("images/icon_custom_share.png",
              package: 'phoenix_dialog');
        } else if (index == 2)
          return PhoenixTools.getAssetImage("images/icon_custom_share.png",
              package: 'phoenix_dialog');
        else if (index == 4)
          return PhoenixTools.getAssetImage("images/icon_custom_share.png",
              package: 'phoenix_dialog');
        else
          return null;
      },
      // 自定义图标
      getCustomChannelTitle: (int index) {
        if (index == 1) {
          return "自定义";
        } else if (index == 2)
          return "自定义";
        else if (index == 4)
          return "自定义";
        else
          return null;
      }, // 自定义名字
    );
    brnShareDialog.show();
  }

  void _showBrnTwoVerticalButtonDialogDialog(BuildContext context) {
    EnhanceOperationDialog brnShareDialog = EnhanceOperationDialog(
      context: context,
      iconType: DialogConstants.iconAlert,
      titleText: "强提示文案",
      descText: "这里是文案这里是文案这里是文案这里是文案这里是文案这里是文案这里是文案这里是文案",
      mainButtonText: "主要按钮",
      secondaryButtonText: "次要信息可点击",
      onMainButtonClick: () {
        print("主要按钮");
      },
      onSecondaryButtonClick: () {
        print("次要按钮");
      },
    );
    brnShareDialog.show();
  }

  void _showBrnOneVerticalButtonDialogDialog(BuildContext context) {
    EnhanceOperationDialog brnShareDialog = EnhanceOperationDialog(
      iconType: DialogConstants.iconWarning,
      context: context,
      titleText: "强提示文案",
      descText: "这里是文案这里是文案这里是文案这里是文案这里是文案这里是文案这里是文案这里是文案",
      mainButtonText: "我知道了",
      onMainButtonClick: () {
        print("主要按钮");
      },
    );
    brnShareDialog.show();
  }

  void _showStyle82Dialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => ScrollableTextDialog(
            title: "纯文本标题",
            contentText:
                "纯本文呢表纯本文呢表\<font color = '#008886'\>纯本文呢呢表纯\</font\>本文呢表纯本文呢表纯本文呢表纯本文\<a href='www.baidu.com'\>XXXXX\</a\>纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文"
                "呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯"
                "本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢"
                "表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表"
                "纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢"
                "表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文"
                "呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本"
                "文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢"
                "呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本"
                "文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文"
                "呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表",
            submitText: "提交",
            linksCallback: (String? text, String? url) {
              // BrnToast.show(text!, context);
            },
            onSubmitClick: () {
              // BrnToast.show("点击了纯文本弹框", context);
            }));
  }

  void _showStyle81Dialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => ScrollableTextDialog(
            title: "纯文本标题纯文本标题纯文本标题纯文本标题纯文本标题纯文本标题",
            contentText: "纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢"
                "表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表"
                "纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本"
                "文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢"
                "表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本"
                "文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢"
                "表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯"
                "本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢",
            submitText: "提交",
            onSubmitClick: () {
              // BrnToast.show("点击了纯文本弹框", context);
            }));
  }

  void _showStyle83Dialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => ScrollableTextDialog(
            title: "纯文本标题纯文",
            isClose: false,
            contentText: "纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢"
                "表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表"
                "纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本"
                "文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢"
                "表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本"
                "文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢"
                "表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯"
                "本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢",
            submitText: "提交",
            onSubmitClick: () {
              // BrnToast.show("点击了纯文本弹框", context);
              Navigator.of(context).pop();
            }));
  }

  void _showStyle84Dialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => const ScrollableTextDialog(
              title: "纯文本标题纯文",
              contentText: "纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢"
                  "表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表"
                  "纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本"
                  "文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢"
                  "表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本"
                  "文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢"
                  "表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯"
                  "本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢",
              isShowOperateWidget: false,
            ));
  }
}
