import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jasa_bantu/Pages/DASHBOARD/DashboardPages.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/LOGIN/OTPLogin.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/LOGIN/PINLogin.dart';
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
  String processAccess = "";
  String token = "";
  String ID = "";
  String authorizationToken = 'MTIzNDUxOldlbGhhbjo2MjgxMjk2MDIzMDUx';

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

  verifyOTPRegistrasi(context, String flag, String hasilEncode) async {
    final FlutterSecureStorage secureStorage = FlutterSecureStorage();


    Map<String, dynamic> data = {
      'flag': flag,
    };

    String uri = constant.urlAPi + constant.RequestOTP;
    Uri uriValue = Uri.parse(uri);

    var response = await http.post(
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

/*
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
*/

  Future<void> verifyLogin(context, String hasilEncode, String process) async {
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

      if (process == "1") {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => InputName()),
                (Route<dynamic> route) => true);
      } else if (process == "2") {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => SettingPIN()),
                (Route<dynamic> route) => true);
      } else if (process == "3") {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => PINLogin()),
                (Route<dynamic> route) => true);
      }
    } else if (response.statusCode == 400) {
      print('message: ${jsonDecode(response.body)['message']}');
    }
  }

  ///SetName
  setName(context, String name, String hasilEncode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

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

        sharedPreferences.setString("nama_lengkap", name);

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

        print(messageresponse);
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

  ///Login User By Phone
  LoginApi(context, String users) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final FlutterSecureStorage secureStorage = FlutterSecureStorage();

    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    RegExp numberRegex = RegExp(r'^[0-9]+$');

    if (emailRegex.hasMatch(users)) {
      await secureStorage.write(key: 'email', value: users);
    } else if (numberRegex.hasMatch(users)) {
      await secureStorage.write(key: 'nomorHp', value: users);
    }

    Map<String, dynamic> data = {'user': users};

    String uri = constant.urlAPi + constant.Login;
    Uri uriValue = Uri.parse(uri);

    var response = await http.post(
      uriValue,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      statusresponse = jsonResponse['status'];
      messageresponse = jsonResponse['message'];
      processAccess = jsonResponse['process'].toString();
      ID = jsonResponse['id'];

      sharedPreferences.setString("process_steps", processAccess);

      print(ID);
      await secureStorage.write(key: 'ID', value: ID);

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => OTPLogin()),
              (Route<dynamic> route) => true);
    } else if (response.statusCode == 202) {
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

  RegisterAPI(context, String users, String flag) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final FlutterSecureStorage secureStorage = FlutterSecureStorage();

    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    RegExp numberRegex = RegExp(r'^[0-9]+$');

    if (emailRegex.hasMatch(users)) {
      await secureStorage.write(key: 'email', value: users);
    } else if (numberRegex.hasMatch(users)) {
      await secureStorage.write(key: 'nomorHp', value: users);
    }

    Map<String, dynamic> data = {
      'user': users,
    };

    String uri = constant.urlAPi + constant.Login;
    Uri uriValue = Uri.parse(uri);

    var response = await http.post(
      uriValue,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      statusresponse = jsonResponse['status'];
      messageresponse = jsonResponse['message'];
      processAccess = jsonResponse['process'].toString();
      ID = jsonResponse['id'];

      sharedPreferences.setString("process_steps", processAccess);

      print(ID);
      await secureStorage.write(key: 'ID', value: ID);

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => OTPLogin()),
              (Route<dynamic> route) => true);
    } else if (response.statusCode == 202) {
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

  /// Login Pin
  Future<void> loginPin(context, String hasilEncode) async {
    final response = await http.post(
      Uri.parse(constant.urlAPi + constant.checkPin),
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
