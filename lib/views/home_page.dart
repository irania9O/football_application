// ignore_for_file: non_constant_identifier_names

import 'package:app/services/footbali_services.dart';
import 'package:app/views/detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class TableGamesLivePage extends StatefulWidget {
  final String tab_id;
  const TableGamesLivePage({Key? key, required this.tab_id}) : super(key: key);
  static String routeName = '/home';

  @override
  State<TableGamesLivePage> createState() => _TableGamesLivePageState();
}

class _TableGamesLivePageState extends State<TableGamesLivePage> {
  List competitions = [];
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    fetchDataFootbalis();
  }

  fetchDataFootbalis() async {
    try {
      final response = await fetchFootbalis(tab: widget.tab_id);
      if (response != null) {
        setState(() {
          for (int i = 0;
              i < response['data']['competition_matches'].length;
              i++) {
            competitions
                .addAll(response['data']['competition_matches'][i]['matches']);
          }
          isLoaded = true;
        });
      }
    } catch (e) {
      fetchDataFootbalis();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoaded) {
      if (competitions.isEmpty) {
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.gamepad,
                size: 100,
                color: Colors.deepOrangeAccent,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "هیچ بازی وجود ندارد",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      }
      return ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: GroupedListView<dynamic, String>(
            elements: competitions,
            groupBy: (element) => element['competition']['name_fa'],
            groupSeparatorBuilder: (String value) => Container(
              margin: const EdgeInsets.only(
                  top: 25, right: 10, left: 10, bottom: 5),
              child: Container(
                padding: const EdgeInsets.all(11.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.deepOrange,
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.5),
                  //     spreadRadius: 6,
                  //     blurRadius: 6,
                  //     offset: const Offset(0, 5),
                  //   ),
                  // ],
                ),
                child: Text(
                  value,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            itemBuilder: (context, element) {
              var date = DateTime.fromMillisecondsSinceEpoch(
                  element['timestamp'] * 1000);
              return InkWell(
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.white,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MatchDetailPage(
                        matchId: element["match_id"],
                      ),
                    ),
                  );
                  // print(element["match_id"]);
                },
                autofocus: false,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).cardColor,
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.withOpacity(0.5),
                    //     spreadRadius: 5,
                    //     blurRadius: 7,
                    //     offset: const Offset(0, 3),
                    //   ),
                    // ],
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
                            // image: NetworkImage(
                            // element['home_team']['logo'],
                            // ),
                            image: CachedNetworkImageProvider(
                              element['home_team']['logo'] ??
                                  "https://i.pravatar.cc/100?img=0",
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
                              element['home_team']['name_fa'] ??
                                  element['home_team']['name_en'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.color),
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
                      element['match_started']
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '${element['home_team_score']} - ${element['away_team_score']}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.color),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(element['status'],
                                    textAlign: TextAlign.values[1],
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.color)),
                              ],
                            )
                          : Text(
                              '${date.hour}:${date.minute}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.color),
                            ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              element['away_team']['name_fa'] ??
                                  element['away_team']['name_en'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.color),
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
                            // image: NetworkImage(
                            //   element['away_team']['logo'],
                            // ),
                            image: CachedNetworkImageProvider(
                              element['away_team']['logo'] ??
                                  "https://i.pravatar.cc/100?img=80",
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
          ));
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.deepOrangeAccent,
            strokeWidth: 7,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent),
          ),
        ),
      );
    }
  }
}
