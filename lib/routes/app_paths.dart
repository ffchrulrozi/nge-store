class Paths {
  static PathObject SPLASH = PathObject('splash', '/splash');
  static PathObject LOGIN = PathObject('login', '/login');
  static PathObject DASHBOARD = PathObject('dashboard', '/dashboard');
  static PathObject PRODUCT = PathObject('product', '/product/:id');
  static PathObject CHECKOUT = PathObject('checkout', '/checkout');
}

class PathObject{
  final String name;
  final String path;

  PathObject(this.name, this.path);
}