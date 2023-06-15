import 'package:app/services/match_datail_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tab_container/tab_container.dart';
import 'package:flutter/material.dart';

class MatchDetailPage extends StatefulWidget {
  final int matchId;
  const MatchDetailPage({Key? key, required this.matchId}) : super(key: key);

  @override
  State<MatchDetailPage> createState() => _MatchDetailPageState();
}

class _MatchDetailPageState extends State<MatchDetailPage> {
  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
  var MatchData;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    fetchDataDetail();
  }

  fetchDataDetail() async {
    try {
      MatchData = await fetchMatchDetail(widget.matchId);

      if (MatchData != null) {
        setState(() {
          isLoaded = true;
        });
      }
    } catch (e) {
      fetchDataDetail();
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double roundWidth = width / 6;
    double gap = width / 12;
    double textboxsize = width / 8;
    double fontsize = width / 27;
    double fontsize2 = width / 30;

    if (isLoaded) {
      var date = DateTime.fromMillisecondsSinceEpoch(
          MatchData["data"]["info"]['timestamp'] * 1000);
      return Scaffold(
        body: Center(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text('فوتبالو',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              backgroundColor: Colors.deepOrangeAccent,
              centerTitle: true,
              elevation: 10,
              toolbarHeight: 60,
              shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.elliptical(100, 100)),
              ),
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  // color: Colors.white,
                  height: 150,
                  width: width * 0.95,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).cardColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: roundWidth,
                        height: roundWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              MatchData["data"]["info"]['home_team']['logo'] ??
                                  "https://i.pravatar.cc/100?img=0",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: textboxsize,
                        child: Text(
                          MatchData["data"]["info"]['home_team']['name_fa'] ??
                              MatchData["data"]["info"]['home_team']['name_en'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: fontsize,
                              color:
                                  Theme.of(context).textTheme.bodySmall?.color),
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          textWidthBasis: TextWidthBasis.parent,
                        ),
                      ),
                      SizedBox(
                        width: gap,
                      ),
                      MatchData["data"]["info"]['match_started']
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  '${MatchData["data"]["info"]['home_team_score']} - ${MatchData["data"]["info"]['away_team_score']}',
                                  style: TextStyle(
                                      fontSize: fontsize2,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.color),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(MatchData["data"]["info"]['status'],
                                    textAlign: TextAlign.values[1],
                                    style: TextStyle(
                                        fontSize: fontsize2,
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
                      SizedBox(
                        width: gap,
                      ),
                      SizedBox(
                        width: textboxsize,
                        child: Text(
                          MatchData["data"]["info"]['away_team']['name_fa'] ??
                              MatchData["data"]["info"]['away_team']['name_en'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: fontsize,
                              color:
                                  Theme.of(context).textTheme.bodySmall?.color),
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          textWidthBasis: TextWidthBasis.parent,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: roundWidth,
                        height: roundWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              MatchData["data"]["info"]['away_team']['logo'] ??
                                  "https://i.pravatar.cc/100?img=80",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // tab view

                // const SizedBox(
                //   height: 20,
                // ),
                // const Divider(
                //   height: 2,
                //   color: Colors.deepOrangeAccent,
                //   thickness: 2,
                // ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 450,
                  width: width * 0.95,
                  child: TabContainer(
                    color: Theme.of(context).cardColor,
                    onEnd: () {
                      print("x");
                    },
                    tabs: const ['رو در رو', 'اخبار', 'اتفاقات'],
                    children: [
                      Container(
                        // width: width * 0.95,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Theme.of(context).cardColor,
                        ),
                        child: const Column(
                          children: [
                            SizedBox(height: 10),
                            Text(" رو در رو"),
                            Text(" رو در رو"),
                            Text(" رو در رو"),
                            Text(" رو در رو"),
                            Text(" رو در رو"),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                      Container(
                        // width: width * 0.95,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Theme.of(context).cardColor,
                        ),
                        child: const Column(
                          children: [
                            SizedBox(height: 10),
                            Text(" اخبار"),
                            Text(" اخبار"),
                            Text(" اخبار"),
                            Text(" اخبار"),
                            Text(" اخبار"),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                      Container(
                        // width: width * 0.95,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Theme.of(context).cardColor,
                        ),
                        child: const Column(
                          children: [
                            SizedBox(height: 10),
                            Text(" اتفاقات"),
                            Text(" اتفاقات"),
                            Text(" اتفاقات"),
                            Text(" اتفاقات"),
                            Text(" اتفاقات"),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      );
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
