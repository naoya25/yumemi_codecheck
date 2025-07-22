import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/theme.dart';
import 'router.dart';
import 'view_models/sample_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SampleViewModel()),
      ],
      child: MaterialApp.router(
        title: 'Yumemi CodeCheck App',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
