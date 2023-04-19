import 'package:app/views/table_leags.dart';
import 'package:flutter/material.dart';

class LeagePage extends StatefulWidget {
  const LeagePage({Key? key}) : super(key: key);

  @override
  State<LeagePage> createState() => _LeagePageState();
}

class _LeagePageState extends State<LeagePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        body: Column(
          children: const <Widget>[
            TabBar(
              isScrollable: true,
              indicatorColor: Colors.deepOrangeAccent,
              labelColor: Colors.black,
              dividerColor: Colors.deepOrangeAccent,
              unselectedLabelColor: Colors.grey,
              automaticIndicatorColorAdjustment: true,
              padding: EdgeInsets.only(bottom: 20),
              indicatorWeight: 5,
              tabs: <Widget>[
                Tab(
                  text: 'لالیگا اسپانیا',
                ),
                Tab(
                  text: 'لیگ برتر انگلیس',
                ),
                Tab(
                  text: 'لیگ برتر خلیج فارس',
                ),
                Tab(
                  text: 'لیگ فرانسه',
                ),
                Tab(
                  text: 'بوندس لیگا',
                ),
                Tab(
                  text: 'سری آ ایتالیا',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                TableLeags(),
                Text('Push View 2'),
                Text('Push View 3'),
                Text('Push View 4'),
                Text('Push View 5'),
                Text('Push View 6'),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
