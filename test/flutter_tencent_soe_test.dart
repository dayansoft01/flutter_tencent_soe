import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tencent_soe/flutter_tencent_soe.dart';
import 'package:flutter_tencent_soe/flutter_tencent_soe_platform_interface.dart';
import 'package:flutter_tencent_soe/flutter_tencent_soe_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterTencentSoePlatform 
    with MockPlatformInterfaceMixin
    implements FlutterTencentSoePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterTencentSoePlatform initialPlatform = FlutterTencentSoePlatform.instance;

  test('$MethodChannelFlutterTencentSoe is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterTencentSoe>());
  });

  test('getPlatformVersion', () async {
    FlutterTencentSoe flutterTencentSoePlugin = FlutterTencentSoe();
    MockFlutterTencentSoePlatform fakePlatform = MockFlutterTencentSoePlatform();
    FlutterTencentSoePlatform.instance = fakePlatform;
  
    expect(await flutterTencentSoePlugin.getPlatformVersion(), '42');
  });
}
