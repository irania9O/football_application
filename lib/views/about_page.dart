import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Future<void> _launchInBrowser(Uri url) async {
  if (!await launchUrl(url)) {
    throw 'Could not launch $url';
  }
}

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);
  static String routeName = '/news';

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const CircleAvatar(
                radius: 100,
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
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text(
                  'این برنامه توسط سیدعلی کمالی ساخته شده است.',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  _launchInBrowser(Uri(
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
                  height: 70,
                  foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text(
                          "Follow me on Github",
                          style: TextStyle(fontSize: 16),
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          // overflow: TextOverflow.ellipsis,
                          // textDirection: TextDirection.center,
                          // textWidthBasis: TextWidthBasis.parent,
                        ),
                      ),
                      SizedBox(width: 20),
                      Icon(
                        FontAwesomeIcons.github,
                        size: 40,
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
                autofocus: false,
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 25, right: 25, top: 10, bottom: 10),
                  padding: const EdgeInsets.all(15),
                  height: 70,
                  foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text(
                          "wwwwwq37@gmail.com",
                          style: TextStyle(fontSize: 16),
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          // overflow: TextOverflow.ellipsis,
                          // textDirection: TextDirection.center,
                          // textWidthBasis: TextWidthBasis.parent,
                        ),
                      ),
                      SizedBox(width: 20),
                      Icon(
                        FontAwesomeIcons.google,
                        size: 40,
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
                  _launchInBrowser(Uri(
                    scheme: 'https',
                    host: 't.me',
                    path: 'irania9O',
                  ));
                },
                autofocus: false,
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 25, right: 25, top: 10, bottom: 10),
                  padding: const EdgeInsets.all(15),
                  height: 70,
                  foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text(
                          "Message me on Telegram",
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Icon(
                        FontAwesomeIcons.telegram,
                        size: 40,
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
                  _launchInBrowser(Uri(
                    scheme: 'https',
                    host: 'instagram.com',
                    path: 'irania9O',
                  ));
                },
                autofocus: false,
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 25, right: 25, top: 10, bottom: 10),
                  padding: const EdgeInsets.all(15),
                  height: 70,
                  foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text(
                          "Follow me on Instagram",
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Icon(
                        FontAwesomeIcons.instagram,
                        size: 40,
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
    );
  }
}
