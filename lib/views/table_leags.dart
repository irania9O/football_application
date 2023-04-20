import 'package:flutter/material.dart';
// import '../services/leage_table_service.dart';
import '../services/table_service.dart';

class TableLeags extends StatefulWidget {
  final int leageId;
  const TableLeags({Key? key, required this.leageId}) : super(key: key);

  static String routeName = '/table';

  @override
  State<TableLeags> createState() => _TableLeagsState();
}

class _TableLeagsState extends State<TableLeags> {
  // ignore: prefer_typing_uninitialized_variables, non_constant_identifier_names
  var TableData;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    fetchLeagueTable();
  }

  fetchLeagueTable() async {
    TableData = await fetchTable(widget.leageId);
    if (TableData != null) {
      setState(() {
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
                  itemCount: TableData['data']['standing']['standings'][0]
                              ['standings']
                          .length +
                      1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.only(bottom: 16),
                        foregroundDecoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                          ),
                        ),
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: 140,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Text(
                                'بازی',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                'برد',
                                textAlign: TextAlign.center,
                                // font size
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                'مساوی',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                'باخت',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                'تفاضل',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                'امتیاز',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ].reversed.toList(),
                        ),
                      );
                    }
                    index -= 1;
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
                                TableData['data']['standing']['standings'][0]
                                        ['standings'][index]['position']
                                    .toString(),
                                textAlign: TextAlign.right,
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
                                    TableData['data']['standing']['standings']
                                        [0]['standings'][index]['team']['logo'],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: 100,
                              child: Text(
                                TableData['data']['standing']['standings'][0]
                                        ['standings'][index]['team']['name_fa']
                                    .toString(),
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                                maxLines: 1,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Text(
                                TableData['data']['standing']['standings'][0]
                                        ['standings'][index]['match_played']
                                    .toString(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                TableData['data']['standing']['standings'][0]
                                        ['standings'][index]['win']
                                    .toString(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                TableData['data']['standing']['standings'][0]
                                        ['standings'][index]['draw']
                                    .toString(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                TableData['data']['standing']['standings'][0]
                                        ['standings'][index]['lose']
                                    .toString(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                (TableData['data']['standing']['standings'][0]
                                                ['standings'][index]
                                            ['goal_scored'] -
                                        TableData['data']['standing']
                                                ['standings'][0]['standings']
                                            [index]['goal_against'])
                                    .toString(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                TableData['data']['standing']['standings'][0]
                                        ['standings'][index]['overall_point']
                                    .toString(),
                                // TableData.data.standing.standings[0]
                                //     .standings[index].overallPoint
                                //     .toString(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                          ].reversed.toList(),
                        ),
                      ),
                    );
                  },
                )))
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
