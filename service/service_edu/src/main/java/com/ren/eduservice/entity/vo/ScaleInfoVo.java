package com.ren.eduservice.entity.vo;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @Description: TODO
 * @ClassName: ScaleInfoVo
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/8/11 08:29
 * @Vertion: 2019.1
 */
@Data
public class ScaleInfoVo {

    @ApiModelProperty(value = "心理测试量表唯一id")
    private String id;

    @ApiModelProperty(value = "发布相关测试的用户唯一id")
    private String userId;

    @ApiModelProperty(value = "量表发布咨询师Name")
    String counselorName;

    @ApiModelProperty(value = "测试量表一级分类的标题")
    private String oneClassify;

    @ApiModelProperty(value = "测试量表二级分类的标题")
    private String twoClassify;

    @ApiModelProperty(value = "测试量表标题")
    private String title;

    @ApiModelProperty(value = "量表测试所需费用")
    private BigDecimal price;

    @ApiModelProperty(value = "量表购买数量")
    private Long buyCount;

    @ApiModelProperty(value = "浏览量")
    private Long viewCount;

    @ApiModelProperty(value = "测试量表封面图片路径")
    private String cover;

    @ApiModelProperty(value = "量表发布情况（Draft代表未发布，Normal代表已发布）")
    private String status;

    @ApiModelProperty(value = "量表描述")
    private String description;

    @ApiModelProperty(value = "创建时间")
    private Date gmtCreate;

    @ApiModelProperty(value = "更新时间")
    private Date gmtModified;
}

