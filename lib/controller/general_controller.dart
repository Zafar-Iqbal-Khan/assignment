import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/general_news_model.dart';
import 'package:newsapp/model/news_categories_model.dart';
import 'package:newsapp/services/api_service.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    generalNewsFetch();
    generalCategoriesFetch();
  }

  var isLoading = true.obs;
  var loading = true.obs;
  GeneralNews? generalNews;
  List<NewsCategories>? newsCategories;
  generalNewsFetch() async {
    isLoading.value = true;
    http.Response response = await fetchGeneralNews();

    int responseStatusCode = response.statusCode;
    var responseBody = jsonDecode(response.body);

    if (responseStatusCode == 200) {
      generalNews = GeneralNews.fromJson(responseBody);
      isLoading.value = false;
    }
  }

  generalCategoriesFetch() async {
    loading.value = true;
    http.Response response = await fetchCategoriesNews();

    int responseStatusCode = response.statusCode;
    var responseBody = jsonDecode(response.body);
    if (responseStatusCode == 200) {
      newsCategories = newsCategoriesFromJson(response.body);
      loading.value = false;
    }
  }
}
