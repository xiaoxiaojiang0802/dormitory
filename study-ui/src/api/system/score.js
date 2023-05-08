import request from '@/utils/request'

// 查询考试成绩列表
export function pageScore(query) {
  return request({
    url: '/study/score/page',
    method: 'get',
    params: query
  })
}

// 查询考试成绩详细
export function getScore(studentId) {
  return request({
    url: '/study/score/getById/' + studentId,
    method: 'get'
  })
}

// 新增考试成绩
export function addScore(data) {
  return request({
    url: '/study/score',
    method: 'post',
    data: data
  })
}

// 修改考试成绩
export function updateScore(data) {
  return request({
    url: '/study/score',
    method: 'put',
    data: data
  })
}

// 删除考试成绩
export function delScore(studentId) {
  return request({
    url: '/study/score/removeByIds/' + studentId,
    method: 'delete'
  })
}
