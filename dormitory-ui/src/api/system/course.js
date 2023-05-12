import request from '@/utils/request'

// 查询课程列表
export function pageCourse(query) {
  return request({
    url: '/study/course/page',
    method: 'get',
    params: query
  })
}


// 查看修读名单
export function listCourseUser(id) {
  return request({
    url: '/study/user/listCourseUser/'+ id,
    method: 'get',
  })
}

// 查询课程详细
export function getCourse(id) {
  return request({
    url: '/study/course/getById/' + id,
    method: 'get'
  })
}

// 新增课程
export function addCourse(data) {
  return request({
    url: '/study/course',
    method: 'post',
    data: data
  })
}

// 修改课程
export function updateCourse(data) {
  return request({
    url: '/study/course',
    method: 'put',
    data: data
  })
}

// 删除课程
export function delCourse(id) {
  return request({
    url: '/study/course/removeByIds/' + id,
    method: 'delete'
  })
}
