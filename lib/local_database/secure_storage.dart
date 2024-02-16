import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/ONBOARDING/OnboardingPages.dart';

class Securestorage {
  static const _storage = FlutterSecureStorage();

  Future<Map<String, String>> secureToken(String token) async {
    const FlutterSecureStorage secureStorage = FlutterSecureStorage();

    String? token = await secureStorage.read(key: 'token') ?? '';
    String? pin = await secureStorage.read(key: 'pin') ?? '';
    String ID = await secureStorage.read(key: 'ID') ?? '';
    String? noHp = await secureStorage.read(key: 'nomorHp') ?? '';
    String? email = await secureStorage.read(key: 'email') ?? '';

    return {
      'token': token,
      'pin': pin,
      'ID': ID,
      'nomorHp': noHp,
      'email': email,
    };
  }

  static Future<void> deleteSecureData(BuildContext context) async {
    final currentContext = context;

    try {
      // Remove specific entries
      await _storage.delete(key: "token");
      await _storage.delete(key: "pin");
      await _storage.delete(key: "ID");
      await _storage.delete(key: "nomorHp");
      await _storage.delete(key: "email");

      // Navigate to the onboarding pages
      Navigator.of(currentContext).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (BuildContext context) => const OnboardingPages()),
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      /*  print('Error deleting secure data: $e');*/
    }
  }
}
