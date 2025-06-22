import 'package:booking_app/shared/utils/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeHeader extends StatefulWidget implements PreferredSizeWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HomeHeaderState extends State<HomeHeader> {
  int _tapCount = 0;

  void onAvatarTap() {
    setState(() {
      _tapCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final locale = ref.watch(localeProvider);

        return AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Center(
              child: SizedBox(
                width: 40,
                height: 40,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    GestureDetector(
                      onTap: onAvatarTap,
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://i.pravatar.cc/150?u=a042581f4e29026704d',
                        ),
                      ),
                    ),
                    if (_tapCount > 0)
                      Positioned(
                        right: -8,
                        top: -8,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              _tapCount.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                height: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          title: Text(AppLocalizations.of(context)!.bottomNavHome),
          actionsPadding: const EdgeInsets.only(right: 16),
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
        );
      },
    );
  }
}
