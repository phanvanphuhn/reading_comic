import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Holds the current locale
final localeProvider = StateProvider<Locale>((ref) => const Locale('en', 'US'));

// Function to toggle locale
void toggleLocale(WidgetRef ref) {
  final current = ref.read(localeProvider);
  if (current.languageCode == 'en') {
    ref.read(localeProvider.notifier).state = const Locale('vi', 'VN');
  } else {
    ref.read(localeProvider.notifier).state = const Locale('en', 'US');
  }
}
