
import 'flutter_tencent_soe_platform_interface.dart';

class FlutterTencentSoe {
  Future<String?> getPlatformVersion() {
    return FlutterTencentSoePlatform.instance.getPlatformVersion();
  }
}
