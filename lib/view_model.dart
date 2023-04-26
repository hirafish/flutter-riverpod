import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/logic.dart';
import 'package:riverpod_countup/provider.dart';

class ViewModel {
  Logic _logic = Logic();
  late WidgetRef _ref;

  void setRef(WidgetRef ref) {
    this._ref = ref;
  }

  get count => _ref.watch(CountDataProvider).count.toString();
  get countUp =>
      _ref.watch(CountDataProvider.select((value) => value.countUp.toString()));
  get countDown => _ref
      .watch(CountDataProvider.select((value) => value.countDown.toString()));

  void onIncrease() {
    _logic.increase();

    _ref.watch(CountDataProvider.notifier).state = _logic.countData;
  }

  void onDecrease() {
    _logic.decrease();

    _ref.watch(CountDataProvider.notifier).state = _logic.countData;
  }

  void reset() {
    _logic.reset();

    _ref.watch(CountDataProvider.notifier).state = _logic.countData;
  }
}
