import 'package:app/views/home_page.dart';
import 'package:app/views/table_leags.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// handle named routes

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
      // routes: {
      //   HomePage.routeName: (context) => const HomePage(),
      //   TableLeags.routeName: (context) => const TableLeags(),
      // },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final dynamic _pages = [
    const HomePage(),
    const TableLeags(),
    const HomePage(),
    const HomePage(),
  ];
  // final List _pages = [
  //   const HomePage(),
  //   const TableLeags(),
  //   const HomePage(),
  //   const HomePage(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Footballo'),
          backgroundColor: Colors.deepOrangeAccent,
          centerTitle: true,
          elevation: 10,
          toolbarHeight: 65,
          shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.vertical(bottom: Radius.elliptical(100, 100)),
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        selectedIconTheme: const IconThemeData(size: 30),
        unselectedIconTheme: const IconThemeData(size: 25),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        // revese the order of the items
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'خانه',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart),
            label: 'جدول لیگ ها',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'تاریخچه',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'پروفایل',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
