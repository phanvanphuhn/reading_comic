import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExploreModule extends StatefulWidget {
  const ExploreModule({super.key});

  @override
  State<ExploreModule> createState() => _ExploreModuleState();
}

class _ExploreModuleState extends State<ExploreModule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Explore')),
      body: Center(child: Text(AppLocalizations.of(context)!.hello)),
    );
  }
}
