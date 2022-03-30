package com.ren.eduservice.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ren.commonutils.Result;
import com.ren.eduservice.entity.AclUser;
import com.ren.eduservice.entity.vo.CounselorQuery;
import com.ren.eduservice.entity.EduCounselor;
import com.ren.eduservice.service.AclUserService;
import com.ren.eduservice.service.EduCounselorService;
import com.ren.servicebase.exceptionhandler.ReclException;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;


import java.util.List;


/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author RZY
 * @since 2021-07-10
 */

@Api(tags = "后台咨询师管理")
@RestController
@RequestMapping("/eduservice/edu-counselor")
public class EduCounselorController {

    @Autowired
    EduCounselorService counselorService;

    @Autowired
    AclUserService aclUserService;

    /**
     * 心理咨询师信息分页及条件查询
     *
     * @param current        当前查询页数
     * @param limit          查询记录数
     * @param counselorQuery 条件查询封装结果集
     * @return
     */
    @ApiOperation(value = "咨询师信息分页及条件查询")
    @PostMapping("/pageCounselorFactor/{current}/{limit}")
    public Result pageCounselorFactor(@PathVariable long current, @PathVariable long limit,
                                      @RequestBody(required = false) CounselorQuery counselorQuery) {

        Page<EduCounselor> counselorPage = new Page<>(current, limit);
        //查询条件wapper构建
        QueryWrapper<EduCounselor> wrapper = new QueryWrapper<>();
        String name = counselorQuery.getName();
        Integer level = counselorQuery.getLevel();
        String start = counselorQuery.getStart();
        String end = counselorQuery.getEnd();

        if (!StringUtils.isEmpty(name)) wrapper.like("name", name);

        if (!StringUtils.isEmpty(level)) wrapper.like("level", level);

        if (!StringUtils.isEmpty(start)) wrapper.ge("gmt_create", start);

        if (!StringUtils.isEmpty(end)) wrapper.le("gmt_create", end);

        counselorService.page(counselorPage, wrapper);
        long total = counselorPage.getTotal();
        List<EduCounselor> records = counselorPage.getRecords();
        return Result.ok()
                .data("total", total)
                .data("rows", records);
    }

    /**
     * 查询所有咨询师信息
     *
     * @return
     */
    @ApiOperation(value = "咨询师信息查询")
    @Cacheable(key = "'findAllCounselor'", value = "allCounselor")
    @GetMapping("/findAll")
    public Result findAllCounselor() {

        List<EduCounselor> counselors = counselorService.list(null);
        return Result.ok()
                .data("items", counselors);
    }

    /**
     * 删除咨询师个人信息
     *
     * @param id 咨询师唯一id
     * @return
     */
    @ApiOperation(value = "咨询师信息删除")
    @DeleteMapping("/{id}")
    @Transactional(rollbackFor = Exception.class)
    public Result removeCounselors(@PathVariable String id) {

        try {
            EduCounselor counselor = counselorService.getOne(new QueryWrapper<EduCounselor>().select("user_id").eq("id", id));
            aclUserService.removeById(counselor.getUserId());
            counselorService.removeById(id);
        } catch (Exception e) {
            throw new ReclException(20001, "删除失败");
        }
        return Result.ok();
    }

    /**
     * 咨询师信息分页查询
     *
     * @param current 当前页数
     * @param limit   查询记录条数
     * @return
     */
    @ApiOperation(value = "咨询师信息分页")
    @GetMapping("/pageCounselor/{current}/{limit}")
    public Result pageListCounselors(@PathVariable long current, @PathVariable long limit) {

        Page<EduCounselor> counselorPage = new Page<>(current, limit);
        counselorService.page(counselorPage, null);
        long total = counselorPage.getTotal();
        List<EduCounselor> records = counselorPage.getRecords();
        return Result.ok()
                .data("total", total)
                .data("rows", records);
    }


    /**
     * 咨询师信息添加
     *
     * @param counselor 封装客户端上传的咨询师信息
     * @return
     */
    @ApiOperation(value = "咨询师信息添加")
    @PostMapping("/addCounselor")
    @Transactional(rollbackFor = Exception.class)
    public Result addCounselor(@RequestBody EduCounselor counselor) {

        try {
            AclUser user = new AclUser();
            user.setAvatar(counselor.getAvatar());
            user.setNickName(counselor.getName());
            user.setPassword("rzy123");
            user.setUsername(counselor.getMobile());
            aclUserService.save(user);
            counselorService.save(counselor);
        } catch (Exception e) {
            throw new ReclException(20001, "添加失败");
        }
        return Result.ok();
    }

    /**
     * 查询单个咨询师信息
     *
     * @param id 咨询师唯一id
     * @return
     */
    @ApiOperation(value = "ID查询")
    @GetMapping("/getCounselor/{id}")
    public Result getCounselorById(@PathVariable String id) {

        EduCounselor counselor = counselorService.getById(id);
        return Result.ok()
                .data("counselor", counselor);
    }

    /**
     * 咨询师信息修改
     *
     * @param eduCounselor 封装修改的咨询师信息
     * @return
     */
    @ApiOperation(value = "信息修改")
    @PostMapping("/updateCounselor")
    public Result updateCounselor(@RequestBody EduCounselor eduCounselor) {

        boolean flag = counselorService.updateById(eduCounselor);
        if (flag) {

            return Result.ok();
        } else {

            return Result.error();
        }
    }
}

