package cn.dayansoft.flutter_tencent_soe;

public class RecordInput {
    private String appId;
    private String secretId;
    private String secretKey;
    private int taiOralEvaluationEvalMode;
    private String refText;
    private double scoreCoeff;

    public String getAppId() {
        return appId;
    }

    public void setAppId(String appId) {
        this.appId = appId;
    }

    public String getSecretId() {
        return secretId;
    }

    public void setSecretId(String secretId) {
        this.secretId = secretId;
    }

    public String getSecretKey() {
        return secretKey;
    }

    public void setSecretKey(String secretKey) {
        this.secretKey = secretKey;
    }

    public int getTaiOralEvaluationEvalMode() {
        return taiOralEvaluationEvalMode;
    }

    public void setTaiOralEvaluationEvalMode(int taiOralEvaluationEvalMode) {
        this.taiOralEvaluationEvalMode = taiOralEvaluationEvalMode;
    }

    public String getRefText() {
        return refText;
    }

    public void setRefText(String refText) {
        this.refText = refText;
    }


    public double getScoreCoeff() {
        return scoreCoeff;
    }

    public void setScoreCoeff(double scoreCoeff) {
        this.scoreCoeff = scoreCoeff;
    }
}
