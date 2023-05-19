import request from '@/utils/request'

// 查询床位列表
export function pageBuilding(query) {
  return request({
    url: '/dormitory/building/page',
    method: 'get',
    params: query
  })
}

// 查询床位详细
export function getBuilding(id) {
  return request({
    url: '/dormitory/building/getById/' + id,
    method: 'get'
  })
}

// 新增床位
export function addBuilding(data) {
  return request({
    url: '/dormitory/building',
    method: 'post',
    data: data
  })
}

// 修改床位
export function updateBuilding(data) {
  return request({
    url: '/dormitory/building',
    method: 'put',
    data: data
  })
}

// 删除床位
export function delBuilding(ids) {
  return request({
    url: '/dormitory/building/removeByIds/' + ids,
    method: 'delete'
  })
}
