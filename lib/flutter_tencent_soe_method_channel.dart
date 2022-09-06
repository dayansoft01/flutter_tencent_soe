import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_tencent_soe_platform_interface.dart';

/// An implementation of [FlutterTencentSoePlatform] that uses method channels.
class MethodChannelFlutterTencentSoe extends FlutterTencentSoePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_tencent_soe');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future start() async{
    await methodChannel.invokeMethod('start');
  }

  @override
  Future stop() async {
    await methodChannel.invokeMethod('stop');
  }
}
