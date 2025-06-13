import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeModule extends StatefulWidget {
  final ValueChanged<Locale> onLocaleChanged;
  const HomeModule({super.key, required this.onLocaleChanged});

  @override
  State<HomeModule> createState() => _HomeModuleState();
}

class _HomeModuleState extends State<HomeModule> {
  void _toggleLocale() {
    final current = Localizations.localeOf(context);
    if (current.languageCode == 'en') {
      widget.onLocaleChanged(const Locale('vi', 'VN'));
    } else {
      widget.onLocaleChanged(const Locale('en', 'US'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
        actions: [
          InkWell(
            onTap: _toggleLocale,
            child: Row(
              children: [
                const Icon(Icons.language, size: 24),
                Text(
                  Localizations.localeOf(context).languageCode.toUpperCase(),
                ),
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
