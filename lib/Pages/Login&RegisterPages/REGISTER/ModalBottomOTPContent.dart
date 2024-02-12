import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jasa_bantu/Assets/AssetsColor.dart';

AssetsColor assetsColor = AssetsColor();

class ModalBottomOTPContent extends StatefulWidget {
  final Function(bool, bool) updateSelection;

  const ModalBottomOTPContent({Key? key, required this.updateSelection})
      : super(key: key);

  @override
  _ModalBottomOTPContentState createState() => _ModalBottomOTPContentState();
}

class _ModalBottomOTPContentState extends State<ModalBottomOTPContent> {
  bool _sendOTPViaSMS = false;
  bool _sendOTPViaWhatsApp = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
            child: const Text('Metode pengiriman OTP'),
          ),

          /// SEND OTP SMS
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _sendOTPViaSMS = true;
                  _sendOTPViaWhatsApp = false;
                  widget.updateSelection(true, false);
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: assetsColor.buttonOtpMethodOptButton,
                side: BorderSide(
                    color: _sendOTPViaSMS
                        ? assetsColor.borderOtpMethodOptButton
                        : assetsColor.borderOtpMethodOptButtonUnpressed),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Icon(
                          Icons.message_outlined,
                          color: assetsColor.textOtpMethodOptButton,
                          size: 20,
                        ),
                      ),
                      Text(
                        'OTP dikirim ke SMS',
                        style: TextStyle(
                            color: assetsColor.textOtpMethodOptButton),
                      ),
                    ],
                  ),
                  Icon(
                    _sendOTPViaSMS
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked_outlined,
                    color: assetsColor.textOtpMethodOptButton,
                  ),
                ],
              ),
            ),
          ),

          /// SEND OTP WHATSAPP
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _sendOTPViaSMS = false;
                  _sendOTPViaWhatsApp = true;
                  widget.updateSelection(false, true);
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: assetsColor.buttonOtpMethodOptButton,
                side: BorderSide(
                    color: _sendOTPViaWhatsApp
                        ? assetsColor.borderOtpMethodOptButton
                        : assetsColor.borderOtpMethodOptButtonUnpressed),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: FaIcon(
                          FontAwesomeIcons.whatsapp,
                          color: Colors.lightGreen,
                          size: 20,
                        ),
                      ),
                      Text(
                        'OTP dikirim ke WhatsApp',
                        style: TextStyle(
                            color: assetsColor.textOtpMethodOptButton),
                      ),
                    ],
                  ),
                  Icon(
                    _sendOTPViaWhatsApp
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked_outlined,
                    color: assetsColor.textOtpMethodOptButton,
                  ),
                ],
              ),
            ),
          ),

          /// BUTTON "Kirim kode OTP"
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_sendOTPViaSMS || _sendOTPViaWhatsApp) {
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: assetsColor.buttonSendOTPCode,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Kirim kode OTP',
                      style: TextStyle(
                          color: assetsColor.textSentOTPCodeButton,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
