import 'package:app/services/news_detail_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';

class NewsDetailPage extends StatefulWidget {
  final int newsId;
  const NewsDetailPage({Key? key, required this.newsId}) : super(key: key);

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
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
          var document = parse(
              '<body>Hello world! <a href="www.html5rocks.com">HTML5 rocks!');
          print(document);
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
                // Container(
                //   padding: const EdgeInsets.all(5),
                //   margin: const EdgeInsets.all(10),
                //   child: Text(
                //     NewData["data"]["details"]["title"],
                //     textAlign: TextAlign.start,
                //     textDirection: TextDirection.rtl,
                //     style: const TextStyle(
                //       fontSize: 18,
                //     ),
                //   ),
                // ),
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  toolbarHeight: 60,
                  pinned: true,
                  centerTitle: true,
                  title: Text(
                    "${NewData["data"]["details"]["title"]}",
                    style: const TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],

              body: SingleChildScrollView(
                child: Html(
                  data: NewData["data"]["details"]["body"],
                  style: {
                    "body": Style(
                      fontSize: const FontSize(18.0),
                      textAlign: TextAlign.right,
                      direction: TextDirection.rtl,
                      padding: const EdgeInsets.all(10),
                    ),
                  },
                ),
              ),
              // body: Column(
              //   children: [
              //     Container(
              //       padding: const EdgeInsets.all(5),
              //       margin: const EdgeInsets.all(10),
              //       child: Text(
              //         NewData["data"]["details"]["title"],
              //         textAlign: TextAlign.start,
              //         textDirection: TextDirection.rtl,
              //         style: const TextStyle(
              //           fontSize: 18,
              //         ),
              //       ),
              //     ),

              //   ],
              // ),
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
