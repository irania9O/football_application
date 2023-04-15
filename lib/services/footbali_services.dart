import 'package:app/models/footbali_model.dart';
import 'package:http/http.dart' as http;

class FootballService {
  Future<Football?> fetchFootbalis() async {
    var client = http.Client();

    var url =
        Uri.parse('https://api.footballi.net/api/v2/match/tab/?version=2');
    var response = await client.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return footballFromJson(jsonString);
    } else {
      return null;
    }
  }
}
