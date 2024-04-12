import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';
import 'package:mrzg_base_app/packages/theme/flex_theme_provider.dart';

class BasicElevatedButton extends StatelessWidget {
  final bool isLoading;
  final String labelText;
  final Widget? labelWidget;
  final VoidCallback? onPressed;
  final EdgeInsets padding;
  final double height;
  final double width;
  final BoxConstraints? constraints;
  final Color? background;
  final Color? foreground;
  const BasicElevatedButton({
    super.key,
    required this.labelText,
    required this.onPressed,
    this.labelWidget,
    this.padding = const EdgeInsets.all(8),
    this.height = 48,
    this.width = double.infinity,
    this.background,
    this.foreground,
    this.isLoading = false,
    this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    final c = background ?? context.colorTheme.primary;
    final f = foreground ?? context.colorTheme.onPrimary;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: constraints == null ? Size(width, height) : null,
        padding: padding,
        maximumSize: constraints == null
            ? null
            : Size(constraints!.maxWidth, constraints!.maxHeight),
        minimumSize: constraints == null
            ? null
            : Size(constraints!.minWidth, constraints!.minHeight),
        splashFactory: NoSplash.splashFactory,
        shadowColor: Colors.black87,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        surfaceTintColor: Colors.transparent,
        backgroundColor: c,
        foregroundColor: f,
        elevation: 4,
      ),
      onPressed: isLoading ? () {} : onPressed,
      child: isLoading
          ? SizedBox(
              width: height / 2,
              height: height / 2,
              child: CircularProgressIndicator(
                color: f,
              ),
            )
          : labelWidget ??
              Text(
                labelText,
                style: context.typographyTheme.subtitleMedium.textStyle,
              ),
    );
  }
}

class CircleElevatedButton extends StatelessWidget {
  final bool isLoading;
  final String labelText;
  final Widget? labelWidget;
  final VoidCallback? onPressed;
  final EdgeInsets padding;
  final double radius;
  final Color? background;
  final Color? foreground;
  const CircleElevatedButton({
    super.key,
    required this.labelText,
    required this.onPressed,
    this.padding = const EdgeInsets.all(8),
    this.radius = 48,
    this.background,
    this.foreground,
    this.isLoading = false,
    this.labelWidget,
  });

  @override
  Widget build(BuildContext context) {
    final c = background ?? context.colorTheme.primary;
    final f = foreground ?? context.colorTheme.onPrimary;
    return UnconstrainedBox(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(radius, radius),
          padding: padding,
          splashFactory: NoSplash.splashFactory,
          shadowColor: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          surfaceTintColor: Colors.transparent,
          backgroundColor: c,
          foregroundColor: f,
          elevation: 4,
        ),
        onPressed: isLoading ? () {} : onPressed,
        child: isLoading
            ? SizedBox(
                width: radius / 2,
                height: radius / 2,
                child: CircularProgressIndicator(
                  color: f,
                ),
              )
            : labelWidget ??
                Text(
                  labelText,
                  style: context.typographyTheme.subtitleMedium.textStyle,
                ),
      ),
    );
  }
}

class BasicLinkButton extends StatelessWidget {
  const BasicLinkButton({
    super.key,
    required this.labelText,
    required this.onPressed,
    this.foreground,
  });
  final String labelText;
  final VoidCallback onPressed;
  final Color? foreground;

  @override
  Widget build(BuildContext context) {
    final f = foreground ?? context.colorTheme.primary;
    return UnconstrainedBox(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.all(f),
          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        ),
        onPressed: onPressed,
        child: Text(
          labelText,
          style: context.typographyTheme.primaryLink
              .copyWithColor(color: f)
              .textStyle,
        ),
      ),
    );
  }
}

enum BasicTextInputDecoration {
  primary,
  secondary,
}

class BasicTextInput extends StatelessWidget {
  const BasicTextInput({
    super.key,
    required this.fieldName,
    this.controller,
    this.labelText,
    this.hintText,
    this.suffix,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.enabled = true,
    this.inputFormatters = const [],
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.maxLength,
  }) : _decorationType = BasicTextInputDecoration.primary;

  const BasicTextInput.secondary({
    super.key,
    required this.fieldName,
    this.controller,
    this.labelText,
    this.hintText,
    this.suffix,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.enabled = true,
    this.inputFormatters = const [],
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.maxLength,
  }) : _decorationType = BasicTextInputDecoration.secondary;

  final String fieldName;
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool enabled;
  final List<TextInputFormatter> inputFormatters;
  final TextAlign textAlign;
  final int maxLines;
  final int? maxLength;

  final BasicTextInputDecoration _decorationType;

  @override
  Widget build(BuildContext context) {
    var decoration = context.themeData.inputDecoration;
    if (_decorationType == BasicTextInputDecoration.secondary) {
      decoration = decoration.copyWith(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: context.colorTheme.secondary,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: context.colorTheme.secondaryContainer,
            width: 2.0,
          ),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (labelText != null) ...[
          Text(
            labelText!,
            style:
                context.typographyTheme.subtitleMedium.onBackground.textStyle,
            textAlign: TextAlign.start,
          ),
          const Gap(4),
        ],
        FormBuilderTextField(
          enabled: enabled,
          name: fieldName,
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          textAlign: textAlign,
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          controller: controller,
          decoration: decoration.copyWith(
            hintText: hintText,
            suffixIcon: suffix,
            contentPadding: EdgeInsets.symmetric(
              vertical: maxLines > 1 ? 16 : 0,
              horizontal: 16,
            ),
          ),
          maxLines: maxLines,
          keyboardType: keyboardType,
          validator: validator,
          obscureText: obscureText,
        ),
      ],
    );
  }
}

class BasicTextDivider extends StatelessWidget {
  final String labelText;
  const BasicTextDivider({
    super.key,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: Divider(
          thickness: 2,
          color: context.colorTheme.onBackground,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          labelText,
          style: context.typographyTheme.subtitleMedium.onBackground.textStyle,
        ),
      ),
      Expanded(
        child: Divider(
          thickness: 2,
          color: context.colorTheme.onBackground,
        ),
      ),
    ]);
  }
}

class BasicBottomModalSheetFrame extends StatelessWidget {
  const BasicBottomModalSheetFrame({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          const Icon(Icons.drag_handle),
          const Gap(16),
          Expanded(
            child: SingleChildScrollView(child: child),
          ),
          Gap(MediaQuery.of(context).viewInsets.bottom)
        ],
      ),
    );
  }
}
