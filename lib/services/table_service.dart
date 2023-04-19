import 'dart:convert';
import 'package:http/http.dart' as http;

class TableService {
  final int id;
  TableService(this.id);

  Future<Map<String, dynamic>?> fetchTable() async {
    var client = http.Client();
    var url = Uri.parse(
        'https://api.footballi.net/api/v2/competition/$id/homepage?news=true&version=2');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return json.decode(jsonString);
    } else {
      return null;
    }
  }
}
