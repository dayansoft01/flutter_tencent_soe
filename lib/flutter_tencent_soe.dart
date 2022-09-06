import 'flutter_tencent_soe_platform_interface.dart';
import 'tai-oral-evaluation-ret.dart';

class FlutterTencentSoe {
  static String? _appId;
  static String? _secretId;
  static String? _secretKey;

  static void initialize({
    required String appId,
    required String secretId,
    required String secretKey,
  }) {
    _appId = appId;
    _secretId = secretId;
    _secretKey = secretKey;
  }

  //taiOralEvaluationEvalMode:见TAIOralEvaluationEvalMode类
  Future start({
    required int taiOralEvaluationEvalMode,
    required String refText,
    required double scoreCoeff,
  }) async {
    await FlutterTencentSoePlatform.instance.start(
        appId: _appId ?? '',
        secretId: _secretId ?? '',
        secretKey: _secretKey ?? '',
        taiOralEvaluationEvalMode: taiOralEvaluationEvalMode,
        refText: refText,
        scoreCoeff: scoreCoeff);
  }

  Future<TAIOralEvaluationRet> stop() async {
    return await FlutterTencentSoePlatform.instance.stop();
  }
}
