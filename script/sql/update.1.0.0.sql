-- 菜单 SQL
insert into sys_menu (menu_id,menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values(1658470188742328320,'床位', '3', '1', 'bed', 'dormitory/bed/index', 1, 0, 'C', '0', '0', 'dormitory:bed:list', '#', 'admin', sysdate(), '', null, '床位菜单');

-- 按钮父菜单ID
SELECT @parentId := 1658470188742328320;

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('床位查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'dormitory:bed:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('床位新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'dormitory:bed:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('床位修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'dormitory:bed:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('床位删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'dormitory:bed:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('床位导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'dormitory:bed:export',       '#', 'admin', sysdate(), '', null, '');

-- 菜单 SQL
insert into sys_menu (menu_id,menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values(1658470189266616320,'宿舍', '3', '1', 'dormitory', 'dormitory/dormitory/index', 1, 0, 'C', '0', '0', 'dormitory:dormitory:list', '#', 'admin', sysdate(), '', null, '宿舍菜单');

-- 按钮父菜单ID
SELECT @parentId := 1658470189266616320;

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('宿舍查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'dormitory:dormitory:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('宿舍新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'dormitory:dormitory:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('宿舍修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'dormitory:dormitory:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('宿舍删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'dormitory:dormitory:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('宿舍导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'dormitory:dormitory:export',       '#', 'admin', sysdate(), '', null, '');

-- 菜单 SQL
insert into sys_menu (menu_id,menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values(1658470190071922688,'维修工单', '3', '1', 'order', 'dormitory/order/index', 1, 0, 'C', '0', '0', 'dormitory:order:list', '#', 'admin', sysdate(), '', null, '维修工单菜单');

-- 按钮父菜单ID
SELECT @parentId := 1658470190071922688;

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('维修工单查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'dormitory:order:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('维修工单新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'dormitory:order:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('维修工单修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'dormitory:order:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('维修工单删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'dormitory:order:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('维修工单导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'dormitory:order:export',       '#', 'admin', sysdate(), '', null, '');

-- 菜单 SQL
insert into sys_menu (menu_id,menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values(1658470189690241024,'居住记录', '3', '1', 'record', 'dormitory/record/index', 1, 0, 'C', '0', '0', 'dormitory:record:list', '#', 'admin', sysdate(), '', null, '居住记录菜单');

-- 按钮父菜单ID
SELECT @parentId := 1658470189690241024;

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('居住记录查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'dormitory:record:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('居住记录新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'dormitory:record:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('居住记录修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'dormitory:record:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('居住记录删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'dormitory:record:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('居住记录导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'dormitory:record:export',       '#', 'admin', sysdate(), '', null, '');

-- 菜单 SQL
insert into sys_menu (menu_id,menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values(1658470190449410048,'访客', '3', '1', 'visitor', 'dormitory/visitor/index', 1, 0, 'C', '0', '0', 'dormitory:visitor:list', '#', 'admin', sysdate(), '', null, '访客菜单');

-- 按钮父菜单ID
SELECT @parentId := 1658470190449410048;

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('访客查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'dormitory:visitor:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('访客新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'dormitory:visitor:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('访客修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'dormitory:visitor:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('访客删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'dormitory:visitor:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('访客导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'dormitory:visitor:export',       '#', 'admin', sysdate(), '', null, '');



