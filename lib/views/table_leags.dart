import 'package:flutter/material.dart';

import '../services/leage_table_service.dart';

class TableLeags extends StatefulWidget {
  const TableLeags({Key? key}) : super(key: key);
  static String routeName = '/table';

  @override
  State<TableLeags> createState() => _TableLeagsState();
}

class _TableLeagsState extends State<TableLeags> {
  var TableData;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    fetchLeagueTable();
  }

  fetchLeagueTable() async {
    final response2 = await LeagueTableService().fetchLeagueTable();
    if (response2 != null) {
      setState(() {
        TableData = response2;
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? Scaffold(
            appBar: AppBar(
              title: const Text('League Table'),
              backgroundColor: Colors.deepOrangeAccent,
            ),
            body: ListView.builder(
              itemCount: TableData.data.standing.standings[0].standings.length,
              // set header
              // headerBuilder: (context, index) {
              itemBuilder: (context, index) {
                return InkWell(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    foregroundDecoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 20,
                          child: Text(
                            TableData.data.standing.standings[0]
                                .standings[index].position
                                .toString(),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(5),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                TableData.data.standing.standings[0]
                                    .standings[index].team.logo,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          width: 140,
                          child: Text(
                            TableData.data.standing.standings[0]
                                .standings[index].team.nameFa,
                            textAlign: TextAlign.left,
                            maxLines: 1,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            TableData.data.standing.standings[0]
                                .standings[index].matchPlayed
                                .toString(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text(
                            TableData
                                .data.standing.standings[0].standings[index].win
                                .toString(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text(
                            TableData.data.standing.standings[0]
                                .standings[index].draw
                                .toString(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text(
                            TableData.data.standing.standings[0]
                                .standings[index].lose
                                .toString(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text(
                            (TableData.data.standing.standings[0]
                                        .standings[index].goalScored -
                                    TableData.data.standing.standings[0]
                                        .standings[index].goalAgainst)
                                .toString(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text(
                            TableData.data.standing.standings[0]
                                .standings[index].overallPoint
                                .toString(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                      ],
                    ),
                  ),
                );
              },
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
    ;
  }
}
