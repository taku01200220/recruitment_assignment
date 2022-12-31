import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'importer.dart';

// commitTest
void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),      
    ),
  );
}