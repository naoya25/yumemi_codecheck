import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumemi_codecheck/constants/routes.dart';

class SampleButton extends StatelessWidget {
  const SampleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.push(Routes.sample);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
      ),
      child: const Text('サンプルページ'),
    );
  }
}
