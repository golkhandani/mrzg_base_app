import 'package:flutter/material.dart';

import 'package:flex_color_scheme/flex_color_scheme.dart';

class MrzgThemeTypography {
  final MrzgThemePalette _palette;
  final TextStyle textStyle;
  const MrzgThemeTypography({
    required MrzgThemePalette palette,
    required this.textStyle,
  }) : _palette = palette;

  MrzgThemePalette get palette => _palette;

  MrzgThemeTypography copyWith({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
  }) {
    return MrzgThemeTypography(
      palette: _palette,
      textStyle: textStyle.copyWith(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
        decorationColor: color,
      ),
    );
  }
}

class MrzgThemePalette extends ColorScheme {
  final Color success;
  final Color onSuccess;
  final Color successContainer;
  final Color onSuccessContainer;

  final Color warning;
  final Color onWarning;
  final Color warningContainer;
  final Color onWarningContainer;

  final Color highlight;
  final Color onHighlight;

  final Color navBackground;
  final Color onNavBackground;
  final Color onNavSelected;
  final Color onNavUnselected;
  final Color textFieldBackground;
  final Color onTextFieldBackground;
  final Color tabBarSelected;
  final Color onTabBarSelected;
  final Color tabBarUnselected;
  final Color onTabBarUnselected;
  final Color chipDisabledBackground;
  final Color onChipDisabledBackground;
  final Color chipBackground;
  final Color onChipBackground;

  final Color cardBackground;
  final Color onCardBackground;

  final Color backBtnBackground;
  final Color onBackBtnBackground;
  const MrzgThemePalette({
    required super.brightness,
    required super.primary,
    required super.onPrimary,
    required super.primaryContainer,
    required super.onPrimaryContainer,
    required super.secondary,
    required super.onSecondary,
    required super.secondaryContainer,
    required super.onSecondaryContainer,
    required super.tertiary,
    required super.onTertiary,
    required super.tertiaryContainer,
    required super.onTertiaryContainer,
    required super.error,
    required super.onError,
    required super.errorContainer,
    required super.onErrorContainer,
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.onSuccessContainer,
    required this.warning,
    required this.onWarning,
    required this.warningContainer,
    required this.onWarningContainer,
    required super.background,
    required super.onBackground,
    required super.surface,
    required super.onSurface,
    required this.highlight,
    required this.onHighlight,
    required super.shadow,
    required this.navBackground,
    required this.onNavBackground,
    required this.onNavSelected,
    required this.onNavUnselected,
    required this.textFieldBackground,
    required this.onTextFieldBackground,
    required this.tabBarSelected,
    required this.onTabBarSelected,
    required this.tabBarUnselected,
    required this.onTabBarUnselected,
    required this.chipDisabledBackground,
    required this.onChipDisabledBackground,
    required this.chipBackground,
    required this.onChipBackground,
    required this.cardBackground,
    required this.onCardBackground,
    required this.backBtnBackground,
    required this.onBackBtnBackground,
    required super.scrim,
    required super.inverseSurface,
    required super.onInverseSurface,
    required super.inversePrimary,
    required super.surfaceTint,
    required super.outlineVariant,
    required super.outline,
    required super.onSurfaceVariant,
    required super.surfaceVariant,
  });
}

class MrzgThemeProvider extends InheritedWidget {
  final MrzgThemePalette _palette;
  final MrzgThemeTypography _typography;
  const MrzgThemeProvider({
    super.key,
    required super.child,
    required MrzgThemePalette palette,
    required MrzgThemeTypography typography,
  })  : _palette = palette,
        _typography = typography;

  MrzgThemePalette get palette => _palette;
  MrzgThemeTypography get typography => _typography;
  ThemeData get _flex => FlexThemeData.light(
        scheme: FlexScheme.custom,
        colorScheme: palette,
        subThemesData: FlexSubThemesData(
          blendOnColors: true,
          blendTextTheme: true,
          useTextTheme: true,
          thinBorderWidth: 2.0,
          thickBorderWidth: 2.0,
          defaultRadius: 12.0,
          inputDecoratorSchemeColor: SchemeColor.surface,
          inputDecoratorFillColor: palette.onTextFieldBackground,
          inputDecoratorBorderSchemeColor: SchemeColor.primary,
          inputDecoratorPrefixIconSchemeColor: SchemeColor.onPrimaryContainer,
          inputCursorSchemeColor: SchemeColor.onPrimaryContainer,
          inputSelectionSchemeColor: SchemeColor.primaryContainer,
          alignedDropdown: true,
          tooltipRadius: 4,
          tooltipSchemeColor: SchemeColor.inverseSurface,
          tooltipOpacity: 0.9,
          useInputDecoratorThemeInDialogs: true,
          snackBarElevation: 6,
          snackBarBackgroundSchemeColor: SchemeColor.inverseSurface,
          navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
          navigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
          navigationRailLabelType: NavigationRailLabelType.none,
          navigationBarElevation: 210,
        ),
        keyColors: const FlexKeyColors(),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        surfaceTint: Colors.transparent,
        swapLegacyOnMaterial3: true,
        fontFamily: typography.textStyle.fontFamily,
        // To use the Playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      );
  ThemeData get data => _flex.copyWith(
        switchTheme: _flex.switchTheme.copyWith(
          thumbColor: MaterialStatePropertyAll(
            palette.primary,
          ),
          trackColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return palette.chipDisabledBackground;
            } else {
              return palette.cardBackground;
            }
          }),
          trackOutlineColor: MaterialStatePropertyAll(
            palette.primary,
          ),
          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        ),
        progressIndicatorTheme: _flex.progressIndicatorTheme.copyWith(
          color: palette.primary,
        ),
        inputDecorationTheme: _flex.inputDecorationTheme.copyWith(
          contentPadding: const EdgeInsets.all(15),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: palette.primary,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: palette.primaryContainer,
              width: 2.0,
            ),
          ),
        ),
      );
  Brightness get brightness => palette.brightness;
  static MrzgThemeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MrzgThemeProvider>()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

extension ThemedText on MrzgThemeTypography {
  MrzgThemeTypography copyWithColor({required Color color}) => copyWith(
        color: color,
      );

  MrzgThemeTypography copyWithStyle({
    double? fontSize,
    FontWeight? fontWeight,
  }) =>
      copyWith(
        fontSize: fontSize,
        fontWeight: fontWeight,
      );

  /// COLORS
  MrzgThemeTypography get primary => copyWith(color: palette.primary);
  MrzgThemeTypography get primaryLink => subtitleMedium.copyWith(
        color: palette.primary,
        decoration: TextDecoration.underline,
      );
  MrzgThemeTypography get onPrimary => copyWithColor(color: palette.onPrimary);
  MrzgThemeTypography get primaryContainer =>
      copyWithColor(color: palette.primaryContainer);

  MrzgThemeTypography get onPrimaryContainer =>
      copyWithColor(color: palette.onPrimaryContainer);
  MrzgThemeTypography get secondary => copyWithColor(color: palette.secondary);
  MrzgThemeTypography get secondaryLink => secondary.copyWith(
        decoration: TextDecoration.underline,
      );
  MrzgThemeTypography get onSecondary =>
      copyWithColor(color: palette.onSecondary);

  MrzgThemeTypography get secondaryContainer =>
      copyWithColor(color: palette.secondaryContainer);
  MrzgThemeTypography get onSecondaryContainer =>
      copyWithColor(color: palette.onSecondaryContainer);
  MrzgThemeTypography get tertiary => copyWithColor(color: palette.tertiary);
  MrzgThemeTypography get onTertiary =>
      copyWithColor(color: palette.onTertiary);
  MrzgThemeTypography get tertiaryContainer =>
      copyWithColor(color: palette.tertiaryContainer);
  MrzgThemeTypography get onTertiaryContainer =>
      copyWithColor(color: palette.onTertiaryContainer);
  MrzgThemeTypography get error => copyWithColor(color: palette.error);
  MrzgThemeTypography get onError => copyWithColor(color: palette.onError);
  MrzgThemeTypography get errorContainer =>
      copyWithColor(color: palette.errorContainer);
  MrzgThemeTypography get onErrorContainer =>
      copyWithColor(color: palette.onErrorContainer);
  MrzgThemeTypography get success => copyWithColor(color: palette.success);
  MrzgThemeTypography get onSuccess => copyWithColor(color: palette.onSuccess);
  MrzgThemeTypography get successContainer =>
      copyWithColor(color: palette.successContainer);
  MrzgThemeTypography get onSuccessContainer =>
      copyWithColor(color: palette.onSuccessContainer);
  MrzgThemeTypography get background =>
      copyWithColor(color: palette.background);
  MrzgThemeTypography get onBackground =>
      copyWithColor(color: palette.onBackground);
  MrzgThemeTypography get surface => copyWithColor(color: palette.surface);
  MrzgThemeTypography get onSurface => copyWithColor(color: palette.onSurface);
  MrzgThemeTypography get highlight => copyWithColor(color: palette.highlight);
  MrzgThemeTypography get onHighlight =>
      copyWithColor(color: palette.onHighlight);
  MrzgThemeTypography get shadow => copyWithColor(color: palette.shadow);

  MrzgThemeTypography get onNavBackground =>
      copyWithColor(color: palette.onNavBackground);
  MrzgThemeTypography get navBackground =>
      copyWithColor(color: palette.navBackground);
  MrzgThemeTypography get onNavSelected =>
      copyWithColor(color: palette.onNavSelected);
  MrzgThemeTypography get onNavUnselected =>
      copyWithColor(color: palette.onNavUnselected);

  MrzgThemeTypography get cardBackground =>
      copyWithColor(color: palette.cardBackground);
  MrzgThemeTypography get onCardBackground =>
      copyWithColor(color: palette.onCardBackground);

  MrzgThemeTypography get chipBackground =>
      copyWithColor(color: palette.chipBackground);
  MrzgThemeTypography get onChipBackground =>
      copyWithColor(color: palette.onChipBackground);
  MrzgThemeTypography get onTextFieldBackground =>
      copyWithColor(color: palette.onTextFieldBackground);
  MrzgThemeTypography get textFieldBackground =>
      copyWithColor(color: palette.textFieldBackground);
  MrzgThemeTypography get chipDisabledBackground =>
      copyWithColor(color: palette.chipDisabledBackground);
  MrzgThemeTypography get onChipDisabledBackground =>
      copyWithColor(color: palette.onChipDisabledBackground);

  // STYLES

  MrzgThemeTypography get headerLarge => copyWithStyle(
        fontSize: 2 * textStyle.fontSize!,
      );
  MrzgThemeTypography get headerMedium => copyWithStyle(
        fontSize: 1.8 * textStyle.fontSize!,
      );
  MrzgThemeTypography get headerSmall => copyWithStyle(
        fontSize: 1.6 * textStyle.fontSize!,
      );

  MrzgThemeTypography get titleLarge => copyWithStyle(
      fontSize: 1.6 * textStyle.fontSize!, fontWeight: FontWeight.w900);
  MrzgThemeTypography get titleMedium => copyWithStyle(
      fontSize: 1.4 * textStyle.fontSize!, fontWeight: FontWeight.w800);
  MrzgThemeTypography get titleSmall => copyWithStyle(
      fontSize: 1.2 * textStyle.fontSize!, fontWeight: FontWeight.w700);
  MrzgThemeTypography get titleTiny =>
      copyWithStyle(fontSize: textStyle.fontSize!, fontWeight: FontWeight.w600);

  MrzgThemeTypography get subtitleLarge =>
      copyWithStyle(fontSize: textStyle.fontSize!, fontWeight: FontWeight.w700);
  MrzgThemeTypography get subtitleMedium => copyWithStyle(
      fontSize: 0.8 * textStyle.fontSize!, fontWeight: FontWeight.w600);
  MrzgThemeTypography get subtitleSmall => copyWithStyle(
      fontSize: 0.6 * textStyle.fontSize!, fontWeight: FontWeight.w500);
  MrzgThemeTypography get subtitleTiny => copyWithStyle(
      fontSize: 0.4 * textStyle.fontSize!, fontWeight: FontWeight.w400);

  MrzgThemeTypography get bodyLarge =>
      copyWithStyle(fontSize: textStyle.fontSize!, fontWeight: FontWeight.w400);
  MrzgThemeTypography get bodyMedium => copyWithStyle(
      fontSize: 0.8 * textStyle.fontSize!, fontWeight: FontWeight.w400);
  MrzgThemeTypography get bodySmall => copyWithStyle(
      fontSize: 0.6 * textStyle.fontSize!, fontWeight: FontWeight.w300);

  MrzgThemeTypography get hint =>
      copyWithStyle(fontSize: 0.6 * textStyle.fontSize!);
  MrzgThemeTypography get label =>
      copyWithStyle(fontSize: 0.6 * textStyle.fontSize!);
  MrzgThemeTypography get caption =>
      copyWithStyle(fontSize: 0.58 * textStyle.fontSize!);
}

extension MrzgTheme on BuildContext {
  MrzgThemeProvider get mrzgTheme => MrzgThemeProvider.of(this);
  MrzgThemeTypography get typographyTheme =>
      MrzgThemeProvider.of(this).typography;
  MrzgThemePalette get colorTheme => MrzgThemeProvider.of(this).palette;
  ThemeData get themeData => MrzgThemeProvider.of(this).data;
}

extension Decorations on ThemeData {
  InputDecoration get inputDecoration {
    return InputDecoration(
      iconColor: inputDecorationTheme.iconColor,
      labelStyle: inputDecorationTheme.labelStyle,
      floatingLabelStyle: inputDecorationTheme.floatingLabelStyle,
      helperStyle: inputDecorationTheme.helperStyle,
      helperMaxLines: inputDecorationTheme.helperMaxLines,
      hintStyle: inputDecorationTheme.hintStyle,
      hintFadeDuration: inputDecorationTheme.hintFadeDuration,
      errorStyle: inputDecorationTheme.errorStyle,
      errorMaxLines: inputDecorationTheme.errorMaxLines,
      floatingLabelBehavior: inputDecorationTheme.floatingLabelBehavior,
      floatingLabelAlignment: inputDecorationTheme.floatingLabelAlignment,
      isCollapsed: inputDecorationTheme.isCollapsed,
      isDense: inputDecorationTheme.isDense,
      contentPadding: inputDecorationTheme.contentPadding,
      prefixStyle: inputDecorationTheme.prefixStyle,
      prefixIconColor: inputDecorationTheme.prefixIconColor,
      suffixStyle: inputDecorationTheme.suffixStyle,
      suffixIconColor: inputDecorationTheme.suffixIconColor,
      counterStyle: inputDecorationTheme.counterStyle,
      filled: inputDecorationTheme.filled,
      fillColor: inputDecorationTheme.fillColor,
      focusColor: inputDecorationTheme.focusColor,
      hoverColor: inputDecorationTheme.hoverColor,
      errorBorder: inputDecorationTheme.errorBorder,
      focusedBorder: inputDecorationTheme.focusedBorder,
      focusedErrorBorder: inputDecorationTheme.focusedErrorBorder,
      disabledBorder: inputDecorationTheme.disabledBorder,
      enabledBorder: inputDecorationTheme.enabledBorder,
      border: inputDecorationTheme.border,
      alignLabelWithHint: inputDecorationTheme.alignLabelWithHint,
      constraints: inputDecorationTheme.constraints,
    );
  }
}
