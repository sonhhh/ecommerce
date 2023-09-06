class Categories {
  int? id;
  String? categories;
  String? image;
  String? name;

  Categories(this.categories, this.name, this.image, this.id);
}

List<Categories> categories = [
  Categories(
      "giày",
      'F1',
      'https://cdn.tgdd.vn/Files/2021/02/03/1325290/top-10-doi-giay-the-thao-thoi-trang-nam-nike-duoc-ua-chuong-tai-viet-nam-202102031615176986.jpg',
      1),
  Categories(
      "giày",
      'F1',
      'https://cdn.tgdd.vn/Files/2021/02/03/1325290/top-10-doi-giay-the-thao-thoi-trang-nam-nike-duoc-ua-chuong-tai-viet-nam-202102031615176986.jpg',
      2),
  Categories(
      "giày",
      'F1',
      'https://cdn.tgdd.vn/Files/2021/02/03/1325290/top-10-doi-giay-the-thao-thoi-trang-nam-nike-duoc-ua-chuong-tai-viet-nam-202102031615176986.jpg',
      3),
  Categories(
      "giày",
      'F1',
      'https://cdn.tgdd.vn/Files/2021/02/03/1325290/top-10-doi-giay-the-thao-thoi-trang-nam-nike-duoc-ua-chuong-tai-viet-nam-202102031615176986.jpg',
      4),
  Categories(
      "giày",
      'F1',
      'https://cdn.tgdd.vn/Files/2021/02/03/1325290/top-10-doi-giay-the-thao-thoi-trang-nam-nike-duoc-ua-chuong-tai-viet-nam-202102031615176986.jpg',
      5),
  Categories(
      "giày",
      'F1',
      'https://cdn.tgdd.vn/Files/2021/02/03/1325290/top-10-doi-giay-the-thao-thoi-trang-nam-nike-duoc-ua-chuong-tai-viet-nam-202102031615176986.jpg',
      6),

];

class DetailProducts {
  int? id;
  String? name;
  String? detail;
  String? image;
  String? categories;
  String? price;
  DetailProducts(this.id, this.name, this.detail, this.categories, this.image, this.price);
}

List<DetailProducts> detail = [
  DetailProducts(1, 'F1', 'ghádfgsgsdahfvdsafvdsagfsdafs', "giày",
      'https://cdn.tgdd.vn/Files/2021/02/03/1325290/top-10-doi-giay-the-thao-thoi-trang-nam-nike-duoc-ua-chuong-tai-viet-nam-202102031615176986.jpg','155.451'),
  DetailProducts(2, 'F1', 'ghádfgsgsdahfvdsafvdsagfsdafs', "giày",
      'https://cdn.tgdd.vn/Files/2021/02/03/1325290/top-10-doi-giay-the-thao-thoi-trang-nam-nike-duoc-ua-chuong-tai-viet-nam-202102031615176986.jpg','155.451'),
  DetailProducts(3, 'F1', 'ghádfgsgsdahfvdsafvdsagfsdafs', "giày",
      'https://cdn.tgdd.vn/Files/2021/02/03/1325290/top-10-doi-giay-the-thao-thoi-trang-nam-nike-duoc-ua-chuong-tai-viet-nam-202102031615176986.jpg','155.451'),
  DetailProducts(4, 'F1', 'ghádfgsgsdahfvdsafvdsagfsdafs', "giày",
      'https://cdn.tgdd.vn/Files/2021/02/03/1325290/top-10-doi-giay-the-thao-thoi-trang-nam-nike-duoc-ua-chuong-tai-viet-nam-202102031615176986.jpg','155.451'),
  DetailProducts(5, 'F1', 'ghádfgsgsdahfvdsafvdsagfsdafs', "giày",
      'https://cdn.tgdd.vn/Files/2021/02/03/1325290/top-10-doi-giay-the-thao-thoi-trang-nam-nike-duoc-ua-chuong-tai-viet-nam-202102031615176986.jpg','155.451'),
  DetailProducts(6, 'F1', 'ghádfgsgsdahfvdsafvdsagfsdafs', "giày",
      'https://cdn.tgdd.vn/Files/2021/02/03/1325290/top-10-doi-giay-the-thao-thoi-trang-nam-nike-duoc-ua-chuong-tai-viet-nam-202102031615176986.jpg','155.451'),
  DetailProducts(7, 'F1', 'ghádfgsgsdahfvdsafvdsagfsdafs', "giày",
      'https://cdn.tgdd.vn/Files/2021/02/03/1325290/top-10-doi-giay-the-thao-thoi-trang-nam-nike-duoc-ua-chuong-tai-viet-nam-202102031615176986.jpg','155.451'),
  DetailProducts(8, 'F1', 'ghádfgsgsdahfvdsafvdsagfsdafs', "giày",
      'https://cdn.tgdd.vn/Files/2021/02/03/1325290/top-10-doi-giay-the-thao-thoi-trang-nam-nike-duoc-ua-chuong-tai-viet-nam-202102031615176986.jpg','155.451'),
  DetailProducts(9, 'F1', 'ghádfgsgsdahfvdsafvdsagfsdafs', "giày",
      'https://cdn.tgdd.vn/Files/2021/02/03/1325290/top-10-doi-giay-the-thao-thoi-trang-nam-nike-duoc-ua-chuong-tai-viet-nam-202102031615176986.jpg','155.451'),
  DetailProducts(10, 'F1', 'ghádfgsgsdahfvdsafvdsagfsdafs', "giày",
      'https://cdn.tgdd.vn/Files/2021/02/03/1325290/top-10-doi-giay-the-thao-thoi-trang-nam-nike-duoc-ua-chuong-tai-viet-nam-202102031615176986.jpg','155.451')
];


class Notification{
  String? image;
  String? nameAccount;
  String? content;
  Notification(this.image, this.nameAccount, this.content);
}

List<Notification> note=[
  Notification('assets/introl/introl2.webp', 'Travis Scott', 'Jacques Berman Webster II, được biết đến với nghệ danh Travis Scott là rapper, ca sĩ, nghệ sĩ sáng tác và sản xuất nhạc người Mỹ. Vào năm 2012, anh đã kí hợp đồng thu âm với hãng Epic Records.'),
  Notification('assets/introl/introl3.webp', 'Travis Scott', 'Jacques Berman Webster II, được biết đến với nghệ danh Travis Scott là rapper, ca sĩ, nghệ sĩ sáng tác và sản xuất nhạc người Mỹ. Vào năm 2012, anh đã kí hợp đồng thu âm với hãng Epic Records.'),
  Notification('assets/introl/introl_1.jpeg', 'Travis Scott', 'Jacques Berman Webster II, được biết đến với nghệ danh Travis Scott là rapper, ca sĩ, nghệ sĩ sáng tác và sản xuất nhạc người Mỹ. Vào năm 2012, anh đã kí hợp đồng thu âm với hãng Epic Records.'),
  Notification('assets/introl/login_logo.webp', 'Travis Scott', 'Jacques Berman Webster II, được biết đến với nghệ danh Travis Scott là rapper, ca sĩ, nghệ sĩ sáng tác và sản xuất nhạc người Mỹ. Vào năm 2012, anh đã kí hợp đồng thu âm với hãng Epic Records.'),
];

class Cart{
    String? image;
    String? nameProduct;
    String? cate;
    int? quan;
    int? size;
    double? price;
    Cart(this.image, this.nameProduct, this.cate, this.quan, this.size, this.price);
}

List<Cart> cart=[
  Cart('assets/image/travis_scott.jpg', 'travis scott', 'rapper', 1, 40, 250.45),
  Cart('assets/image/travis_scott.jpg', 'travis scott', 'rapper', 1, 40, 250.45),
  Cart('assets/image/travis_scott.jpg', 'travis scott', 'rapper', 1, 40, 250.45),

];


class MyCart {
  String? productId; // Thêm productId vào MyCart
  String? image;
  String? nameProduct;
  String? nameCategori;
  int? price;


  MyCart(this.productId, this.image, this.nameProduct, this.nameCategori, this.price);
}


List<MyCart> myCart = [
  MyCart('1', 'assets/introl/introl2.webp', 'Travis Scott', 'Rapper', 15214212),
  MyCart('2', 'assets/introl/introl2.webp', 'Travis Scott', 'Rapper', 15214212),
  MyCart('3', 'assets/introl/introl2.webp', 'Travis Scott', 'Rapper', 15214212),
];

class Product {
  String? image;
  String? nameProduct;
  String? nameCategori;
  int? price;

  Product(this.image, this.nameProduct, this.nameCategori, this.price);
}