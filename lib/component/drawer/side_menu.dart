import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recruitment_assignment/importer.dart';

class SideMenu extends HookConsumerWidget {
  final Function function;

  const SideMenu({
    Key? key,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final books = ref.watch(booksProvider);
    final value = useState(true); // stateが変更されないと、画面が再描画されないため使用
    final isControlled = useState(false);
    return Drawer(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          children: [
            LimitedBox(
              maxHeight: MediaQuery.of(context).size.height - 76,
              child: ListView.builder(
                itemCount: books.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 20),
                      child: Row(
                        children: const [
                          Logo(),
                          SizedBox(width: 8),
                          LogoText(),
                        ],
                      ),
                    );
                  }
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      color: (index - 1) == ref.watch(selectBookIndexProvider) ? const Color(0xFFF5F8FA) : Colors.white,
                    ),
                    child: ListTile(
                      title: GestureDetector(
                        child: Text(
                          books[index - 1].title,
                          style: TextStyle(
                            color: (index - 1) == ref.watch(selectBookIndexProvider) ? const Color(0xFF32A8F8) : Colors.black,
                            fontWeight: (index - 1) == ref.watch(selectBookIndexProvider) ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                        onTap: () {
                          ref.read(selectBookIndexProvider.notifier).selectBook(index - 1);
                          function();
                        },
                      ),
                      trailing: Visibility(
                        visible: isControlled.value,
                        child: GestureDetector(
                          child: SvgPicture.asset(
                            'asset/icon/delete.svg',
                            width: 24,
                            height: 24,
                          ),
                          onTap: () {
                            ref.read(booksProvider.notifier).deleteBook(index - 1);
                            value.value = !value.value;
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              color: const Color(0xFFF5F8FA),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, right: 16, bottom: 16),
                  child: isControlled.value == false
                      ? EditButton(function: () => {isControlled.value = !isControlled.value})
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              NewPageButton(
                                  function: () {
                                    ref.read(booksProvider.notifier).addBook();
                                    value.value = !value.value;
                              }),
                              const SizedBox(width: 16),
                              DoneButton(function: () => {isControlled.value = !isControlled.value}),
                            ],
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
