import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpandedIndicesNotifier extends StateNotifier<Set<int>> {
  ExpandedIndicesNotifier() : super({});

  void toggle(int index) {
    if (state.contains(index)) {
      state = {...state}..remove(index);
    } else {
      state = {...state}..add(index);
    }
  }
}

final expandedIndicesProvider =
    StateNotifierProvider<ExpandedIndicesNotifier, Set<int>>(
  (ref) => ExpandedIndicesNotifier(),
);
