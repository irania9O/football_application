import 'package:app/services/footbali_services.dart';
import 'package:app/views/home_page.dart';
// import 'package:app/views/table_leags.dart';
import 'package:flutter/material.dart';

class TablePage extends StatefulWidget {
  const TablePage({Key? key}) : super(key: key);

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  bool isLoaded = false;
  List pages = [];

  @override
  void initState() {
    super.initState();
    fetchDataFootbalis();
  }

  fetchDataFootbalis() async {
    try {
      final response = await fetchFootbalis();
      if (response != null) {
        setState(() {
          // for (int i = 0; i < response['data']['tabs'].length; i++) {
          // competitions
          //     .addAll(response['data']['competition_matches'][i]['matches']);
          // pages.addAll(response['data']['tabs'][i]);
          // }
          pages = response['data']['tabs'];
          isLoaded = true;
        });
      }
    } catch (e) {
      fetchDataFootbalis();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoaded == true) {
      return DefaultTabController(
        length: pages.length,
        initialIndex: 4,
        child: Scaffold(
          body: Column(
            children: <Widget>[
              TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.deepOrangeAccent,
                  labelColor: Theme.of(context).textTheme.bodyLarge?.color,
                  dividerColor: Colors.deepOrangeAccent,
                  unselectedLabelColor: Colors.grey,
                  automaticIndicatorColorAdjustment: true,
                  padding: const EdgeInsets.only(bottom: 20),
                  indicatorWeight: 5,
                  tabs: pages
                      .map(
                        (e) => Tab(text: e['title']),
                      )
                      .toList()
                      .reversed
                      .toList()),
              Expanded(
                child: TabBarView(
                    children: pages
                        .map(
                          (e) => table_games_live_page(
                              tab_id: e['id']), //Tab(text: e['id']),
                        )
                        .toList()
                        .reversed
                        .toList()
                    // [
                    //   table_games_live_page(
                    //       // leageId: 21,
                    //       ),
                    //   table_games_live_page(
                    //       // leageId: 9,
                    //       ),
                    //   table_games_live_page(
                    //       // leageId: 11,
                    //       ),
                    // ]
                    ),
              ),
            ],
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
