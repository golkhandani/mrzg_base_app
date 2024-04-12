import 'package:flutter/material.dart';
import 'package:mrzg_base_app/packages/components/dropdown/raw_custom_dropdown.dart';
import 'package:mrzg_base_app/packages/theme/flex_theme_provider.dart';

class AsyncDropdownMenu<T> extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final List<DropdownMenuEntry<T>> items;
  final void Function(String) onChanged;
  final void Function(T) onSelected;
  final TextEditingController controller;
  final bool isLoading;
  final bool isEnabled;
  const AsyncDropdownMenu({
    super.key,
    this.labelText,
    this.hintText,
    required this.items,
    required this.onChanged,
    required this.controller,
    required this.isLoading,
    required this.onSelected,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return RawDropdownMenu<T>(
      requestFocusOnTap: true,
      enabled: isEnabled,
      hintText: hintText,
      isLoadingEntries: isLoading,
      minCharCount: 3,
      onChanged: onChanged,
      onSelected: (value) => {
        if (value != null) {onSelected.call(value)}
      },
      expandedInsets: EdgeInsets.zero,
      controller: controller,
      label: labelText != null ? Text(labelText!) : null,
      textStyle: isEnabled
          ? null
          : context.typographyTheme.hint
              .copyWith(
                fontSize: context.typographyTheme.bodyLarge.textStyle.fontSize,
              )
              .textStyle,
      trailingIcon: null,
      inputDecorationTheme: context.mrzgTheme.data.inputDecorationTheme,
      menuStyle: MenuStyle(
        maximumSize: const MaterialStatePropertyAll(
          Size(double.infinity, 240),
        ),
        surfaceTintColor: const MaterialStatePropertyAll(
          Colors.transparent,
        ),
        backgroundColor: MaterialStatePropertyAll(
          context.colorTheme.cardBackground,
        ),
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      ),
      dropdownMenuEntries: items,
    );
  }
}
