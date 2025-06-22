import 'package:booking_app/modules/home/widgets/home_carousel.dart';
import 'package:booking_app/modules/home/widgets/home_header.dart';
import 'package:flutter/material.dart';

class HomeModule extends StatelessWidget {
  const HomeModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: const HomeHeader(), body: const HomeCarousel());
  }
}
