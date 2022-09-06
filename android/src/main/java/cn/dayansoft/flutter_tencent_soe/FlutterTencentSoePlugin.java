package cn.dayansoft.flutter_tencent_soe;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;


import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Environment;
import android.text.TextUtils;
import android.view.View;

import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

import com.google.gson.Gson;
import com.tencent.taisdk.TAIErrCode;
import com.tencent.taisdk.TAIError;
import com.tencent.taisdk.TAIOralEvaluation;
import com.tencent.taisdk.TAIOralEvaluationCallback;
import com.tencent.taisdk.TAIOralEvaluationData;
import com.tencent.taisdk.TAIOralEvaluationEvalMode;
import com.tencent.taisdk.TAIOralEvaluationFileType;
import com.tencent.taisdk.TAIOralEvaluationListener;
import com.tencent.taisdk.TAIOralEvaluationParam;
import com.tencent.taisdk.TAIOralEvaluationRet;
import com.tencent.taisdk.TAIOralEvaluationServerType;
import com.tencent.taisdk.TAIOralEvaluationStorageMode;
import com.tencent.taisdk.TAIOralEvaluationTextMode;
import com.tencent.taisdk.TAIOralEvaluationWorkMode;
import com.tencent.taisdk.TAIRecorderParam;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * FlutterTencentSoePlugin
 */
public class FlutterTencentSoePlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private MethodChannel channel;

    private static Context _context;
    private Activity activity;

    private TAIOralEvaluation oral = new TAIOralEvaluation();
    private Result result;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_tencent_soe");
        channel.setMethodCallHandler(this);

        this.oral.setListener(new TAIOralEvaluationListener() {

            @Override
            public void onEvaluationData(TAIOralEvaluationData taiOralEvaluationData, TAIOralEvaluationRet taiOralEvaluationRet) {
                Gson gson = new Gson();
                String retString = gson.toJson(result);
            }

            @Override
            public void onEvaluationError(TAIOralEvaluationData taiOralEvaluationData, TAIError taiError) {
                Gson gson = new Gson();
                String retString = gson.toJson(taiError);
            }

            @Override
            public void onFinalEvaluationData(TAIOralEvaluationData taiOralEvaluationData, TAIOralEvaluationRet taiOralEvaluationRet) {

            }

            @Override
            public void onEndOfSpeech(boolean b) {

            }

            @Override
            public void onVolumeChanged(int i) {

            }
        });
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        this.result = result;
        if (call.method.equals("record")) {
            onRecord(call, result);
        } else if (call.method.equals("stop")) {
            onStop(call, result);
        } else {
            result.notImplemented();
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        activity = binding.getActivity();
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {

    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {

    }

    @Override
    public void onDetachedFromActivity() {

    }


    public void onStop(final MethodCall call, final Result result) {
        this.oral.stopRecordAndEvaluation();
    }

    public void onRecord(final MethodCall call, final Result result) {
//在开始调用`startRecordAndEvaluation`前设置录制参数
        TAIRecorderParam recordParam = new TAIRecorderParam();
        recordParam.fragSize = 1024;
        recordParam.fragEnable = true;
        recordParam.vadEnable = true;
        recordParam.vadInterval = 5000;
        this.oral.setRecorderParam(recordParam);


        //初始化参数
        TAIOralEvaluationParam param = new TAIOralEvaluationParam();
        param.context = activity;
        param.appId = "";
        param.sessionId = UUID.randomUUID().toString();
        param.workMode = TAIOralEvaluationWorkMode.ONCE;
        param.evalMode = TAIOralEvaluationEvalMode.SENTENCE;
        param.storageMode = TAIOralEvaluationStorageMode.DISABLE;
        param.serverType = TAIOralEvaluationServerType.ENGLISH;
        param.fileType = TAIOralEvaluationFileType.MP3;
        param.scoreCoeff = 1.0;
        param.refText = "";
        param.secretId = "";
        param.secretKey = "";
        param.token = "";

        //开始录制
        this.oral.startRecordAndEvaluation(param);
    }

}
