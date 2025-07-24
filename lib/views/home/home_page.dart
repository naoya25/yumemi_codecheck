import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:yumemi_codecheck/constants/routes.dart';

import 'components/theme_toggle_button.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yumemi CodeCheck'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          const ThemeToggleButton(),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              context.push(Routes.search);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Icon(
              Icons.search,
              size: 64,
            ),
            const SizedBox(height: 16),
            const Text(
              'GitHub リポジトリ検索',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Builder(
              builder: (context) => Text(
                'リポジトリを検索して詳細を確認',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.6),
                ),
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
