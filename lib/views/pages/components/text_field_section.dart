import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TextFieldSection extends HookWidget {
  const TextFieldSection({
    super.key,
    required this.textController,
    required this.isTextFieldVisible,
    required this.animationController,
  });

  final TextEditingController textController;
  final ValueNotifier<bool> isTextFieldVisible;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      void listener() {
        debugPrint('Text changed: ${textController.text}');
      }

      textController.addListener(listener);
      return () => textController.removeListener(listener);
    }, [textController]);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TextField',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                isTextFieldVisible.value = !isTextFieldVisible.value;
                if (isTextFieldVisible.value) {
                  animationController.forward();
                } else {
                  animationController.reverse();
                }
              },
              icon: Icon(
                isTextFieldVisible.value
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
              label: Text(
                isTextFieldVisible.value ? '非表示' : '表示',
              ),
            ),
            const SizedBox(height: 16),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: isTextFieldVisible.value ? 60 : 0,
              child: isTextFieldVisible.value
                  ? TextField(
                      controller: textController,
                      decoration: const InputDecoration(
                        labelText: 'テキストを入力',
                        border: OutlineInputBorder(),
                      ),
                    )
                  : null,
            ),
            if (textController.text.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  '現在のテキスト: ${textController.text}',
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
