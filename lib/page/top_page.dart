import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recruitment_assignment/importer.dart';

class TopPage extends HookConsumerWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTitleControlled = useState(false);
    final isContentControlled = useState(false);
    final title = useState(ref.watch(booksProvider)[ref.watch(selectBookIndexProvider)].title);
    final content = useState(ref.watch(booksProvider)[ref.watch(selectBookIndexProvider)].content);
    final titleController = useState(TextEditingController(text: ref.watch(booksProvider)[ref.watch(selectBookIndexProvider)].title));
    final contentController = useState(TextEditingController(text: ref.watch(booksProvider)[ref.watch(selectBookIndexProvider)].content));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const TopAppBar(),
      drawer: SideMenu(
        function: () {
          title.value = ref.watch(booksProvider)[ref.watch(selectBookIndexProvider)].title;
          titleController.value = TextEditingController(text: ref.watch(booksProvider)[ref.watch(selectBookIndexProvider)].title);
          content.value = ref.watch(booksProvider)[ref.watch(selectBookIndexProvider)].content;
          contentController.value = TextEditingController(text: ref.watch(booksProvider)[ref.watch(selectBookIndexProvider)].content);
        },
      ),
      body: Center(
        child: Stack(
          children: [
            // 最背面の背景色（グレー）
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F8FA),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28, right: 28, top: 12, bottom: 28),
              child: Column(
                children: [
                  // タイトルのボタン
                  AppEditButton(
                    value: isTitleControlled.value,
                    edit: () => isTitleControlled.value = !isTitleControlled.value,
                    cancel: () {
                      titleController.value.text = title.value;
                      isTitleControlled.value = !isTitleControlled.value;
                    },
                    save: () {
                      title.value = titleController.value.text;
                      isTitleControlled.value = !isTitleControlled.value;
                      ref.read(booksProvider.notifier).editBook(ref.watch(selectBookIndexProvider), title.value, content.value);
                    },
                  ),
                  // タイトルのテキストフィールド
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: AppTextField(
                      text: 'title',
                      value: isTitleControlled.value,
                      controller: titleController.value,
                    ),
                  ),
                  // コンテンツのボタン
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: AppEditButton(
                      value: isContentControlled.value,
                      edit: () => isContentControlled.value = !isContentControlled.value,
                      cancel: () {
                        contentController.value.text = content.value;
                        isContentControlled.value = !isContentControlled.value;
                      },
                      save: () {
                        content.value = contentController.value.text;
                        isContentControlled.value = !isContentControlled.value;
                        ref.read(booksProvider.notifier).editBook(ref.watch(selectBookIndexProvider), title.value, content.value);
                      },
                    ),
                  ),
                  // コンテンツのテキストフィールド
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: SizedBox(
                      height: 533,
                      child: AppTextField(
                        text: 'content',
                        value: isContentControlled.value,
                        controller: contentController.value,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
