import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:jasa_bantu/Pages/StarterPages/SplashScreen.dart';
import 'package:jasa_bantu/Settings/constant.dart';
import 'package:jasa_bantu/Settings/firebase_options.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp(packageInfo: packageInfo));
}

Constant constant = Constant();
AssetsColor assetsColor = AssetsColor();

class MyApp extends StatefulWidget {
  final PackageInfo packageInfo;

  const MyApp({Key? key, required this.packageInfo}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState(packageInfo: packageInfo);
}

class _MyAppState extends State<MyApp> {
  final PackageInfo packageInfo;

  _MyAppState({required this.packageInfo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jasa Bantu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        indicatorColor: assetsColor.indicatorColor,
        inputDecorationTheme: const InputDecorationTheme(),
      ),
      home: SplashScreen(
        packageInfo: packageInfo,
      ),
    );
  }
}

// packageInfo: packageInfo
