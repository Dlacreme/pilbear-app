import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pilbear_app/theme.dart';

class SpinnerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitWave(
      color: PilbearColors.primaryColor,
      size: 24,
    );
  }
}

class BigSpinnerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitWave(
      color: PilbearColors.primaryColor,
      size: 34,
    );
  }
}
