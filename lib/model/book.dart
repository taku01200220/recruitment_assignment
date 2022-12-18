import 'package:freezed_annotation/freezed_annotation.dart';
part 'book.freezed.dart';

@freezed
class Book with _$Book {
  const factory Book({
    required String id,
    required DateTime createdAt,
    required String title,
    required String content,
  }) = _Book;
}
