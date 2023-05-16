import request from '@/utils/request'

// 查询居住记录列表
export function pageRecord(query) {
  return request({
    url: '/dormitory/record/page',
    method: 'get',
    params: query
  })
}

// 查询居住记录详细
export function getRecord(createBy) {
  return request({
    url: '/dormitory/record/getById/' + createBy,
    method: 'get'
  })
}

// 新增居住记录
export function addRecord(data) {
  return request({
    url: '/dormitory/record',
    method: 'post',
    data: data
  })
}

// 修改居住记录
export function updateRecord(data) {
  return request({
    url: '/dormitory/record',
    method: 'put',
    data: data
  })
}

// 删除居住记录
export function delRecord(createBy) {
  return request({
    url: '/dormitory/record/removeByIds/' + createBy,
    method: 'delete'
  })
}
