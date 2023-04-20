import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchFootbalis() async {
  var client = http.Client();
  var url = Uri.parse('https://api.footballi.net/api/v2/match/tab/?version=2');
  var response = await client.get(url);
  if (response.statusCode == 200) {
    var jsonString = response.body;
    return json.decode(jsonString);
  } else {
    return null;
  }
}
