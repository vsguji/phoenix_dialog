import 'package:phoenix_base/phoenix.dart';

import '../config/dialog_config.dart';
import 'dialog_default_config_utils.dart';

class DialogTotalConfig extends BaseTotalConfig {
  DialogTotalConfig({DialogConfig? dialogConfig})
      : _dialogConfig = dialogConfig;

  DialogConfig? _dialogConfig;

  DialogConfig get dialogConfig =>
      _dialogConfig ?? BaseDialogConfigUtils.defaultDialogConfig;

  @override
  void initThemeConfig(String configId) {
    super.initThemeConfig(configId);
    _dialogConfig ??= DialogConfig();
    dialogConfig.initThemeConfig(
      configId,
      currentLevelCommonConfig: commonConfig,
    );
  }
}

extension BaseAppBarTotalConfig on BaseTotalConfig {
  static DialogConfig? _emptyConfig;
  DialogConfig get dialogConfig =>
      _emptyConfig ?? BaseDialogConfigUtils.defaultDialogConfig;
  set dialogTotalConfig(DialogTotalConfig config) {
    _emptyConfig = config.dialogConfig;
  }
}
