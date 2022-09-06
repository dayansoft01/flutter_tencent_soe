import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tencent_soe/flutter_tencent_soe_method_channel.dart';

void main() {
  MethodChannelFlutterTencentSoe platform = MethodChannelFlutterTencentSoe();
  const MethodChannel channel = MethodChannel('flutter_tencent_soe');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
