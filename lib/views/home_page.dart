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
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? Scaffold(
            body: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView.builder(
              itemCount: competitions
                  .length, // footbalis!.data.competitionMatches[0].matches!.length,
              itemBuilder: (context, index) {
                var date = DateTime.fromMillisecondsSinceEpoch(
                    competitions[index].timestamp * 1000);
                return InkWell(
                  highlightColor: Colors.deepOrangeAccent,
                  hoverColor: Colors.deepOrange,
                  splashColor: Colors.white,
                  // onTap: () {
                  //   print(competitions[index].homeTeam.nameEn);
                  // },
                  autofocus: false,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(15),
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
                          width: 40,
                          height: 40,
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
                          width: 10,
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
                                style: const TextStyle(fontSize: 14),
                                textAlign: TextAlign.start,
                                textDirection: TextDirection.rtl,
                                textWidthBasis: TextWidthBasis.parent,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        competitions[index].matchStarted
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '${competitions[index].homeTeamScore} - ${competitions[index].awayTeamScore}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    competitions[index].status,
                                    textAlign: TextAlign.values[1],
                                  ),
                                ],
                              )
                            : Text(
                                '${date.hour}:${date.minute}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
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
                                style: const TextStyle(fontSize: 14),
                                textAlign: TextAlign.start,
                                textDirection: TextDirection.rtl,
                                textWidthBasis: TextWidthBasis.parent,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 40,
                          height: 40,
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
          ))
        : const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.deepOrangeAccent,
                strokeWidth: 7,
                valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent),
              ),
            ),
          );
  }
}
