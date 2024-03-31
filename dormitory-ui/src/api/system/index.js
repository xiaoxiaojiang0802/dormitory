import request from '@/utils/request';

export function selectIndex() {
  return request({
    url: '/selectIndex',
    method: 'get',
  })
}


export function getVersion() {
  return request({
    url: '/getVersion',
    method: 'get',
  })
}


export function listLoginInfoIndex() {
  return request({
    url: '/listLoginInfoIndex',
    method: 'get',
  })
}
