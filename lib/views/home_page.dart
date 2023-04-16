import 'package:app/models/footbali_model.dart';
import 'package:app/services/footbali_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List competitions = [];
  Football? footbalis;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    fetchFootbalis();
  }

  fetchFootbalis() async {
    final response2 = await FootballService().fetchFootbalis();
    if (response2 != null) {
      setState(() {
        // append all the matches
        for (var i = 0; i < response2.data.competitionMatches.length; i++) {
          competitions.addAll(response2.data.competitionMatches[i].matches!);
        }
        footbalis = response2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      // transform: Matrix4.translationValues(0, 20, 0),
      padding: const EdgeInsets.only(top: 20),
      child: ListView.builder(
        itemCount: competitions
            .length, // footbalis!.data.competitionMatches[0].matches!.length,
        itemBuilder: (context, index) {
          return InkWell(
            highlightColor: Colors.deepOrangeAccent,
            hoverColor: Colors.deepOrange,
            splashColor: Colors.white,
            // onTap: () {
            //   print(competitions[index].homeTeam.nameEn);
            // },
            autofocus: false,
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(
                          competitions[index].homeTeam.logo,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          competitions[index].homeTeam.nameFa ??
                              competitions[index].homeTeam.nameEn,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    competitions[index].status,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          competitions[index].awayTeam.nameFa ??
                              competitions[index].awayTeam.nameEn,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(
                          competitions[index].awayTeam.logo,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ));
  }
}
