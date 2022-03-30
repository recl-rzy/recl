package com.ren.eduservice.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ren.eduservice.entity.DocScale;
import com.ren.eduservice.entity.EduScaleAppraisal;
import com.ren.eduservice.entity.EduScaleSubject;
import com.ren.eduservice.service.*;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description: TODO
 * @ClassName: EvaluationAlgorithmServiceImpl
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/10/6 17:06
 * @Vertion: 2019.1
 */

@Service
public class EvaluationAlgorithmServiceImpl implements EvaluationAlgorithmService {

    @Autowired
    EduScaleService eduScaleService;

    @Autowired
    DocScaleService docScaleService;

    @Autowired
    EduScaleSubjectService eduScaleSubjectService;

    @Autowired
    EduScaleAppraisalService eduScaleAppraisalService;

    //TODO 粗分转换法（根据不同维度分组求和，将粗分转为标准分得评估结果）
    @Override
    public List<String> RoughConvertMethod(String scaleId, String userId, List<String> scaleResult) {

        DocScale docScale = new DocScale();
        docScale.setUserId(userId);
        docScale.setScaleId(scaleId);

        List<String> appraisalResult = new ArrayList<>();

        //按题目维度进行分组求和
        Map<String, BigDecimal> scaleResultMap = new HashMap<>();
        for (String s : scaleResult) {

            String[] splitResult = s.split("-");
            if (scaleResultMap.get(splitResult[0]) == null) {

                scaleResultMap.put(splitResult[0], new BigDecimal(splitResult[1]));
            } else {

                BigDecimal oldValue = scaleResultMap.get(splitResult[0]);
                scaleResultMap.put(splitResult[0], oldValue.add(new BigDecimal(splitResult[1])));
            }
        }

        //查询量表评估规则
        QueryWrapper<EduScaleAppraisal> wrapper = new QueryWrapper<>();
        wrapper.eq("scale_id", scaleId);
        List<EduScaleAppraisal> appraisals = eduScaleAppraisalService.list(wrapper);

        //评估结果生成
        for (EduScaleAppraisal appraisal : appraisals) {

            for (Map.Entry<String, BigDecimal> entry : scaleResultMap.entrySet()) {

                if (appraisal.getDimension().equals(entry.getKey())) {

                    //粗总分转为标准分（标准分 = 粗总分 * 转换系数）
                    BigDecimal standardScore = appraisal.getCoefficient().multiply(entry.getValue());

                    if (standardScore.compareTo(appraisal.getLowerLimit()) > -1 && standardScore.compareTo(appraisal.getUpperLimit()) < 1) {

                        appraisalResult.add(appraisal.getAppraisalResult());

                        if(appraisal.getWarningLevel() != null) {

                            docScale.setWarningLevel(appraisal.getWarningLevel());
                            docScale.setAppraisalResult(appraisal.getAppraisalResult());
                            docScaleService.save(docScale);
                        }
                    }
                }
            }
        }
        System.out.println(appraisalResult);

        return appraisalResult;
    }

    //TODO 判定因子评估法（将测伪尺度、必要因子、模糊因子、粗分作为评估标准）
    @Override
    public List<String> JudgeFactorsMethod(String scaleId, String userId, List<String> scaleResult) {

        DocScale docScale = new DocScale();
        docScale.setUserId(userId);
        docScale.setScaleId(scaleId);

        List<String> appraisalResult = new ArrayList<>();

        // 查询题目信息进行粗分计算
        QueryWrapper<EduScaleSubject> subjectWrapper = new QueryWrapper<>();
        subjectWrapper.eq("scale_id", scaleId);
        subjectWrapper.orderByAsc("subject_sort");
        List<EduScaleSubject> subjects = eduScaleSubjectService.list(subjectWrapper);


        //查询评估规则（评估规则按评估优先级进行排序,由高级到低级评估）
        QueryWrapper<EduScaleAppraisal> appraisalWrapper = new QueryWrapper<>();
        appraisalWrapper.eq("scale_id", scaleId);
        appraisalWrapper.orderByAsc("appraisal_priority");
        List<EduScaleAppraisal> appraisals = eduScaleAppraisalService.list(appraisalWrapper);


        BigDecimal totalScore = new BigDecimal("0");    //粗分计分
        BigDecimal pseudoScore = new BigDecimal("0");   //测伪尺度计分
        BigDecimal vagueScore = new BigDecimal("0");    //模糊因子计分
        BigDecimal auxiliaryScore = new BigDecimal("0");    //模糊因子计分
        BigDecimal essentialScore = new BigDecimal("0"); //必要因子计分
        String[] splitResult = null;   //测试结果分割(index = 0 , 代表测试项维度
        //index = 1 , 代表测试项分值 )
        //index = 2 , 代表测试项序号 )

        // 遍历测试结果并分割,进行测伪尺度、必要因子、模糊因子的计分操作
        for (int i = 0; i < scaleResult.size(); i++) {

            splitResult = scaleResult.get(i).split("-");

            if (subjects.get(i).getPseudoScaleMeasure()) {

                pseudoScore = pseudoScore.add(new BigDecimal(splitResult[1]));
            } else {

                if (subjects.get(i).getEssentialFactor()) {

                    essentialScore = essentialScore.add(new BigDecimal(splitResult[1]));
                    totalScore = totalScore.add(new BigDecimal(splitResult[1]));
                } else if (subjects.get(i).getAuxiliaryFactor()) {

                    auxiliaryScore = auxiliaryScore.add(new BigDecimal(splitResult[1]));
                } else if (subjects.get(i).getVagueFactor()) {

                    vagueScore = vagueScore.add(new BigDecimal(splitResult[1]));
                    totalScore = totalScore.add(new BigDecimal(splitResult[1]));
                } else {

                    totalScore = totalScore.add(new BigDecimal(splitResult[1]));
                }
            }
        }
        System.out.println(totalScore + ":总分");
        System.out.println(pseudoScore + ":测伪");
        System.out.println(vagueScore + ":模糊");
        System.out.println(essentialScore + ":必要");
        System.out.println(auxiliaryScore + ":辅助");

//        //查询评估记录中的测伪尺度项,测伪尺度分值上下限满足则返回结果
//        for (EduScaleAppraisal appraisal : appraisals) {
//
//            if(appraisal.getPseudoScaleAppraisal()) {
//
//                if(totalScore.compareTo(appraisal.getLowerLimit()) > -1
//                        && totalScore.compareTo(appraisal.getUpperLimit()) < 1
//                            && pseudoScore.compareTo(appraisal.getPseudoLower()) > -1
//                                && pseudoScore.compareTo(appraisal.getPseudoUpper()) < 1) {
//
//                    Math.min(tot)
//                } else if()
//            }
//        }

        for (EduScaleAppraisal appraisal : appraisals) {

            if (appraisal.getEssentialFactorAppraisal() && essentialScore.compareTo(appraisal.getLowerLimit()) > -1
                    && essentialScore.compareTo(appraisal.getUpperLimit()) < 1) {

                for (EduScaleAppraisal scaleAppraisal : appraisals) {

                    if (scaleAppraisal.getPseudoScaleAppraisal() && scaleAppraisal.getAppraisalPriority().equals(appraisal.getAppraisalPriority())) {

                        if (pseudoScore.compareTo(scaleAppraisal.getLowerLimit()) > -1 && pseudoScore.compareTo(scaleAppraisal.getUpperLimit()) < 1) {

                            appraisalResult.add(scaleAppraisal.getAppraisalResult());

                            if(scaleAppraisal.getWarningLevel() != null) {

                                docScale.setWarningLevel(scaleAppraisal.getWarningLevel());
                                docScale.setAppraisalResult(scaleAppraisal.getAppraisalResult());
                                docScaleService.save(docScale);
                            }
                            return appraisalResult;
                        }
                    }
                }

                if(appraisal.getWarningLevel() != null) {

                    docScale.setWarningLevel(appraisal.getWarningLevel());
                    docScale.setAppraisalResult(appraisal.getAppraisalResult());
                    docScaleService.save(docScale);
                }

                appraisalResult.add(appraisal.getAppraisalResult());
                return appraisalResult;
            }

            if (appraisal.getAuxiliaryFactorAppraisal() && auxiliaryScore.compareTo(appraisal.getLowerLimit()) > -1
                    && auxiliaryScore.compareTo(appraisal.getUpperLimit()) < 1) {

                for (EduScaleAppraisal scaleAppraisal : appraisals) {

                    if (scaleAppraisal.getPseudoScaleAppraisal() && scaleAppraisal.getAppraisalPriority().equals(appraisal.getAppraisalPriority())) {

                        if (pseudoScore.compareTo(scaleAppraisal.getLowerLimit()) > -1 && pseudoScore.compareTo(scaleAppraisal.getUpperLimit()) < 1) {

                            appraisalResult.add(scaleAppraisal.getAppraisalResult());

                            if(scaleAppraisal.getWarningLevel() != null) {

                                docScale.setWarningLevel(scaleAppraisal.getWarningLevel());
                                docScale.setAppraisalResult(scaleAppraisal.getAppraisalResult());
                                docScaleService.save(docScale);
                            }
                            return appraisalResult;
                        }
                    }
                }
                appraisalResult.add(appraisal.getAppraisalResult());

                if(appraisal.getWarningLevel() != null) {

                    docScale.setWarningLevel(appraisal.getWarningLevel());
                    docScale.setAppraisalResult(appraisal.getAppraisalResult());
                    docScaleService.save(docScale);
                }
                return appraisalResult;
            }

            if (appraisal.getVagueFactorAppraisal() && vagueScore.compareTo(appraisal.getLowerLimit()) > -1
                    && vagueScore.compareTo(appraisal.getUpperLimit()) < 1) {

                for (EduScaleAppraisal scaleAppraisal : appraisals) {

                    if (scaleAppraisal.getPseudoScaleAppraisal() && scaleAppraisal.getAppraisalPriority().equals(appraisal.getAppraisalPriority())) {

                        if (pseudoScore.compareTo(scaleAppraisal.getLowerLimit()) > -1 && pseudoScore.compareTo(scaleAppraisal.getUpperLimit()) < 1) {

                            appraisalResult.add(scaleAppraisal.getAppraisalResult());

                            if(scaleAppraisal.getWarningLevel() != null) {

                                docScale.setWarningLevel(scaleAppraisal.getWarningLevel());
                                docScale.setAppraisalResult(scaleAppraisal.getAppraisalResult());
                                docScaleService.save(docScale);
                            }
                            return appraisalResult;
                        }
                    }
                }

                if(appraisal.getWarningLevel() != null) {

                    docScale.setWarningLevel(appraisal.getWarningLevel());
                    docScale.setAppraisalResult(appraisal.getAppraisalResult());
                    docScaleService.save(docScale);
                }

                appraisalResult.add(appraisal.getAppraisalResult());
                return appraisalResult;
            }

            if (totalScore.compareTo(appraisal.getLowerLimit()) > -1
                    && totalScore.compareTo(appraisal.getUpperLimit()) < 1) {

                for (EduScaleAppraisal scaleAppraisal : appraisals) {

                    if (scaleAppraisal.getPseudoScaleAppraisal() && scaleAppraisal.getAppraisalPriority().equals(appraisal.getAppraisalPriority())) {

                        if (pseudoScore.compareTo(scaleAppraisal.getLowerLimit()) > -1 && pseudoScore.compareTo(scaleAppraisal.getUpperLimit()) < 1) {

                            appraisalResult.add(scaleAppraisal.getAppraisalResult());

                            if(scaleAppraisal.getWarningLevel() != null) {

                                docScale.setWarningLevel(scaleAppraisal.getWarningLevel());
                                docScale.setAppraisalResult(scaleAppraisal.getAppraisalResult());
                                docScaleService.save(docScale);
                            }

                            return appraisalResult;
                        }
                    }
                }
                appraisalResult.add(appraisal.getAppraisalResult());

                if(appraisal.getWarningLevel() != null) {

                    docScale.setWarningLevel(appraisal.getWarningLevel());
                    docScale.setAppraisalResult(appraisal.getAppraisalResult());
                    docScaleService.save(docScale);
                }

                return appraisalResult;
            }
        }

        if (appraisalResult == null) {

            docScale.setWarningLevel(0);
            docScale.setAppraisalResult("结果显示你很健康，请继续保持乐观心态，忆心与你同在");
            docScaleService.save(docScale);

            appraisalResult.add("结果显示你很健康，请继续保持乐观心态，忆心与你同在");
        }

        return appraisalResult;
    }

}

