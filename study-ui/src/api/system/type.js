import request from '@/utils/request'

// 查询类别列表
export function pageType(query) {
  return request({
    url: '/study/type/page',
    method: 'get',
    params: query
  })
}

// 查询类别列表
export function listType(query) {
  return request({
    url: '/study/type/list',
    method: 'get',
    params: query
  })
}

// 查询类别详细
export function getType(id) {
  return request({
    url: '/study/type/getById/' + id,
    method: 'get'
  })
}

// 新增类别
export function addType(data) {
  return request({
    url: '/study/type',
    method: 'post',
    data: data
  })
}

// 修改类别
export function updateType(data) {
  return request({
    url: '/study/type',
    method: 'put',
    data: data
  })
}

// 删除类别
export function delType(id) {
  return request({
    url: '/study/type/removeByIds/' + id,
    method: 'delete'
  })
}
