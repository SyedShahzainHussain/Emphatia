import 'package:store/data/network/base_api_services.dart';
import 'package:store/data/network/network_api_services.dart';
import 'package:store/features/authentication/model/category_model.dart';

class NewsRepository {
  BaseApiServices baseApiServices = NetworkApiServices();

  Future<List<CategoriesModel>> getCategories(String category) async {
    String url = 'https://client-backend-4pho.onrender.com/articles?category=$category';

    final response = await baseApiServices.getGetApiResponse(url);
    final data = response as List;
    return data.map((dynamic json) => CategoriesModel.fromJson(json)).toList();
  }
}
