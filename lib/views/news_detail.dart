import 'package:app/services/news_detail_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class NewsDetailPage extends StatefulWidget {
  final int newsId;
  const NewsDetailPage({Key? key, required this.newsId}) : super(key: key);

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
  var NewData;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    fetchDataDetail();
  }

  fetchDataDetail() async {
    try {
      NewData = await fetchNews(widget.newsId);

      if (NewData != null) {
        setState(() {
          isLoaded = true;
        });
      }
    } catch (e) {
      fetchDataDetail();
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? Scaffold(
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                    expandedHeight: 400,
                    iconTheme: const IconThemeData(
                      color: Colors.deepOrange,
                    ),
                    toolbarHeight: 60,
                    floating: false,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      expandedTitleScale: 1,
                      background: Image.network(
                        NewData["data"]["details"]["news_image"][0]["url"],
                        fit: BoxFit.cover,
                      ),
                    )),
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    child: Text(
                      NewData["data"]["details"]["title"],
                      textAlign: TextAlign.start,
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                          color: Colors.deepOrangeAccent,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(5),
                child: HtmlWidget(
                  NewData["data"]["details"]["body"],
                  textStyle: const TextStyle(
                    fontSize: 18,
                  ),
                  customStylesBuilder: (element) {
                    if (element.localName == 'p') {
                      return {
                        'direction': 'rtl',
                        'textAlign': 'right',
                        'padding': '8px',
                      };
                    }
                    return null;
                  },
                  customWidgetBuilder: (element) {
                    if (element.localName == 'img') {
                      return Image.network(
                        element.attributes['src']!,
                        fit: BoxFit.cover,
                      );
                    }
                    return null;
                  },
                ),
              ),
            ),
          )
        : Scaffold(
            body: Center(
              child: Scaffold(
                appBar: AppBar(
                    title: const Text('فوتبالو',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    backgroundColor: Colors.deepOrangeAccent,
                    centerTitle: true,
                    elevation: 10,
                    toolbarHeight: 60,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(100, 100)),
                    )),
                body: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.deepOrangeAccent,
                    strokeWidth: 7,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent),
                  ),
                ),
              ),
            ),
          );
  }
}
