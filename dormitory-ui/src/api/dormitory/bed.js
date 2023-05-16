import request from '@/utils/request'

// 查询床位列表
export function pageBed(query) {
  return request({
    url: '/dormitory/bed/page',
    method: 'get',
    params: query
  })
}

// 查询床位详细
export function getBed(createBy) {
  return request({
    url: '/dormitory/bed/getById/' + createBy,
    method: 'get'
  })
}

// 新增床位
export function addBed(data) {
  return request({
    url: '/dormitory/bed',
    method: 'post',
    data: data
  })
}

// 修改床位
export function updateBed(data) {
  return request({
    url: '/dormitory/bed',
    method: 'put',
    data: data
  })
}

// 删除床位
export function delBed(createBy) {
  return request({
    url: '/dormitory/bed/removeByIds/' + createBy,
    method: 'delete'
  })
}
