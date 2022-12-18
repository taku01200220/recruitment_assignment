import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recruitment_assignment/importer.dart';

class BooksNotifier extends StateNotifier<List<Book>> {
  BooksNotifier(): super([
    // 初期値として適当なデータを入れています
    Book(id: '0', createdAt: DateTime.now(), title: '坊ちゃん', content: '坊ちゃん\nコンテント'),
    Book(id: '1', createdAt: DateTime.now(), title: '方丈記', content: '方丈記\nコンテント'),
  ]);

  void addBook() {
    state.add(
        Book(
            id: (state.length).toString(),
            createdAt: DateTime.now(),
            title: 'タイトル',
            content: 'コンテンツ',
        ),
    );
  }

  void deleteBook(int index) {
    state.removeAt(index);
  }

  void editBook(int index, String title, String content) {
    state[index] = Book(id: state[index].id, createdAt: state[index].createdAt, title: title, content: content);
  }

}

final booksProvider = StateNotifierProvider<BooksNotifier, List<Book>>((ref) {
  return BooksNotifier();
});