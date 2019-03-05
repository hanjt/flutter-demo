class DoubanAPI {
  //豆瓣的域名
  static const host = 'https://api.douban.com';
  static const detail = '/v2/book/isbn/';
}

class API {
  static const host = 'http://127.0.0.1:3000';

  //注册接口
  static const signin = '/signin';

  //登录接口
  static const login = '/login';
  
  //添加图书
  static const add = '/add';

  //图书列表
  static const list = '/list';
}