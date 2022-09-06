import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_tencent_soe/flutter_tencent_soe.dart';
import 'package:flutter_tencent_soe/tai-oral-evaluation-ret.dart';
import 'package:flutter_tencent_soe/tai-oral-evaluation-eval-mode.dart';
import 'package:record/record.dart';

void main() {
  FlutterTencentSoe.initialize(
      appId: '1300525458',
      secretId: 'AKIDjAUr4HpCzOOl06yHF91qUzMbEh1Je8YP',
      secretKey: 'ueFh1gFl9QH1cAbwEQRH5qgOwM8mKl3g');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _flutterTencentSoePlugin = FlutterTencentSoe();
  bool recording = false;
  final record = Record();
  String ret = '';

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Row(
          children: [
            Expanded(
              child: Text(ret),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.keyboard_voice),
          onPressed: () async {
            if (recording) {
              recording = false;
              var r = await _flutterTencentSoePlugin.stop();
              ret = json.encode(r.toJson());
              setState(() {});
              return;
            }
            if (await record.hasPermission()) {
              _flutterTencentSoePlugin.start(
                taiOralEvaluationEvalMode: TAIOralEvaluationEvalMode.sentence,
                refText: 'how are you',
                scoreCoeff: 2.0,
              );
              recording = true;
            }
          },
        ),
      ),
    );
  }
}
