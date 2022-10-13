import 'package:qlipper/model/category_model.dart';

List<CategoryModel> getCategories() {
  // ignore: deprecated_member_use
  List<CategoryModel> newsCategories = List<CategoryModel>();
  CategoryModel categoryModel;

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Finance";
  categoryModel.imgUrl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQd_QJbTLER6BFpIYmpx6sbUu2tT_u2Vhf6sg&usqp=CAU";
  newsCategories.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Education";
  categoryModel.imgUrl =
      "https://images.theconversation.com/files/45159/original/rptgtpxd-1396254731.jpg?ixlib=rb-1.1.0&q=30&auto=format&w=600&h=400&fit=crop&dpr=2";
  newsCategories.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imgUrl =
      "https://thumbs.dreamstime.com/z/super-food-good-health-concept-fresh-fruit-vegetables-chinese-herbal-medicine-selection-foods-high-anthocyanins-110964883.jpg";
  newsCategories.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Business";
  categoryModel.imgUrl =
      "https://img.freepik.com/free-photo/business-brainstorming-graph-chart-report-data-concept_53876-31213.jpg?w=1800&t=st=1665308865~exp=1665309465~hmac=89bc760f1d6f45ac6cf944987883da69397705cd859b3b743acc37c5b17dd8a5";
  newsCategories.add(categoryModel);

  return newsCategories;
}
