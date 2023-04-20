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
    fetchFirstData();
  }

  fetchFirstData() async {
    NewsData = await fetchNews(100);
    if (NewsData != null) {
      setState(() {
        print(NewsData['data']['news'].length);
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView.builder(
              itemCount: NewsData['data']['news'].length,
              itemBuilder: (context, index) {
                if (NewsData['data']['news'][index]['language'] != 1) {
                  return const SizedBox();
                }
                return Card(
                  child: ListTile(
                    leading: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                        image: DecorationImage(
                          image: NetworkImage(
                            NewsData['data']['news'][index]['news_image'][0]
                                ['url'],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        NewsData['data']['news'][index]['title'],
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: Text(NewsData['data']['news'][index]['summary'],
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                    contentPadding: const EdgeInsets.all(12),
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
  }
}
