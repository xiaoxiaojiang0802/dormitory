package com.cdmzl.web.controller.study;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cdmzl.common.core.controller.BaseController;
import com.cdmzl.common.core.domain.R;
import com.cdmzl.common.utils.poi.ExcelUtil;
import com.cdmzl.system.entity.SchQuestion;
import com.cdmzl.system.service.SchQuestionService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 题目Controller
 *

 * @date 2023-04-21
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/study/question" )
public class SchQuestionController extends BaseController {

    private final  SchQuestionService schQuestionService;

    /**
     * 查询题目列表
     */
    @GetMapping("/page" )
    public R page(Page page,SchQuestion schQuestion) {
        return R.ok(schQuestionService.page(page, Wrappers.query(schQuestion)));
    }

    /**
     * 导出题目列表
     */
    @PostMapping("/export" )
    public void export(HttpServletResponse response, SchQuestion schQuestion) {
        List<SchQuestion> list = schQuestionService.list(Wrappers.query(schQuestion));
        ExcelUtil<SchQuestion> util = new ExcelUtil<SchQuestion>(SchQuestion. class);
        util.exportExcel(response, list, "题目数据" );
    }

    /**
     * 获取题目详细信息
     */
    @GetMapping(value = "getById/{id}" )
    public R getById(@PathVariable("id" ) Long id) {
        return R.ok(schQuestionService.getById(id));
    }

    /**
     * 新增题目
     */
    @PostMapping
    public R add(@RequestBody SchQuestion schQuestion) {
        return R.ok(schQuestionService.save(schQuestion));
    }

    /**
     * 修改题目
     */
    @PutMapping
    public R edit(@RequestBody SchQuestion schQuestion) {
        return R.ok(schQuestionService.updateById(schQuestion));
    }

    /**
     * 删除题目
     */
    @DeleteMapping("/removeByIds/{ids}" )
    public R removeByIds(@PathVariable("ids" ) List<Long> ids) {
        return R.ok(schQuestionService.removeByIds(ids));
    }
}
