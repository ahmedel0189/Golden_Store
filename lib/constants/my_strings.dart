class MyRoutes {
  static const homePageRoute = '/';
  static const updateProductRoute = '/updateProduct';
}

class MyUrls {
  // Static constants (shared for all)
  static const allProductUrl = 'https://fakestoreapi.com/';
  static const allCategoriesUrl = 'https://fakestoreapi.com/products/categories';
  static const categoryProductUrl = 'https://fakestoreapi.com/products/category/';
  static const addProductUrl = 'https://fakestoreapi.com/products/';

  // Function that returns a dynamic URL for a specific product
  static String updateProductUrl(int id) {
    return 'https://fakestoreapi.com/products/$id';
  }
}

class MyKey {
  static const authorizationToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjIsInVzZXIiOiJtb3JfMjMxNCIsImlhdCI6MTc1ODg0MTMxNX0.gZnx92YNXIKhQOW6HrL8xhO73iEILyOlXLAMQtEC2II';
}
