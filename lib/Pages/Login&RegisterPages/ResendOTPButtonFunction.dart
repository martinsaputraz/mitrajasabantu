import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ButtonState { enable_button, loading, timer, pressed }

enum ButtonType { elevated_button, text_button, outlined_button }

class OtpTimerButtonFunction extends StatefulWidget {
  /// Called when the button is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// The button text
  final Text text;

  /// the loading indicator
  final ProgressIndicator? loadingIndicator;

  /// Length of the timer in second
  final int duration;

  /// Manual control button state [ButtonState]
  ///
  /// When controller is not null auto start timer is disabled on pressed button
  final OtpTimerButtonFunctionController? controller;

  /// Height of the button
  final double? height;

  /// Background color of the button
  final Color? backgroundColor;

  /// Color of the text
  final Color? textColor;

  /// Color of the loading indicator
  final Color? loadingIndicatorColor;

  /// Button type
  /// elevated_button, text_button, outlined_button [ButtonType]
  final ButtonType buttonType;

  /// The radius of the button border
  final double? radius;

  const OtpTimerButtonFunction(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.loadingIndicator,
      required this.duration,
      this.controller,
      this.height,
      this.backgroundColor,
      this.textColor,
      this.loadingIndicatorColor,
      this.buttonType = ButtonType.elevated_button,
      this.radius})
      : super(key: key);

  @override
  _OtpTimerButtonFunctionState createState() => _OtpTimerButtonFunctionState();
}

class _OtpTimerButtonFunctionState extends State<OtpTimerButtonFunction> {
  Timer? _timer;
  int _counter = 0;
  ButtonState _state = ButtonState.timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
    widget.controller?._addListeners(_startTimer, _loading, _enableButton);
  }

  _startTimer() {
    _timer?.cancel();
    _state = ButtonState.timer;
    _counter = widget.duration;

    setState(() {});

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_counter == 0) {
          _state = ButtonState.enable_button;
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _counter--;
          });
        }
      },
    );
  }

  _loading() {
    _state = ButtonState.loading;
    setState(() {});
  }

  _enableButton() {
    _state = ButtonState.enable_button;
    setState(() {});
  }

  _childBuilder() {
    String getFormattedTime(int seconds) {
      Duration duration = Duration(seconds: seconds);
      if (duration.inHours > 0) {
        return '${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
      } else if (duration.inMinutes > 0) {
        return '${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
      } else {
        return duration.inSeconds.toString().padLeft(2, '0');
      }
    }

    switch (_state) {
      case ButtonState.enable_button:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.text,
          ],
        );
      case ButtonState.loading:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.text,
            const SizedBox(width: 10),
            SizedBox(
              width: 20,
              height: 20,
              child: widget.loadingIndicator ??
                  CircularProgressIndicator(
                    strokeWidth: 2,
                    color: widget.loadingIndicatorColor,
                  ),
            ),
          ],
        );
      case ButtonState.timer:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const CupertinoActivityIndicator(),
            const SizedBox(width: 10),
            const Text(
              "Kirim Ulang",
              style: TextStyle(color: Colors.black54, fontSize: 15),
            ),
            const SizedBox(width: 10),
            Text(
              getFormattedTime(_counter),
              style: const TextStyle(color: Colors.black54),
              // widget.text.style,
            ),
          ],
        );
      case ButtonState.pressed:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const CupertinoActivityIndicator(),
            const SizedBox(width: 10),
            const Text(
              "Kirim Ulang",
              style: TextStyle(color: Colors.black54, fontSize: 15),
            ),
            const SizedBox(width: 10),
            Text(
              getFormattedTime(_counter),
              style: const TextStyle(color: Colors.black54),
              // widget.text.style,
            ),
          ],
        );
    }
  }

  _roundedRectangleBorder() {
    if (widget.radius != null) {
      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.radius!),
      );
    } else {
      return null;
    }
  }

  _onPressedButton() {
    if (widget.onPressed != null) {
      widget.onPressed!();
    }
    if (widget.controller == null) {
      _startTimer();
    }
    _state = ButtonState.pressed;
  }

  _buildButton() {
    switch (widget.buttonType) {
      case ButtonType.elevated_button:
        return ElevatedButton(
          onPressed:
              _state == ButtonState.enable_button ? _onPressedButton : null,
          child: _childBuilder(),
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.backgroundColor, // Hapus parameter primary
            // onPrimary: widget.textColor, // Hapus parameter onPrimary
            shape: _roundedRectangleBorder(),
          ),
        );
      case ButtonType.text_button:
        return TextButton(
          onPressed:
              _state == ButtonState.enable_button ? _onPressedButton : null,
          child: _childBuilder(),
          style: TextButton.styleFrom(
            // primary: widget.backgroundColor, // Hapus parameter primary
            shape: _roundedRectangleBorder(),
          ),
        );
      case ButtonType.outlined_button:
        return OutlinedButton(
          onPressed:
              _state == ButtonState.enable_button ? _onPressedButton : null,
          child: _childBuilder(),
          style: OutlinedButton.styleFrom(
            // primary: widget.backgroundColor, // Hapus parameter primary
            shape: _roundedRectangleBorder(),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: _buildButton(),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

class OtpTimerButtonFunctionController {
  late VoidCallback _startTimerListener;
  late VoidCallback _loadingListener;
  late VoidCallback _enableButtonListener;

  _addListeners(startTimerListener, loadingListener, enableButtonListener) {
    _startTimerListener = startTimerListener;
    _loadingListener = loadingListener;
    _enableButtonListener = enableButtonListener;
  }

  /// Notify listener to start the timer
  startTimer() {
    _startTimerListener();
  }

  /// Notify listener to show loading
  loading() {
    _loadingListener();
  }

  /// Notify listener to enable button
  enableButton() {
    _enableButtonListener();
  }
}
