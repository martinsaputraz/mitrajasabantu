import 'package:flutter/material.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/ONBOARDING/OnboardingPages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModelSharePreferences {
  Future<Map<String, String>> dataShareprefrences() async {
    final prefs = await SharedPreferences.getInstance();
    String nama_lengkap = prefs.getString("nama_lengkap") ?? '';
    String aksesMasuk = prefs.getString("akses_masuk") ?? '';
    String processSteps = prefs.getString("process_steps") ?? '';

    return {
      'nama_lengkap': nama_lengkap,
      'akses_masuk': aksesMasuk,
      'process_steps': processSteps,
    };
  }

  deleteSharePrefrences(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final currentContext = context;

    // Remove specific entries
    prefs.remove("nama_lengkap");
    prefs.remove("akses_masuk");
    Navigator.of(currentContext).pushAndRemoveUntil(
      MaterialPageRoute(builder: (BuildContext context) => OnboardingPages()),
      (Route<dynamic> route) => false,
    );
  }

  deleteProcess(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("process_steps");
  }
}
