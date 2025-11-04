import 'package:flutter/material.dart';
import 'package:my_website/core/utils/constants/app_size.dart';
import 'package:my_website/core/utils/theme/app_text_style.dart';
import 'package:my_website/l10n/app_localizations.dart';

enum FormFactorType { mobile, tablet, desktop }

extension StyledContext on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);
  double get width => mq.size.width;
  double get height => mq.size.height;

  ThemeData get theme => Theme.of(this);

  FormFactorType get formFactor {
    if (width < 600) {
      return FormFactorType.mobile;
    } else if (width < 900) {
      return FormFactorType.tablet;
    } else {
      return FormFactorType.desktop;
    }
  }

  bool get isMobile => formFactor == FormFactorType.mobile;
  bool get isTablet => formFactor == FormFactorType.tablet;
  bool get isDesktop => formFactor == FormFactorType.desktop;
  bool get isDesktopOrTablet =>
      formFactor == FormFactorType.desktop ||
      formFactor == FormFactorType.tablet;

  AppTextStyle get textStyle {
    switch (formFactor) {
      case FormFactorType.mobile:
      case FormFactorType.tablet:
        return SmallTextStyle();
      case FormFactorType.desktop:
        return LargerTextStyle();
    }
  }

  AppInsets get insets {
    switch (formFactor) {
      case FormFactorType.mobile:
      case FormFactorType.tablet:
        return SmallInsets();
      case FormFactorType.desktop:
        return LargerInsets();
    }
  }

  AppLocalizations get texts =>
      AppLocalizations.of(this) ?? lookupAppLocalizations(const Locale('en'));

  ColorScheme get colorScheme => theme.colorScheme;
}
