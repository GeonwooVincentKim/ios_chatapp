import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final testProvider = Provider((_) => 'Testing');

void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(testProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Example')),
        body: Center(
          child: Text(value)
        )
      ),
    );
  }
}