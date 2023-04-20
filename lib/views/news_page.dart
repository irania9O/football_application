import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';

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
  int cursor = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  final controller = ScrollController();
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        fetchMoreData();
      }
    });
    fetchFirstData();
  }

  fetchFirstData() async {
    NewsData = await fetchNews(cursor);
    if (NewsData != null) {
      setState(() {
        cursor = int.parse(NewsData['meta']['cursor']);
        isLoaded = true;
      });
    }
  }

  fetchMoreData() async {
    var moreData = await fetchNews(cursor);
    if (moreData != null) {
      setState(() {
        cursor = int.parse(moreData['meta']['cursor']);
        NewsData['data']['news'].addAll(moreData['data']['news']);
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView.builder(
              controller: controller,
              itemCount: NewsData['data']['news'].length + 1,
              itemBuilder: (context, index) {
                if (index < NewsData['data']['news'].length) {
                  if (NewsData['data']['news'][index]['language'] != 1) {
                    return const SizedBox();
                  }
                  JalaliFormatter timepost = Jalali.fromDateTime(
                    DateTime.fromMillisecondsSinceEpoch(
                      NewsData['data']['news'][index]['updated_at'] * 1000,
                    ),
                  ).formatter;
                  return InkWell(
                    highlightColor: Colors.deepOrangeAccent,
                    hoverColor: Colors.deepOrange,
                    splashColor: Colors.white,
                    // onTap: () {
                    //   print(competitions[index].homeTeam.nameEn);
                    // },
                    autofocus: false,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(15),
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          opacity: 0.1,
                          image: NetworkImage(
                            NewsData['data']['news'][index]['news_image'][0]
                                ['url'],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      foregroundDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    NewsData['data']['news'][index]['title'],
                                    style: const TextStyle(fontSize: 16),
                                    maxLines: 3,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    textDirection: TextDirection.rtl,
                                    textWidthBasis: TextWidthBasis.parent,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  "${timepost.d} ${timepost.mN} ${timepost.y}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.start,
                                  textDirection: TextDirection.rtl,
                                  textWidthBasis: TextWidthBasis.parent,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: NetworkImage(
                                  NewsData['data']['news'][index]['news_image']
                                      [0]['url'],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.deepOrangeAccent,
                          strokeWidth: 7,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.deepOrangeAccent),
                        ),
                      ),
                    ),
                  );
                }
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
