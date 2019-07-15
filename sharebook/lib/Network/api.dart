class DoubanAPI {
  //豆瓣的域名
  static const host = 'https://book.douban.com';
  static const detail = '/subject_search?search_text=';
}

class ShaishufangAPI {
  //豆瓣的域名
  static const host = 'https://shaishufang.com';
  static const detail = '/index.php/api2/books/search?fmt=json&page_index=1&page_size=15&text=';
}

class API {
  static const host = 'http://139.199.39.133:3000';

  //注册接口
  static const signin = '/signin';

  //登录接口
  static const login = '/login';
  
  //添加图书
  static const add = '/add';

  //图书列表
  static const list = '/list';

  //更新图书阅读状态
  static const update = '/update';
}