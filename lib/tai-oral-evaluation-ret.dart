class TAIOralEvaluationRet {
  double? pronAccuracy;
  double? pronFluency;
  double? pronCompletion;
  double? suggestedScore;

  TAIOralEvaluationRet(
      {this.pronAccuracy,
      this.pronFluency,
      this.pronCompletion,
      this.suggestedScore});

  TAIOralEvaluationRet.fromJson(Map<String, dynamic> json) {
    pronAccuracy = json['PronAccuracy'];
    pronFluency = json['PronFluency'];
    pronCompletion = json['PronCompletion'];
    suggestedScore = json['SuggestedScore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pronAccuracy'] = pronAccuracy;
    data['pronFluency'] = pronFluency;
    data['pronCompletion'] = pronCompletion;
    data['suggestedScore'] = suggestedScore;
    return data;
  }
}
