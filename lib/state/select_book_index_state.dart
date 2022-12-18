import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectBookIndexNotifier extends StateNotifier<int> {
  SelectBookIndexNotifier(): super(0);

  void selectBook(int index) {
    state = index;
  }

}

final selectBookIndexProvider = StateNotifierProvider<SelectBookIndexNotifier, int>((ref) {
  return SelectBookIndexNotifier();
});