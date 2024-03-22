import 'package:flutter/foundation.dart';
import 'package:store/features/authentication/model/category_model.dart';
import 'package:store/repository/article_repository.dart';

class ArticleViewModel with ChangeNotifier {
  NewsRepository newsRepository = NewsRepository();

  Future<List<CategoriesModel>> getCategories(String category) async {
    return await newsRepository.getCategories(category);
  }
}
