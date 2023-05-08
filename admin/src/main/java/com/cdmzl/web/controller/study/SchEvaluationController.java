package com.cdmzl.web.controller.study;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.cdmzl.common.core.controller.BaseController;
import com.cdmzl.common.core.domain.R;
import com.cdmzl.common.utils.poi.ExcelUtil;
import com.cdmzl.system.entity.SchEvaluation;
import com.cdmzl.system.service.SchEvaluationService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 评价Controller
 *

 * @date 2023-04-21
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/study/evaluation" )
public class SchEvaluationController extends BaseController {

    private final  SchEvaluationService schEvaluationService;

    /**
     * 查询评价列表
     */
    @GetMapping("/page" )

    /**
     * 导出评价列表
     */
    @PostMapping("/export" )
    public void export(HttpServletResponse response, SchEvaluation schEvaluation) {
        List<SchEvaluation> list = schEvaluationService.list(Wrappers.query(schEvaluation));
        ExcelUtil<SchEvaluation> util = new ExcelUtil<SchEvaluation>(SchEvaluation. class);
        util.exportExcel(response, list, "评价数据" );
    }

    /**
     * 获取评价详细信息
     */
    @GetMapping(value = "getById/{id}" )
    public R getById(@PathVariable("id" ) Long id) {
        return R.ok(schEvaluationService.getById(id));
    }

    /**
     * 新增评价
     */
    @PostMapping
    public R add(@RequestBody SchEvaluation schEvaluation) {
        return R.ok(schEvaluationService.save(schEvaluation));
    }

    /**
     * 修改评价
     */
    @PutMapping
    public R edit(@RequestBody SchEvaluation schEvaluation) {
        return R.ok(schEvaluationService.updateById(schEvaluation));
    }

    /**
     * 删除评价
     */
    @DeleteMapping("/removeByIds/{ids}" )
    public R removeByIds(@PathVariable("ids" ) List<Long> ids) {
        return R.ok(schEvaluationService.removeByIds(ids));
    }
}
