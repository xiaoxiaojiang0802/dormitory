import request from '@/utils/request'

// 查询访客列表
export function pageVisitor(query) {
  return request({
    url: '/dormitory/visitor/page',
    method: 'get',
    params: query
  })
}

// 查询访客详细
export function getVisitor(createBy) {
  return request({
    url: '/dormitory/visitor/getById/' + createBy,
    method: 'get'
  })
}

// 新增访客
export function addVisitor(data) {
  return request({
    url: '/dormitory/visitor',
    method: 'post',
    data: data
  })
}

// 修改访客
export function updateVisitor(data) {
  return request({
    url: '/dormitory/visitor',
    method: 'put',
    data: data
  })
}

// 删除访客
export function delVisitor(createBy) {
  return request({
    url: '/dormitory/visitor/removeByIds/' + createBy,
    method: 'delete'
  })
}
