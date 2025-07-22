import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_models/theme_view_model.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeViewModel>(
      builder: (context, themeViewModel, child) {
        return IconButton(
          icon: Icon(
            themeViewModel.isDarkMode
                ? Icons.light_mode
                : Icons.dark_mode,
          ),
          onPressed: () {
            themeViewModel.toggleTheme();
          },
          tooltip: themeViewModel.isDarkMode
              ? 'ライトモードに切り替え'
              : 'ダークモードに切り替え',
        );
      },
    );
  }
}