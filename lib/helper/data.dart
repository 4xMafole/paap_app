import 'package:paap_app/models/Category.dart';

List<Category> getCategory(){
  List<Category> categoryList = <Category>[];
  Category category;

  category = Category();
  category.categoryName = "Business";
  category.imageUrl = "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80";
  categoryList.add(category);
  //2
  category = Category();
  category.categoryName = "Entertainment";
  category.imageUrl = "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  categoryList.add(category);

  //3
  category = Category();
  category.categoryName = "General";
  category.imageUrl = "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  categoryList.add(category);

  //4
  category = Category();
  category.categoryName = "Health";
  category.imageUrl = "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  categoryList.add(category);

  //5
  category = Category();
  category.categoryName = "Science";
  category.imageUrl = "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  categoryList.add(category);

  //5
  category = Category();
  category.categoryName = "Sports";
  category.imageUrl = "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  categoryList.add(category);

  //5
  category = Category();
  category.categoryName = "Technology";
  category.imageUrl = "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  categoryList.add(category);

  return categoryList;
}