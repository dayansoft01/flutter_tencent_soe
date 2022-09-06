import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_tencent_soe_method_channel.dart';
import 'tai-oral-evaluation-ret.dart';

abstract class FlutterTencentSoePlatform extends PlatformInterface {
  /// Constructs a FlutterTencentSoePlatform.
  FlutterTencentSoePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterTencentSoePlatform _instance = MethodChannelFlutterTencentSoe();

  /// The default instance of [FlutterTencentSoePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterTencentSoe].
  static FlutterTencentSoePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterTencentSoePlatform] when
  /// they register themselves.
  static set instance(FlutterTencentSoePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future start({required String appId,
    required String secretId,
    required String secretKey,
    required int taiOralEvaluationEvalMode,
    required String refText,
    required double scoreCoeff}) {
    throw UnimplementedError('start() has not been implemented.');
  }

  Future<TAIOralEvaluationRet> stop() {
    throw UnimplementedError('stop() has not been implemented.');
  }

  Future<bool> isRecording() {
    throw UnimplementedError('isRecording() has not been implemented.');
  }
}
