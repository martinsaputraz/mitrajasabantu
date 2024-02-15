import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/background.dart';
import 'package:flutter_onboarding_slider/background_body.dart';
import 'package:flutter_onboarding_slider/page_offset_provider.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

AssetsColor assetsColor = AssetsColor();

class OnBoardingFunction extends StatefulWidget {
  final int totalPage;
  final Color headerBackgroundColor;
  final List<Widget> background;
  final double speed;
  final Color? pageBackgroundColor;
  final Gradient? pageBackgroundGradient;
  final Function? onFinish;
  final Widget? trailing;
  final List<Widget> pageBodies;
  final Function? trailingFunction;
  final Color? controllerColor;
  final bool centerBackground;
  final bool addController;
  final double imageVerticalOffset;
  final double imageHorizontalOffset;
  final Widget? leading;
  final Widget? middle;
  final bool hasFloatingButton;
  final bool indicatorAbove;
  final double indicatorPosition;

  const OnBoardingFunction({
    super.key,
    required this.totalPage,
    required this.headerBackgroundColor,
    required this.background,
    required this.speed,
    required this.pageBodies,
    this.onFinish,
    this.trailingFunction,
    this.trailing,
    this.pageBackgroundColor,
    this.pageBackgroundGradient,
    this.controllerColor,
    this.addController = true,
    this.centerBackground = false,
    this.imageVerticalOffset = 0,
    this.imageHorizontalOffset = 0,
    this.leading,
    this.middle,
    this.hasFloatingButton = true,
    this.indicatorAbove = false,
    this.indicatorPosition = 0,
  });

  @override
  OnBoardingFunctionState createState() => OnBoardingFunctionState();
}

class OnBoardingFunctionState extends State<OnBoardingFunction> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentPage < widget.totalPage - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => PageOffsetNotifier(_pageController),
      child: Scaffold(
        backgroundColor: widget.pageBackgroundColor,
        body: CupertinoPageScaffold(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: widget.pageBackgroundGradient,
              color: widget.pageBackgroundColor,
            ),
            child: SafeArea(
              child: Background(
                centerBackground: widget.centerBackground,
                imageHorizontalOffset: widget.imageHorizontalOffset,
                imageVerticalOffset: widget.imageVerticalOffset,
                background: widget.background,
                speed: widget.speed,
                totalPage: widget.totalPage,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: BackgroundBody(
                        controller: _pageController,
                        function: slide,
                        totalPage: widget.totalPage,
                        bodies: widget.pageBodies,
                      ),
                    ),
                    widget.addController
                        ? Column(
                            children: [
                              SmoothPageIndicator(
                                controller: _pageController,
                                count: widget.totalPage,
                                effect: ExpandingDotsEffect(
                                  activeDotColor: assetsColor.indicatorSlide,
                                  dotColor: Colors.white,
                                  dotHeight: 10,
                                  dotWidth: 10,
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Fungsi untuk menangani perpindahan halaman
  void slide(int page) {
    setState(() {
      _currentPage = page;
    });
  }
}
