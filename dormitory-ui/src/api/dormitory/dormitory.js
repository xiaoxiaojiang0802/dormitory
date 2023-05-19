import request from '@/utils/request'

// 查询宿舍列表
export function pageDormitory(query) {
  return request({
    url: '/dormitory/dormitory/page',
    method: 'get',
    params: query
  })
}

// 查询宿舍详细
export function getDormitory(id) {
  return request({
    url: '/dormitory/dormitory/getById/' + id,
    method: 'get'
  })
}

// 新增宿舍
export function addDormitory(data) {
  return request({
    url: '/dormitory/dormitory',
    method: 'post',
    data: data
  })
}

// 修改宿舍
export function updateDormitory(data) {
  return request({
    url: '/dormitory/dormitory',
    method: 'put',
    data: data
  })
}

// 删除宿舍
export function delDormitory(createBy) {
  return request({
    url: '/dormitory/dormitory/removeByIds/' + createBy,
    method: 'delete'
  })
}
