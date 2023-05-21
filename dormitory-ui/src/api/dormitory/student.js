import request from '@/utils/request';

export function listStudent(query) {
  return request({
    url: '/dormitory/student/listStudent',
    method: 'get',
    params: query
  })
}
