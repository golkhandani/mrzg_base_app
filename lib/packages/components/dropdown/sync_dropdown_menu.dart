import 'package:flutter/material.dart';
import 'package:mrzg_base_app/packages/components/dropdown/raw_custom_dropdown.dart';
import 'package:mrzg_base_app/packages/theme/flex_theme_provider.dart';

class SyncDropdownMenu<T> extends StatelessWidget {
  final String labelText;
  final List<DropdownMenuEntry<T>> items;
  final T? selectedItem;
  final void Function(T) onSelected;
  final bool isEnabled;
  const SyncDropdownMenu({
    super.key,
    required this.labelText,
    required this.selectedItem,
    required this.items,
    required this.onSelected,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return RawDropdownMenu<T>(
      requestFocusOnTap: false,
      enableFilter: false,
      enableSearch: false,
      enabled: isEnabled,
      expandedInsets: EdgeInsets.zero,
      minCharCount: -1,
      initialSelection: selectedItem,
      onSelected: (value) => {
        if (value != null) {onSelected.call(value)}
      },
      label: Text(labelText),
      textStyle: isEnabled
          ? null
          : context.typographyTheme.hint
              .copyWith(
                fontSize: context.typographyTheme.bodyLarge.textStyle.fontSize,
              )
              .textStyle,
      inputDecorationTheme: context.mrzgTheme.data.inputDecorationTheme,
      menuStyle: MenuStyle(
        maximumSize: const MaterialStatePropertyAll(
          Size(double.infinity, 240),
        ),
        surfaceTintColor: const MaterialStatePropertyAll(
          Colors.transparent,
        ),
        backgroundColor: MaterialStatePropertyAll(
          context.colorTheme.navBackground,
        ),
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      ),
      dropdownMenuEntries: items,
    );
  }
}
