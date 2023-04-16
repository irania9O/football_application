import 'package:app/models/league_table.dart';
import 'package:http/http.dart' as http;

class LeagueTableService {
  Future<Table?> fetchLeagueTable() async {
    var client = http.Client();

    var url = Uri.parse(
        'https://api.footballi.net/api/v2/competition/21/homepage?news=true&version=2');
    var response = await client.get(url);
    // print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return tableFromJson(jsonString);
    } else {
      return null;
    }
  }
}
