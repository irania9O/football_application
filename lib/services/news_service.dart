import 'package:app/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsService {
  Future<News?> fetchNews() async {
    var client = http.Client();

    var url =
        Uri.parse('https://api.footballi.net/api/v2/news/latest?version=2');
    var response = await client.get(url);
    // print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return newsFromJson(jsonString);
    } else {
      return null;
    }
  }
}
