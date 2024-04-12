library mrzg_base_app;

import 'package:flutter/material.dart';
import 'package:mrzg_base_app/mrzg_base_app.dart';

export "package:flutter_animate/flutter_animate.dart";
export "package:go_router/go_router.dart";
export "package:sliver_tools/sliver_tools.dart";
export "package:gap/gap.dart";
export "package:flutter_form_builder/flutter_form_builder.dart";
export "package:mrzg_base_app/packages/components/components.dart";
export "package:mrzg_base_app/packages/constants/constants.dart";
export "package:mrzg_base_app/packages/extensions/extensions.dart";
export "package:mrzg_base_app/packages/services/services.dart";
export "package:mrzg_base_app/packages/theme/theme.dart";
export 'package:google_fonts/google_fonts.dart';

class MrzgApp extends StatefulWidget {
  final MrzgThemePalette palette;
  final double? fontSize;
  final String? fontFamily;
  final GoRouter router;
  const MrzgApp({
    super.key,
    required this.palette,
    this.fontSize,
    this.fontFamily,
    required this.router,
  });

  @override
  State<MrzgApp> createState() => _MrzgAppState();
}

class _MrzgAppState extends State<MrzgApp> {
  @override
  Widget build(BuildContext context) {
    return MrzgThemeProvider(
      palette: widget.palette,
      typography: MrzgThemeTypography(
        textStyle: TextStyle(
          fontSize: widget.fontSize ?? 16,
          fontFamily: widget.fontFamily ?? GoogleFonts.nunito().fontFamily,
        ),
        palette: widget.palette,
      ),
      child: Builder(builder: (context) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: context.mrzgTheme.data,
          darkTheme: context.mrzgTheme.data,
          themeMode: ThemeMode.light,
          routerConfig: widget.router,
        );
      }),
    );
  }
}
