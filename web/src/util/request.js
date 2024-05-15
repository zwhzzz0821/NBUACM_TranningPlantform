import axios from 'axios'

const request = axios.create({
  // baseURL: 'http://121.36.71.223:9003',
  baseURL: 'http://localhost:9003',
  timeout: 50000,
  headers: {
    'Content-Type': 'application/json;charset=UTF-8'
  },
  withCredentials: false
})

request.interceptors.request.use(
    config => {
      return config
    },
    error => {
      return Promise.reject(error)
    }
)

request.interceptors.response.use(
  response => {
      return response.data
    },
    error => {
      console.log(error)
      return error;
    }
)

export default request