import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget isLoadingWidget({color = Colors.blue}) {
  return SpinKitThreeBounce(
    color: color,
    size: 30,
  );
}
