package com.cdmzl.dormitory.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.cdmzl.common.core.domain.entity.SysUser;
import com.cdmzl.dormitory.mapper.DorRepairOrderMapper;
import com.cdmzl.dormitory.mapper.DorVisitorMapper;
import com.cdmzl.dormitory.service.ISysIndexService;
import com.cdmzl.system.domain.vo.SysIndexVo;
import com.cdmzl.system.mapper.SysUserMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * @author LJJ
 * @date 2024/3/28
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class SysIndexServiceImpl implements ISysIndexService {

    private final SysUserMapper sysUserMapper;

    private final DorRepairOrderMapper dorRepairOrderMapper;
    private final DorVisitorMapper dorVisitorMapper;

    @Override
    public SysIndexVo selectIndex() {
        SysIndexVo sysIndexVo = new SysIndexVo();
        LambdaQueryWrapper<SysUser> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(SysUser::getDelFlag, 0);
        wrapper.eq(SysUser::getUserCategory, "1");
        sysIndexVo.setPersonCount(sysUserMapper.selectCount(wrapper));
        sysIndexVo.setTurnover(dorRepairOrderMapper.selectCount(null));
        sysIndexVo.setOrderCount(dorVisitorMapper.selectCount(null));
        return sysIndexVo;
    }
}
