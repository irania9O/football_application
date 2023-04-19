import 'package:flutter/material.dart';

import '../services/news_service.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);
  static String routeName = '/news';

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  // ignore: prefer_typing_uninitialized_variables, non_constant_identifier_names
  var NewsData;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  fetchNews() async {
    final response2 = await NewsService().fetchNews();
    if (response2 != null) {
      setState(() {
        NewsData = response2;
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? const Text("News")
        : const Center(child: CircularProgressIndicator());
  }
}
