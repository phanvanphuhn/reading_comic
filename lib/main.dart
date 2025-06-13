import 'package:booking_app/modules/archive/archive_module.dart';
import 'package:booking_app/modules/explore/explore_module.dart';
import 'package:booking_app/modules/home/home_module.dart';
import 'package:booking_app/modules/profile/profile_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Locale _locale = const Locale('en', 'US');

  void _switchLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyApp(locale: _locale, onLocaleChanged: _switchLocale);
  }
}

class MyApp extends StatelessWidget {
  final Locale? locale;
  final ValueChanged<Locale> onLocaleChanged;

  const MyApp({super.key, required this.locale, required this.onLocaleChanged});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(onLocaleChanged: onLocaleChanged),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final ValueChanged<Locale> onLocaleChanged;
  const MyHomePage({super.key, required this.onLocaleChanged});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = <Widget>[
      Center(child: HomeModule(onLocaleChanged: widget.onLocaleChanged)),
      Center(child: ExploreModule()),
      Center(child: ArchiveModule()),
      Center(child: ProfileModule()),
    ];

    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.archive), label: 'Archive'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
