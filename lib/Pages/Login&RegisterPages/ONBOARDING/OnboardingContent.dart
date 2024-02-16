import 'package:flutter/material.dart';
import 'package:jasa_bantu/Assets/AssetsColor.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/ONBOARDING/OnboardingFunction.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/ONBOARDING/OnboardingPages.dart';
import 'package:jasa_bantu/Settings/constant.dart';

AssetsColor assetsColor = AssetsColor();
Constant constanst = Constant();

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
          assetsImages.imageSlider1,
          height: 300,
        ),
        Image.asset(
          assetsImages.imageSlider2,
          height: 300,
        ),
        Image.asset(
          assetsImages.imageSlider3,
          height: 300,
        ),
        Image.asset(
          assetsImages.imageSlider4,
          height: 300,
        ),
        Image.asset(
          assetsImages.imageSlider5,
          height: 300,
        ),
      ],
      speed: 1.8,
      pageBodies: [

        Container(
          alignment: Alignment.center,
          width: MediaQuery
              .of(context)
              .size
              .width,
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              Text(
                constanst.teks1SliderAtas,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: assetsColor.textOnboardingArea,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                constanst.teks1SliderBawah,
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
          width: MediaQuery
              .of(context)
              .size
              .width,
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              Text(
                constanst.teks2SliderAtas,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: assetsColor.textOnboardingArea,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                constanst.teks2SliderBawah,
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
          width: MediaQuery
              .of(context)
              .size
              .width,
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              Text(
                constanst.teks3SliderAtas,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: assetsColor.textOnboardingArea,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                constanst.teks3SliderBawah,
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
          width: MediaQuery
              .of(context)
              .size
              .width,
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              Text(
                constanst.teks4SliderAtas,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: assetsColor.textOnboardingArea,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Where everything is possible and customize your onboarding.',
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
          width: MediaQuery
              .of(context)
              .size
              .width,
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              Text(
                constanst.teks5SliderAtas,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: assetsColor.textOnboardingArea,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                constanst.teks5SliderBawah,
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
