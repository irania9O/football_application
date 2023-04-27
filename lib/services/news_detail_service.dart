import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchNews(newsId) async {
  await Future.delayed(const Duration(seconds: 1));
  var client = http.Client();
  var url =
      Uri.parse('https://api.footballi.net/api/v2/news/$newsId?version=2');
  var response = await client.get(url);
  if (response.statusCode == 200) {
    var jsonString = response.body;
    return json.decode(jsonString);
  } else {
    return null;
  }
}
