import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:yumemi_codecheck/views/sample/components/text_field_section.dart';
import 'package:yumemi_codecheck/views/sample/components/counter_section.dart';

class SamplePage extends HookWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();
    final isTextFieldVisible = useState(false);

    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );

    final scaleAnimation = useMemoized(
      () => Tween<double>(begin: 1.0, end: 1.2).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut),
      ),
      [animationController],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('サンプルページ'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CounterSection(scaleAnimation: scaleAnimation),
            const SizedBox(height: 32),
            TextFieldSection(
              textController: textController,
              isTextFieldVisible: isTextFieldVisible,
              animationController: animationController,
            ),
          ],
        ),
      ),
    );
  }
}
