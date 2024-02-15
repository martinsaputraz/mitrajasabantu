import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jasa_bantu/Pages/DASHBOARD/DashboardPages.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/LOGIN/LoginPages.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/LOGIN/OTPLogin.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/REGISTER/InputName.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/REGISTER/OTPpages.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/REGISTER/RegisterPages.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/REGISTER/SettingPIN.dart';
import 'package:jasa_bantu/Settings/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

Constant constant = Constant();

class LogicApi {
  ///Variable
  String statusresponse = "";
  String messageresponse = "";
  String koneksiresponse = "";
  String token = "";
  String ID = "";
  String authorizationToken = 'MTIzNDUxOldlbGhhbjo2MjgxMjk2MDIzMDUx';

  ///logicAPI

  checkPhone(context, String phone) async {
    Map data = {
      'phone': phone,
    };

    String uri = constant.urlAPi;
    Uri uriValue = Uri.parse(uri);

    var response = await http.post(uriValue, body: data);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {
        statusresponse = jsonResponse['status'];
        messageresponse = jsonResponse['message'];
      }

      if (statusresponse == "success") {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => const OTPLogin()),
            (Route<dynamic> route) => false);
      }
    } else if (response.statusCode == 303) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {
        statusresponse = jsonResponse['status'];
        messageresponse = jsonResponse['message'];
      }

      if (statusresponse == "failed") {
        print(messageresponse);

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => const LoginPages()),
            (Route<dynamic> route) => false);
      }
    }
  }

  loginPhone(context, String phone, String pin) async {
    Map data = {
      'phone': phone,
      'pin': pin,
    };

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String uri = constant.urlAPi;
    Uri uriValue = Uri.parse(uri);

    var response = await http.post(uriValue, body: data);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {
        statusresponse = jsonResponse['status'];
        messageresponse = jsonResponse['message'];
      }

      if (statusresponse == "success") {
        sharedPreferences.setString(
            "KEY_MASUK", jsonResponse['status'] ?? "null");

/*
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) => const Dashboard()),
              (Route<dynamic> route) => false);*/
      }
    } else if (response.statusCode == 202) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {
        statusresponse = jsonResponse['status'];
        messageresponse = jsonResponse['message'];
      }

      if (statusresponse == "failed") {
/*
      Utils.showAlertDialog(context, messageResponse);
*/
      }
    }
  }

  loginByEmail(context, String phone, String pin) async {
    Map data = {
      'phone': phone,
      'pin': pin,
    };

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String uri = constant.urlAPi;
    Uri uriValue = Uri.parse(uri);

    var response = await http.post(uriValue, body: data);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {
        statusresponse = jsonResponse['status'];
        messageresponse = jsonResponse['message'];
      }

      if (statusresponse == "success") {
        sharedPreferences.setString(
            "KEY_MASUK", jsonResponse['status'] ?? "null");

/*
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) => const Dashboard()),
              (Route<dynamic> route) => false);*/
      }
    } else if (response.statusCode == 202) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {
        statusresponse = jsonResponse['status'];
        messageresponse = jsonResponse['message'];
      }

      if (statusresponse == "failed") {
/*
      Utils.showAlertDialog(context, messageResponse);
*/
      }
    }
  }

  checkOTP(context, String phone, String otp, String uniqueID) async {
    Map data = {'phone': phone, 'otp': otp, 'uniqueID': uniqueID};

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String uri = constant.urlAPi;
    Uri uriValue = Uri.parse(uri);

    var response = await http.post(uriValue, body: data);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {
        statusresponse = jsonResponse['status'];
        messageresponse = jsonResponse['message'];
      }

      if (statusresponse == "success") {
/*
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) => const Dashboard()),
              (Route<dynamic> route) => false);*/
      }
    } else if (response.statusCode == 202) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {
        statusresponse = jsonResponse['status'];
        messageresponse = jsonResponse['message'];
      }

      if (statusresponse == "failed") {
/*
      Utils.showAlertDialog(context, messageResponse);
*/
      }
    }
  }

  createPin(context, String pin, String uniqueID) async {
    Map data = {'pin': pin, 'uniqueID': uniqueID};

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String uri = constant.urlAPi;
    Uri uriValue = Uri.parse(uri);

    var response = await http.post(uriValue, body: data);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {
        statusresponse = jsonResponse['status'];
        messageresponse = jsonResponse['message'];
      }

      if (statusresponse == "success") {
/*
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) => const Dashboard()),
              (Route<dynamic> route) => false);*/
      }
    } else if (response.statusCode == 202) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {
        statusresponse = jsonResponse['status'];
        messageresponse = jsonResponse['message'];
      }

      if (statusresponse == "failed") {
/*
      Utils.showAlertDialog(context, messageResponse);
*/
      }
    }
  }

  Future<void> login() async {
    final response = await http.post(
      Uri.parse('https://bkgkgngv-5000.asse.devtunnels.ms/api/user_token'),
      // Ganti URL dengan URL endpoint Flask Anda
      headers: {'Authorization': 'Bearer $authorizationToken'},
    );

    if (response.statusCode == 200) {
      print('Login successful');
      print('Token: ${jsonDecode(response.body)['data']}');
    } else {
      print('Failed to login');
    }
  }

  ///Send Otp
  sendOTPDefault(context, String phone) async {
    final FlutterSecureStorage secureStorage = FlutterSecureStorage();

    Map<String, dynamic> data = {
      'phone': phone,
    };

    String uri = constant.urlAPi + constant.RequestOTP;
    Uri uriValue = Uri.parse(uri);

    try {
      var response = await http.post(
        uriValue,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);

        if (jsonResponse != null) {
          statusresponse = jsonResponse['status'];
          messageresponse = jsonResponse['message'];
        }

        if (statusresponse == "success") {
          await secureStorage.write(key: 'nomorHp', value: phone);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const OTPPages()),
          );
        }
      } else if (response.statusCode == 202) {
        var jsonResponse = json.decode(response.body);

        if (jsonResponse != null) {
          statusresponse = jsonResponse['status'];
          messageresponse = jsonResponse['message'];
        }

        if (statusresponse == "failed") {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      RegisterPages(message: messageresponse)),
              (Route<dynamic> route) => true);
        }
      } else if (response.statusCode == 400) {
        var jsonResponse = json.decode(response.body);

        if (jsonResponse != null) {
          statusresponse = jsonResponse['status'];
          messageresponse = jsonResponse['message'];
        }
      }
    } catch (e) {
      print('Error during OTP request: $e');
      // Handle the error as needed
    }
  }

  sendOTPDefault2(context, String phone) async {
    Map<String, dynamic> data = {
      'phone': phone,
    };

    String uri = constant.urlAPi + constant.RequestOTP;
    Uri uriValue = Uri.parse(uri);

    var response = await http.post(
      uriValue,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {
        statusresponse = jsonResponse['status'];
        messageresponse = jsonResponse['message'];
      }
    } else if (response.statusCode == 303) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {
        statusresponse = jsonResponse['status'];
        messageresponse = jsonResponse['message'];
      }
    } else if (response.statusCode == 400) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {
        statusresponse = jsonResponse['status'];
        messageresponse = jsonResponse['message'];
      }
    }
  }

  sendOTPCustom(context, String phone, String type) async {
    Map data = {
      'phone': phone,
      'type': type,
    };

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String uri = constant.urlAPi;
    Uri uriValue = Uri.parse(uri);

    var response = await http.post(uriValue, body: data);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {
        statusresponse = jsonResponse['status'];
        messageresponse = jsonResponse['message'];
      }

      if (statusresponse == "success") {
/*
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) => const Dashboard()),
              (Route<dynamic> route) => false);*/
      }
    } else if (response.statusCode == 202) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {
        statusresponse = jsonResponse['status'];
        messageresponse = jsonResponse['message'];
      }

      if (statusresponse == "failed") {
/*
      Utils.showAlertDialog(context, messageResponse);
*/
      }
    }
  }

  ///verify OTp
  Future<void> verifyOTPRegistrasi(context, String hasilEncode) async {
    final FlutterSecureStorage secureStorage = FlutterSecureStorage();

    final response = await http.post(
      Uri.parse(constant.urlAPi + constant.verifyOTP),
      // Ganti URL dengan URL endpoint Flask Anda

      headers: {'Authorization': 'Bearer $hasilEncode'},
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {
        statusresponse = jsonResponse['status'];
        messageresponse = jsonResponse['message'];
      }

      if (statusresponse == "success") {
        ID = jsonResponse['data']['id'];
        token = jsonResponse['data']['token'];

        await secureStorage.write(key: 'ID', value: ID);
        await secureStorage.write(key: 'token', value: token);

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => const InputName()),
            (Route<dynamic> route) => false);
      }
    } else if (response.statusCode == 400) {
      print('message: ${jsonDecode(response.body)['message']}');
    }
  }

  ///SetName
  setName(context, String name, String hasilEncode) async {
    Map<String, dynamic> data = {
      'name': name,
    };

    String uri = constant.urlAPi + constant.setName;
    Uri uriValue = Uri.parse(uri);

    try {
      var response = await http.put(
        uriValue,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $hasilEncode',
        },
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);

        if (jsonResponse != null) {
          statusresponse = jsonResponse['status'];
          messageresponse = jsonResponse['message'];
        }

        if (statusresponse == "success") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SettingPIN()),
          );
        }
      } else if (response.statusCode == 202) {
        var jsonResponse = json.decode(response.body);

        if (jsonResponse != null) {
          statusresponse = jsonResponse['status'];
          messageresponse = jsonResponse['message'];
        }

        if (statusresponse == "failed") {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      RegisterPages(message: messageresponse)),
              (Route<dynamic> route) => true);
        }
      } else if (response.statusCode == 400) {
        var jsonResponse = json.decode(response.body);

        if (jsonResponse != null) {
          statusresponse = jsonResponse['status'];
          messageresponse = jsonResponse['message'];
        }
      }
    } catch (e) {
      print('Error during OTP request: $e');
      // Handle the error as needed
    }
  }

  ///serPIN
  Future<void> setPIN(context, String hasilEncode) async {
    final response = await http.post(
      Uri.parse(constant.urlAPi + constant.setPin),
      // Ganti URL dengan URL endpoint Flask Anda

      headers: {'Authorization': 'Bearer $hasilEncode'},
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print("helo world");
      if (jsonResponse != null) {
        statusresponse = jsonResponse['status'];
        messageresponse = jsonResponse['message'];
      }

      if (statusresponse == "success") {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => const DashboardPages()),
            (Route<dynamic> route) => false);
      }
    } else if (response.statusCode == 400) {
      print('message: ${jsonDecode(response.body)['message']}');
    }
  }
}
