import 'package:http/http.dart' as http;

Future<http.Response> fetchGeneralNews() async {
  const String URL = "https://admin-v2.lokwani.in/api/general_news";
  final response = await http.get(
    Uri.parse(URL),
  );
  return response;
}

Future<http.Response> fetchCategoriesNews() async {
  const String URL = "https://admin-v2.lokwani.in/api/rsscategories";
  final response = await http.get(
    Uri.parse(URL),
  );
  return response;
}
