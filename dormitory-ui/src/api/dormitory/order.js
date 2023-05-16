import request from '@/utils/request'

// 查询维修工单列表
export function pageOrder(query) {
  return request({
    url: '/dormitory/order/page',
    method: 'get',
    params: query
  })
}

// 查询维修工单详细
export function getOrder(createBy) {
  return request({
    url: '/dormitory/order/getById/' + createBy,
    method: 'get'
  })
}

// 新增维修工单
export function addOrder(data) {
  return request({
    url: '/dormitory/order',
    method: 'post',
    data: data
  })
}

// 修改维修工单
export function updateOrder(data) {
  return request({
    url: '/dormitory/order',
    method: 'put',
    data: data
  })
}

// 删除维修工单
export function delOrder(createBy) {
  return request({
    url: '/dormitory/order/removeByIds/' + createBy,
    method: 'delete'
  })
}
