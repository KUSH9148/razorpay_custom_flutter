
import 'dart:async';

import 'package:flutter/services.dart';

class IphFlutter {
  static const MethodChannel _channel =
      const MethodChannel('iph_flutter');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
