import 'package:flutter/material.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/ONBOARDING/OnboardingPages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModelSharePreferences {
  Future<Map<String, String>> dataShareprefrences() async {
    final prefs = await SharedPreferences.getInstance();
    String nama_lengkap = prefs.getString("nama_lengkap") ?? '';
    String aksesMasuk = prefs.getString("akses_masuk") ?? '';
    String email = prefs.getString("email") ?? '';

    return {
      'nama_lengkap': nama_lengkap,
      'akses_masuk': aksesMasuk,
      'email': email,
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
}
