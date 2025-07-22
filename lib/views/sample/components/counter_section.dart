import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yumemi_codecheck/view_models/sample_view_model.dart';

class CounterSection extends StatelessWidget {
  const CounterSection({
    super.key,
    required this.scaleAnimation,
  });

  final Animation<double> scaleAnimation;

  @override
  Widget build(BuildContext context) {
    final sampleCounterViewModel = context.watch<SampleViewModel>();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Counter',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                ScaleTransition(
                  scale: scaleAnimation,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '${sampleCounterViewModel.count}',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  sampleCounterViewModel.message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16),
                if (sampleCounterViewModel.isLoading)
                  const CircularProgressIndicator()
                else
                  Wrap(
                    spacing: 8,
                    children: [
                      IconButton(
                        onPressed: sampleCounterViewModel.increment,
                        icon: const Icon(Icons.add),
                        iconSize: 32,
                      ),
                      IconButton(
                        onPressed: sampleCounterViewModel.decrement,
                        icon: const Icon(Icons.remove),
                        iconSize: 32,
                      ),
                      ElevatedButton(
                        onPressed: sampleCounterViewModel.incrementAsync,
                        child: const Text('非同期 +1'),
                      ),
                      IconButton(
                        onPressed: sampleCounterViewModel.reset,
                        icon: const Icon(Icons.refresh),
                        iconSize: 32,
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
