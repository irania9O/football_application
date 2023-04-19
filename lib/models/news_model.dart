// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

News newsFromJson(String str) => News.fromJson(json.decode(str));

String newsToJson(News data) => json.encode(data.toJson());

class News {
  News({
    required this.success,
    required this.meta,
    required this.data,
  });

  bool success;
  Meta meta;
  Data data;

  factory News.fromJson(Map<String, dynamic> json) => News(
        success: json["success"],
        meta: Meta.fromJson(json["meta"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "meta": meta.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.filters,
    required this.news,
  });

  List<dynamic> filters;
  List<NewsElement> news;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        filters: List<dynamic>.from(json["filters"].map((x) => x)),
        news: List<NewsElement>.from(
            json["news"].map((x) => NewsElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "filters": List<dynamic>.from(filters.map((x) => x)),
        "news": List<dynamic>.from(news.map((x) => x.toJson())),
      };
}

class NewsElement {
  NewsElement({
    required this.newsId,
    required this.title,
    required this.source,
    required this.sourceUrl,
    required this.type,
    required this.isHot,
    required this.visit,
    required this.exclusive,
    required this.viewType,
    required this.submitComment,
    required this.isExternal,
    required this.language,
    required this.newsCommentCount,
    required this.updatedAt,
    required this.summary,
    required this.shareLink,
    this.promotion,
    required this.streamUrl,
    this.video,
    this.halfRateSourceUrl,
    this.halfRateStreamUrl,
    required this.newsImage,
    this.newsVideo,
  });

  int newsId;
  String title;
  Source source;
  String sourceUrl;
  int type;
  bool isHot;
  int visit;
  bool exclusive;
  int viewType;
  bool submitComment;
  bool isExternal;
  int language;
  int newsCommentCount;
  int updatedAt;
  String summary;
  String shareLink;
  dynamic promotion;
  String streamUrl;
  Video? video;
  String? halfRateSourceUrl;
  String? halfRateStreamUrl;
  List<NewsImage> newsImage;
  dynamic newsVideo;

  factory NewsElement.fromJson(Map<String, dynamic> json) => NewsElement(
        newsId: json["news_id"],
        title: json["title"],
        source: sourceValues.map[json["source"]]!,
        sourceUrl: json["source_url"],
        type: json["type"],
        isHot: json["is_hot"],
        visit: json["visit"],
        exclusive: json["exclusive"],
        viewType: json["view_type"],
        submitComment: json["submit_comment"],
        isExternal: json["is_external"],
        language: json["language"],
        newsCommentCount: json["news_comment_count"],
        updatedAt: json["updated_at"],
        summary: json["summary"],
        shareLink: json["share_link"],
        promotion: json["promotion"],
        streamUrl: json["stream_url"],
        video: json["video"] == null ? null : Video.fromJson(json["video"]),
        halfRateSourceUrl: json["half_rate_source_url"],
        halfRateStreamUrl: json["half_rate_stream_url"],
        newsImage: List<NewsImage>.from(
            json["news_image"].map((x) => NewsImage.fromJson(x))),
        newsVideo: json["news_video"],
      );

  Map<String, dynamic> toJson() => {
        "news_id": newsId,
        "title": title,
        "source": sourceValues.reverse[source],
        "source_url": sourceUrl,
        "type": type,
        "is_hot": isHot,
        "visit": visit,
        "exclusive": exclusive,
        "view_type": viewType,
        "submit_comment": submitComment,
        "is_external": isExternal,
        "language": language,
        "news_comment_count": newsCommentCount,
        "updated_at": updatedAt,
        "summary": summary,
        "share_link": shareLink,
        "promotion": promotion,
        "stream_url": streamUrl,
        "video": video?.toJson(),
        "half_rate_source_url": halfRateSourceUrl,
        "half_rate_stream_url": halfRateStreamUrl,
        "news_image": List<dynamic>.from(newsImage.map((x) => x.toJson())),
        "news_video": newsVideo,
      };
}

class NewsImage {
  NewsImage({
    required this.isMain,
    required this.url,
  });

  bool isMain;
  String url;

  factory NewsImage.fromJson(Map<String, dynamic> json) => NewsImage(
        isMain: json["is_main"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "is_main": isMain,
        "url": url,
      };
}

enum Source { empty, yahoo_com }

final sourceValues =
    EnumValues({"فوتبالی": Source.empty, "Yahoo.com": Source.yahoo_com});

class Video {
  Video({
    required this.url,
    required this.width,
    required this.height,
    required this.image,
  });

  String url;
  int width;
  int height;
  String image;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        url: json["url"],
        width: json["width"],
        height: json["height"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
        "image": image,
      };
}

class Meta {
  Meta({
    required this.cursor,
    required this.count,
  });

  String cursor;
  int count;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        cursor: json["cursor"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "cursor": cursor,
        "count": count,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
