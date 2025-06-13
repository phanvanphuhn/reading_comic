import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:booking_app/shared/utils/locale_provider.dart';

class HomeModule extends ConsumerWidget {
  const HomeModule({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    return Scaffold(
      appBar: AppBar(
        actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
        actions: [
          InkWell(
            onTap: () => toggleLocale(ref),
            child: Row(
              children: [
                const Icon(Icons.language, size: 24),
                Text(locale.languageCode.toUpperCase()),
              ],
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${AppLocalizations.of(context)!.hello} $index'),
          );
        },
      ),
    );
  }
}
