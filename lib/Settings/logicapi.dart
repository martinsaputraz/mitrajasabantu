import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jasa_bantu/Settings/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

Constant constant = Constant();

class LogicApi {
  ///Variable
  String statusresponse = "";
  String messageresponse = "";
  String koneksiresponse = "";

  ///logicAPI
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

  sendOTP(context, String phone, String type) async {
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

  ///
}
