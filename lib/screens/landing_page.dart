import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapps/ui_view/slider_layout_view.dart';
import 'package:myapps/constants/constant.dart';
import 'package:myapps/widgets/custom_font.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<StatefulWidget> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: onBordingBody(),
    );
  }

  Widget onBordingBody() => Container(
    child: SliderLayoutView(),
  );
}