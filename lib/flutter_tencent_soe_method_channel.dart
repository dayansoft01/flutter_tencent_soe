import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_tencent_soe_platform_interface.dart';
import 'tai-oral-evaluation-ret.dart';
import 'dart:convert';

/// An implementation of [FlutterTencentSoePlatform] that uses method channels.
class MethodChannelFlutterTencentSoe extends FlutterTencentSoePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_tencent_soe');

  @override
  Future start(
      {required String appId,
      required String secretId,
      required String secretKey,
      required int taiOralEvaluationEvalMode,
      required String refText,
      required double scoreCoeff}) async {
    await methodChannel.invokeMethod<String>('start', <String, dynamic>{
      "appId": appId,
      "secretId": secretId,
      "secretKey": secretKey,
      "taiOralEvaluationEvalMode": taiOralEvaluationEvalMode,
      "refText": refText,
      "scoreCoeff": scoreCoeff
    });
  }

  @override
  Future<TAIOralEvaluationRet> stop() async {
    var map = Map<String, dynamic>.from(
        await methodChannel.invokeMethod<dynamic>('stop'));
    var ret =
        TAIOralEvaluationRet.fromJson(json.decode(map!['resultJsonText']));
    ret.audio = map['audio'];
    return ret;
  }

  @override
  Future<bool> isRecording() async {
    return (await methodChannel.invokeMethod<bool>('isRecording'))!;
  }
}
