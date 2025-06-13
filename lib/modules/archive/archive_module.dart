import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ArchiveModule extends StatefulWidget {
  const ArchiveModule({super.key});

  @override
  State<ArchiveModule> createState() => _ArchiveModuleState();
}

class _ArchiveModuleState extends State<ArchiveModule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Archive')),
      body: Center(child: Text(AppLocalizations.of(context)!.hello)),
    );
  }
}
