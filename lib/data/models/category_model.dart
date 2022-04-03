class CategoryModel {
  String categoryname;
  String categoryUrl;
  CategoryModel({
    required this.categoryname,
    required this.categoryUrl,
  });
}

class CategoryList {
  List<CategoryModel> categories = [];

  Future<List<CategoryModel>>  getList() async {
     categories.add(
      CategoryModel(
          categoryname: 'Sports',
          categoryUrl:
              'https://images.unsplash.com/photo-1461896836934-ffe607ba8211?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3BvcnRzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
    );
    categories.add(
      CategoryModel(
          categoryname: 'Technology',
          categoryUrl:
              'https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dGVjaG5vbG9neXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
    );
    categories.add(
      CategoryModel(
          categoryname: 'Business',
          categoryUrl:
              'https://images.unsplash.com/photo-1512389810321-de6db6e2aba7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8YnVzaW5lc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
    );

    return categories;
  }
}
