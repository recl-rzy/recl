package com.ren.eduservice.service;


import java.util.List;

public interface EvaluationAlgorithmService {

    List<String> RoughConvertMethod(String scaleId, String userId, List<String> scaleResult);

    List<String> JudgeFactorsMethod(String scaleId, String userId, List<String> scaleResult);


}
