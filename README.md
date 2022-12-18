# 概要

環境：iOS
言語：Dart
フレームワーク：Flutter

# DEMO

https://user-images.githubusercontent.com/96103285/208285383-978e3e5d-d165-4d39-9fb2-0e2e5e90f2a3.mov

# 設計思想

###### 状態管理
・Riverpod
・Freezed
・Hooks

###### フォルダ構成
Lib
|-component // コンポーネント化したWidget
|-model // Freezedで作成したimmutableなモデルクラス
|-page // 画面に表示するページ
|-state // pageから参照する値
app.dart
importer.dart
main.dart

# Author

* Takuro, Abe
* takuro.abe0220@gmail.com