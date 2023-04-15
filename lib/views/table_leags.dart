import 'package:app/views/home_page.dart';
import 'package:flutter/material.dart';

class TableLeags extends StatefulWidget {
  const TableLeags({Key? key}) : super(key: key);
  static String routeName = '/table';

  @override
  State<TableLeags> createState() => _TableLeagsState();
}

class _TableLeagsState extends State<TableLeags> {
  final int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          elevation: 15,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Container(
              height: 40,
              margin: const EdgeInsets.all(16),
              transform: Matrix4.translationValues(0, -14, 0),
              padding: const EdgeInsets.all(8),
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
              child: Row(
                children: const [
                  Icon(Icons.search),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          selectedIconTheme: const IconThemeData(size: 30),
          unselectedIconTheme: const IconThemeData(size: 25),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.table_chart),
              label: 'Table',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              if (_selectedIndex == index) {
                return;
              } else if (index == 0) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => const HomePage(),
                ));
              } else if (index == 1) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => const TableLeags(),
                ));
              } else if (index == 2) {
                Navigator.pushNamed(context, '/calendar');
              } else if (index == 3) {
                Navigator.pushNamed(context, '/profile');
              }
            });
          },
        ),
        body: ListView(children: [
          const Center(
              child: Text(
            'People-Chart',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )),
          DataTable(
            columns: const [
              DataColumn(
                  label: Text('ID',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Name',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Profession',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Stephen')),
                DataCell(Text('Actor')),
              ]),
              DataRow(cells: [
                DataCell(Text('5')),
                DataCell(Text('John')),
                DataCell(Text('Student')),
              ]),
              DataRow(cells: [
                DataCell(Text('10')),
                DataCell(Text('Harry')),
                DataCell(Text('Leader')),
              ]),
              DataRow(cells: [
                DataCell(Text('15')),
                DataCell(Text('Peter')),
                DataCell(Text('Scientist')),
              ]),
            ],
          ),
        ]));
  }
}
