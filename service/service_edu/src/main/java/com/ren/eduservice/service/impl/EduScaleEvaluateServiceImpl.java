package com.ren.eduservice.service.impl;

import com.ren.eduservice.entity.EduScaleEvaluate;
import com.ren.eduservice.entity.vo.ScaleEvaluateVo;
import com.ren.eduservice.mapper.EduScaleEvaluateMapper;
import com.ren.eduservice.service.EduScaleEvaluateService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author testjava
 * @since 2021-09-30
 */
@Service
public class EduScaleEvaluateServiceImpl extends ServiceImpl<EduScaleEvaluateMapper, EduScaleEvaluate> implements EduScaleEvaluateService {

    @Override
    public ScaleEvaluateVo getScaleEvaluate(String scaleId) {

        ScaleEvaluateVo scaleEvaluate = this.baseMapper.getScaleEvaluate(scaleId);
        if (scaleEvaluate == null) {

            scaleEvaluate = new ScaleEvaluateVo();
            scaleEvaluate.setUnderstandAbility(BigDecimal.valueOf(0));
            scaleEvaluate.setPracticeAbility(BigDecimal.valueOf(0));
            scaleEvaluate.setAccuracyAbility(BigDecimal.valueOf(0));
        }


        return scaleEvaluate;
    }
}
