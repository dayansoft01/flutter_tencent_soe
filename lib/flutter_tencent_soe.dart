
import 'flutter_tencent_soe_platform_interface.dart';

class FlutterTencentSoe {
  Future<String?> getPlatformVersion() {
    return FlutterTencentSoePlatform.instance.getPlatformVersion();
  }

  Future<String?> start() async{
    return await  FlutterTencentSoePlatform.instance.start();
  }

  Future<String?> stop()async{
    return await  FlutterTencentSoePlatform.instance.stop();
  }
}
