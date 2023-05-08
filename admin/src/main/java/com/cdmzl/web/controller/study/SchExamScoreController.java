package com.cdmzl.web.controller.study;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.cdmzl.common.core.controller.BaseController;
import com.cdmzl.common.core.domain.R;
import com.cdmzl.common.utils.poi.ExcelUtil;
import com.cdmzl.system.entity.SchExamScore;
import com.cdmzl.system.service.SchExamScoreService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 考试成绩Controller
 *

 * @date 2023-04-21
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/study/score" )
public class SchExamScoreController extends BaseController {

    private final  SchExamScoreService schExamScoreService;

    /**
     * 查询考试成绩列表
     */
    @GetMapping("/page" )

    /**
     * 导出考试成绩列表
     */
    @PostMapping("/export" )
    public void export(HttpServletResponse response, SchExamScore schExamScore) {
        List<SchExamScore> list = schExamScoreService.list(Wrappers.query(schExamScore));
        ExcelUtil<SchExamScore> util = new ExcelUtil<SchExamScore>(SchExamScore. class);
        util.exportExcel(response, list, "考试成绩数据" );
    }

    /**
     * 获取考试成绩详细信息
     */
    @GetMapping(value = "getById/{studentId}" )
    public R getById(@PathVariable("studentId" ) Long studentId) {
        return R.ok(schExamScoreService.getById(studentId));
    }

    /**
     * 新增考试成绩
     */
    @PostMapping
    public R add(@RequestBody SchExamScore schExamScore) {
        return R.ok(schExamScoreService.save(schExamScore));
    }

    /**
     * 修改考试成绩
     */
    @PutMapping
    public R edit(@RequestBody SchExamScore schExamScore) {
        return R.ok(schExamScoreService.updateById(schExamScore));
    }

    /**
     * 删除考试成绩
     */
    @DeleteMapping("/removeByIds/{ids}" )
    public R removeByIds(@PathVariable("ids" ) List<Long> ids) {
        return R.ok(schExamScoreService.removeByIds(ids));
    }
}
