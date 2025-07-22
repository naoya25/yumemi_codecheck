import 'package:flutter/material.dart';

class SampleViewModel extends ChangeNotifier {
  int _count = 0;
  bool _isLoading = false;
  String _message = 'こんにちは';

  int get count => _count;
  bool get isLoading => _isLoading;
  String get message => _message;

  void increment() {
    _count++;
    _message = 'カウントが $_count に増えました';
    notifyListeners();
  }

  void decrement() {
    _count--;
    _message = 'カウントが $_count に減りました';
    notifyListeners();
  }

  void reset() {
    _count = 0;
    _message = 'カウントを 0 にリセットしました';
    notifyListeners();
  }

  Future<void> incrementAsync() async {
    _isLoading = true;
    _message = '非同期処理中...';
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    _count++;
    _isLoading = false;
    _message = '非同期処理完了！ カウント: $_count';
    notifyListeners();
  }

  void updateMessage(String newMessage) {
    _message = newMessage;
    notifyListeners();
  }
}
