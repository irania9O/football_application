import 'package:app/views/about_page.dart';
// import 'package:app/views/home_page.dart';
import 'package:app/views/leage_page.dart';
import 'package:app/views/news_page.dart';
import 'package:app/views/table_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// handle named routes

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Vazir',
        primaryColor: Colors.white,
        canvasColor: Colors.white,
        cardColor: Colors.amber[100],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
          bodySmall: TextStyle(color: Colors.black),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            iconColor: MaterialStateProperty.all(Colors.black),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        fontFamily: 'Vazir',
        primaryColor: Colors.black,
        canvasColor: Colors.black,
        cardColor: Colors.grey,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          foregroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.black),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            iconColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      themeMode: ThemeMode.light,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 3;
  final dynamic _pages = [
    const TablePage(),
    const LeagePage(),
    const NewsPage(),
    const AboutPage(),
  ].reversed.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('فوتبالو',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: Colors.deepOrangeAccent,
          centerTitle: true,
          elevation: 10,
          toolbarHeight: 60,
          shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.vertical(bottom: Radius.elliptical(100, 100)),
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 5, left: 5, right: 5),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        selectedIconTheme: const IconThemeData(size: 25),
        unselectedIconTheme: const IconThemeData(size: 25),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        // revese the order of the items
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.futbol),
            label: 'بازی های امروز',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.tableList),
            label: 'جدول لیگ ها',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.newspaper),
            label: 'اخبار',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.circleInfo),
            label: 'درباره ما',
          ),
        ].reversed.toList(),
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
