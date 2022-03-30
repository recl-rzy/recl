package com.ren.eduservice.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ren.commonutils.Result;
import com.ren.eduservice.entity.AclUser;
import com.ren.eduservice.entity.EduListener;
import com.ren.eduservice.entity.vo.ListenerQuery;
import com.ren.eduservice.service.AclUserService;
import com.ren.eduservice.service.EduListenerService;
import com.ren.servicebase.exceptionhandler.ReclException;
import io.swagger.annotations.Api;
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
 * @since 2021-09-25
 */

@Api(tags = "后台倾听师管理")
@RestController
@RequestMapping("/eduservice/edu-listener")
public class EduListenerController {


    @Autowired
    private EduListenerService eduListenerService;

    @Autowired
    private AclUserService aclUserService;

    @Cacheable(key = "'getAllListener'", value = "allListener")
    @GetMapping("/getAllListener")
    public Result getAllListener() {
        List<EduListener> listeners = eduListenerService.list(null);
        return Result.ok()
                .data("listeners", listeners);
    }

    @GetMapping("/getListener/{id}")
    public Result getListener(@PathVariable String id) {
        EduListener listener = eduListenerService.getById(id);
        return Result.ok()
                .data("listener", listener);
    }

    @DeleteMapping("/{id}")
    @Transactional(rollbackFor = Exception.class)
    public Result delListener(@PathVariable String id) {

        try {
            EduListener listener = eduListenerService.getOne(new QueryWrapper<EduListener>().select("user_id").eq("id", id));
            aclUserService.removeById(listener.getUserId());
            eduListenerService.removeById(id);
        } catch (Exception e) {
            throw new ReclException(20001, "删除失败");
        }
        return Result.ok();
    }

    @PostMapping("/addListener")
    @Transactional(rollbackFor = Exception.class)
    public Result addListener(@RequestBody EduListener listener) {

        try {
            AclUser user = new AclUser();
            user.setAvatar(listener.getAvatar());
            user.setNickName(listener.getName());
            user.setPassword("rzy123");
            user.setUsername(listener.getMobile());
            aclUserService.save(user);
            eduListenerService.save(listener);
        } catch (Exception e) {
            throw new ReclException(20001, "添加失败");
        }
        return Result.ok();
    }

    @PostMapping("/updateListener")
    public Result updateListener(@RequestBody EduListener eduListener) {
        boolean flag = eduListenerService.updateById(eduListener);
        if (flag) {
            return Result.ok();
        } else {
            return Result.error();
        }
    }

    @GetMapping("/pageListener/{current}/{limit}")
    public Result pageListListeners(@PathVariable long current, @PathVariable long limit) {
        Page<EduListener> listenerPage = new Page<>();
        eduListenerService.page(listenerPage, null);
        long total = listenerPage.getTotal();
        List<EduListener> records = listenerPage.getRecords();
        return Result.ok()
                .data("total", total)
                .data("rows", records);
    }

    @PostMapping("/pageListenerFactor/{current}/{limit}")
    public Result pageListenerFactor(@PathVariable long current, @PathVariable long limit,
                                     @RequestBody(required = false) ListenerQuery listenerQuery) {
        Page<EduListener> listenerPage = new Page<>();
        QueryWrapper<EduListener> wrapper = new QueryWrapper<>();

        String name = listenerQuery.getName();
        Integer level = listenerQuery.getLevel();
        String oneClassify = listenerQuery.getOneClassify();
        String twoClassify = listenerQuery.getTwoClassify();
        String start = listenerQuery.getStart();
        String end = listenerQuery.getEnd();

        if (!StringUtils.isEmpty(name)) wrapper.like("name", name);

        if (!StringUtils.isEmpty(level)) wrapper.eq("level", level);

        if (!StringUtils.isEmpty(oneClassify)) wrapper.eq("one_classify", oneClassify);

        if (!StringUtils.isEmpty(twoClassify)) wrapper.eq("two_classify", twoClassify);

        if (!StringUtils.isEmpty(start))  wrapper.ge("gmt_create", start);

        if (!StringUtils.isEmpty(end)) wrapper.le("gmt_create", end);

        eduListenerService.page(listenerPage, wrapper);
        long total = listenerPage.getTotal();
        List<EduListener> records = listenerPage.getRecords();
        return Result.ok()
                .data("total", total)
                .data("rows", records);
    }

    @GetMapping("/getClassify")
    public Result getClassify() {

        List<EduListener> oneClassify = eduListenerService.list(new QueryWrapper<EduListener>().select("DISTINCT one_classify"));
        List<EduListener> twoClassify = eduListenerService.list(new QueryWrapper<EduListener>().select("DISTINCT two_classify"));
        return Result.ok()
                .data("oneClassify", oneClassify)
                .data("twoClassify", twoClassify);
    }

}

