import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);
  static String routeName = '/news';

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('images/profile.jpg'),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text(
                    'درباره ما',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: const Text(
                    'این برنامه توسط سیدعلی کمالی ساخته شده است.',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    launchUrl(Uri(
                      scheme: 'https',
                      host: 'github.com',
                      path: 'irania9O',
                    ));
                  },
                  autofocus: false,
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 25, right: 25, top: 10, bottom: 10),
                    padding: const EdgeInsets.all(15),
                    height: 60,
                    foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Follow me on Github",
                            style: TextStyle(fontSize: 14),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 20),
                        Icon(
                          FontAwesomeIcons.github,
                          size: 30,
                          color: Colors.deepOrange,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    launchUrl(Uri(
                        scheme: 'mailto',
                        path: 'wwwwwq37@gmail.com',
                        queryParameters: {'subject': 'فوتبالو!'}));
                  },
                  autofocus: false,
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 25, right: 25, top: 10, bottom: 10),
                    padding: const EdgeInsets.all(15),
                    height: 60,
                    foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Text(
                            "wwwwwq37@gmail.com",
                            style: TextStyle(fontSize: 14),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 20),
                        Icon(
                          FontAwesomeIcons.google,
                          size: 30,
                          color: Colors.deepOrange,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    launchUrl(Uri(
                      scheme: 'tg',
                      host: 'resolve',
                      queryParameters: {'domain': 'irania9O'},
                    ));
                  },
                  autofocus: false,
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 25, right: 25, top: 10, bottom: 10),
                    padding: const EdgeInsets.all(15),
                    height: 60,
                    foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Message me on Telegram",
                            style: TextStyle(fontSize: 14),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(
                          FontAwesomeIcons.telegram,
                          size: 30,
                          color: Colors.deepOrange,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    launchUrl(Uri(
                      scheme: 'instagram',
                      host: 'user',
                      queryParameters: {'username': 'irania9O'},
                    ));
                  },
                  autofocus: false,
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 25, right: 25, top: 10, bottom: 10),
                    padding: const EdgeInsets.all(15),
                    height: 60,
                    foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Follow me on Instagram",
                            style: TextStyle(fontSize: 14),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(
                          FontAwesomeIcons.instagram,
                          size: 30,
                          color: Colors.deepOrange,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
