import 'package:flutter/material.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/ONBOARDING/OnboardingFunction.dart';
import 'package:jasa_bantu/Settings/AssetsColor.dart';
import 'package:jasa_bantu/Settings/constant.dart';

Constant constants = Constant();
AssetsColor assetsColor = AssetsColor();

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingFunction(
      controllerColor: assetsColor.textOnboardingArea,
      totalPage: 5,
      headerBackgroundColor: assetsColor.bgOnboardingPages,
      pageBackgroundColor: assetsColor.bgOnboardingPages,
      background: [
        Image.asset(
          constants.imageSlider1,
          height: 300,
        ),
        Image.asset(
          constants.imageSlider2,
          height: 300,
        ),
        Image.asset(
          constants.imageSlider3,
          height: 300,
        ),
        Image.asset(
          constants.imageSlider4,
          height: 300,
        ),
        Image.asset(
          constants.imageSlider5,
          height: 300,
        ),
      ],
      speed: 1.8,
      pageBodies: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              Text(
                constants.teks1SliderAtas,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: assetsColor.textOnboardingArea,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                constants.teks1SliderBawah,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: assetsColor.subtextOnboardingArea,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              Text(
                constants.teks2SliderAtas,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: assetsColor.textOnboardingArea,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                constants.teks2SliderBawah,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: assetsColor.subtextOnboardingArea,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              Text(
                constants.teks3SliderAtas,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: assetsColor.textOnboardingArea,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                constants.teks3SliderBawah,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: assetsColor.subtextOnboardingArea,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              Text(
                constants.teks4SliderAtas,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: assetsColor.textOnboardingArea,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                constants.teks4SliderBawah,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: assetsColor.subtextOnboardingArea,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              Text(
                constants.teks5SliderAtas,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: assetsColor.textOnboardingArea,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                constants.teks5SliderBawah,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: assetsColor.subtextOnboardingArea,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
