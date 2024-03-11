import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store/app.dart';
import 'package:store/utils/device/devices_utility.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  TDeviceUtils.setPreferredOrientation([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}
