package com.ren.eduservice.entity.vo;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigDecimal;

/**
 * @Description: TODO
 * @ClassName: ScaleQuery
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/3/1 17:01
 * @Vertion: 2019.1
 */

@Data
public class ScaleQuery {

    @ApiModelProperty(value = "量表发布咨询师Id")
    String counselorId;

    @ApiModelProperty(value = "测试量表二级分类的唯一id")
    private String classifyId;

    @ApiModelProperty(value = "测试量表一级分类的唯一id")
    private String classifyParentId;

    @ApiModelProperty(value = "测试量表标题")
    private String title;

    @ApiModelProperty(value = "量表测试所需费用")
    private BigDecimal price;

    @ApiModelProperty(value = "量表购买数量")
    private Long buyCount;

    @ApiModelProperty(value = "浏览量")
    private Long viewCount;

    @ApiModelProperty(value = "量表发布情况（Draft代表未发布，Normal代表已发布）")
    private String status;

    @ApiModelProperty(value = "创建时间")
    String gmtCreate;

    @ApiModelProperty(value = "修改时间")
    String gmtModified;
}

