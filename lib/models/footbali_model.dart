// To parse this JSON data, do
//
//     final football = footballFromJson(jsonString);

import 'dart:convert';

Football footballFromJson(String str) => Football.fromJson(json.decode(str));

String footballToJson(Football data) => json.encode(data.toJson());

class Football {
  Football({
    required this.success,
    required this.data,
  });

  bool success;
  Data data;

  factory Football.fromJson(Map<String, dynamic> json) => Football(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.currentTab,
    required this.tabs,
    required this.competitionMatches,
    required this.stories,
    required this.liveBox,
  });

  String currentTab;
  List<Tab> tabs;
  List<Competition> competitionMatches;
  List<Story> stories;
  LiveBox liveBox;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentTab: json["current_tab"],
        tabs: List<Tab>.from(json["tabs"].map((x) => Tab.fromJson(x))),
        competitionMatches: List<Competition>.from(
            json["competition_matches"].map((x) => Competition.fromJson(x))),
        stories:
            List<Story>.from(json["stories"].map((x) => Story.fromJson(x))),
        liveBox: LiveBox.fromJson(json["live_box"]),
      );

  Map<String, dynamic> toJson() => {
        "current_tab": currentTab,
        "tabs": List<dynamic>.from(tabs.map((x) => x.toJson())),
        "competition_matches":
            List<dynamic>.from(competitionMatches.map((x) => x.toJson())),
        "stories": List<dynamic>.from(stories.map((x) => x.toJson())),
        "live_box": liveBox.toJson(),
      };
}

class CompetitionMatchMatch {
  CompetitionMatchMatch({
    required this.matchId,
    required this.homeTeamId,
    required this.awayTeamId,
    required this.competitionId,
    required this.homeTeamScore,
    required this.awayTeamScore,
    required this.homeTeamPen,
    required this.awayTeamPen,
    this.liveUrl,
    this.week,
    required this.hasEvent,
    required this.hasLineup,
    required this.hasFacts,
    this.stadiumId,
    required this.timestamp,
    required this.currentPeriod,
    required this.matchStarted,
    required this.hasPrediction,
    required this.tvChannel,
    required this.predictable,
    this.oldStatus,
    this.liveStreamUrl,
    required this.hasVideo,
    required this.matchEnded,
    required this.hasNews,
    required this.useTimestamp,
    required this.dateText,
    required this.hasLive,
    required this.shortDateText,
    required this.midDateText,
    required this.weekNumber,
    required this.hasDetails,
    required this.hasHeadToHead,
    required this.longDateText,
    required this.showStreamLogo,
    this.calendarText,
    required this.location,
    this.challenge,
    required this.status,
    this.videosMinimal,
    this.channel,
    required this.periods,
    this.stadium,
    required this.homeTeam,
    required this.awayTeam,
    required this.competition,
    this.stage,
    required this.news,
  });

  int matchId;
  int homeTeamId;
  int awayTeamId;
  int competitionId;
  int homeTeamScore;
  int awayTeamScore;
  int homeTeamPen;
  int awayTeamPen;
  dynamic liveUrl;
  String? week;
  bool hasEvent;
  bool hasLineup;
  bool hasFacts;
  int? stadiumId;
  int timestamp;
  int currentPeriod;
  bool matchStarted;
  bool hasPrediction;
  int tvChannel;
  bool predictable;
  dynamic oldStatus;
  dynamic liveStreamUrl;
  bool hasVideo;
  bool matchEnded;
  bool hasNews;
  bool useTimestamp;
  String dateText;
  bool hasLive;
  DateText shortDateText;
  DateText midDateText;
  int weekNumber;
  bool hasDetails;
  bool hasHeadToHead;
  DateText longDateText;
  bool showStreamLogo;
  dynamic calendarText;
  Location location;
  dynamic challenge;
  String status;
  dynamic videosMinimal;
  Channel? channel;
  List<dynamic> periods;
  Stadium? stadium;
  Team homeTeam;
  Team awayTeam;
  Competition competition;
  dynamic stage;
  List<dynamic> news;

  factory CompetitionMatchMatch.fromJson(Map<String, dynamic> json) =>
      CompetitionMatchMatch(
        matchId: json["match_id"],
        homeTeamId: json["home_team_id"],
        awayTeamId: json["away_team_id"],
        competitionId: json["competition_id"],
        homeTeamScore: json["home_team_score"],
        awayTeamScore: json["away_team_score"],
        homeTeamPen: json["home_team_pen"],
        awayTeamPen: json["away_team_pen"],
        liveUrl: json["live_url"],
        week: json["week"],
        hasEvent: json["has_event"],
        hasLineup: json["has_lineup"],
        hasFacts: json["has_facts"],
        stadiumId: json["stadium_id"],
        timestamp: json["timestamp"],
        currentPeriod: json["current_period"],
        matchStarted: json["match_started"],
        hasPrediction: json["has_prediction"],
        tvChannel: json["tv_channel"],
        predictable: json["predictable"],
        oldStatus: json["old_status"],
        liveStreamUrl: json["live_stream_url"],
        hasVideo: json["has_video"],
        matchEnded: json["match_ended"],
        hasNews: json["has_news"],
        useTimestamp: json["use_timestamp"],
        dateText: json["date_text"],
        hasLive: json["has_live"],
        shortDateText: dateTextValues.map[json["short_date_text"]]!,
        midDateText: dateTextValues.map[json["mid_date_text"]]!,
        weekNumber: json["week_number"],
        hasDetails: json["has_details"],
        hasHeadToHead: json["has_head_to_head"],
        longDateText: dateTextValues.map[json["long_date_text"]]!,
        showStreamLogo: json["show_stream_logo"],
        calendarText: json["calendar_text"],
        location: Location.fromJson(json["location"]),
        challenge: json["challenge"],
        status: json["status"],
        videosMinimal: json["videos_minimal"],
        channel:
            json["channel"] == null ? null : Channel.fromJson(json["channel"]),
        periods: List<dynamic>.from(json["periods"].map((x) => x)),
        stadium:
            json["stadium"] == null ? null : Stadium.fromJson(json["stadium"]),
        homeTeam: Team.fromJson(json["home_team"]),
        awayTeam: Team.fromJson(json["away_team"]),
        competition: Competition.fromJson(json["competition"]),
        stage: json["stage"],
        news: List<dynamic>.from(json["news"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "match_id": matchId,
        "home_team_id": homeTeamId,
        "away_team_id": awayTeamId,
        "competition_id": competitionId,
        "home_team_score": homeTeamScore,
        "away_team_score": awayTeamScore,
        "home_team_pen": homeTeamPen,
        "away_team_pen": awayTeamPen,
        "live_url": liveUrl,
        "week": week,
        "has_event": hasEvent,
        "has_lineup": hasLineup,
        "has_facts": hasFacts,
        "stadium_id": stadiumId,
        "timestamp": timestamp,
        "current_period": currentPeriod,
        "match_started": matchStarted,
        "has_prediction": hasPrediction,
        "tv_channel": tvChannel,
        "predictable": predictable,
        "old_status": oldStatus,
        "live_stream_url": liveStreamUrl,
        "has_video": hasVideo,
        "match_ended": matchEnded,
        "has_news": hasNews,
        "use_timestamp": useTimestamp,
        "date_text": dateText,
        "has_live": hasLive,
        "short_date_text": dateTextValues.reverse[shortDateText],
        "mid_date_text": dateTextValues.reverse[midDateText],
        "week_number": weekNumber,
        "has_details": hasDetails,
        "has_head_to_head": hasHeadToHead,
        "long_date_text": dateTextValues.reverse[longDateText],
        "show_stream_logo": showStreamLogo,
        "calendar_text": calendarText,
        "location": location.toJson(),
        "challenge": challenge,
        "status": status,
        "videos_minimal": videosMinimal,
        "channel": channel?.toJson(),
        "periods": List<dynamic>.from(periods.map((x) => x)),
        "stadium": stadium?.toJson(),
        "home_team": homeTeam.toJson(),
        "away_team": awayTeam.toJson(),
        "competition": competition.toJson(),
        "stage": stage,
        "news": List<dynamic>.from(news.map((x) => x)),
      };
}

class Competition {
  Competition({
    required this.competitionId,
    required this.sort,
    required this.nameEn,
    required this.nameFa,
    required this.hasTopscorer,
    required this.hasKnockoutStage,
    required this.logo,
    required this.hasStanding,
    required this.hasTransfer,
    required this.stickToTop,
    required this.order,
    required this.localizedName,
    this.matches,
  });

  int competitionId;
  int sort;
  String nameEn;
  String nameFa;
  bool hasTopscorer;
  bool hasKnockoutStage;
  String logo;
  bool hasStanding;
  bool hasTransfer;
  bool stickToTop;
  int order;
  String localizedName;
  List<CompetitionMatchMatch>? matches;

  factory Competition.fromJson(Map<String, dynamic> json) => Competition(
        competitionId: json["competition_id"],
        sort: json["sort"],
        nameEn: json["name_en"],
        nameFa: json["name_fa"],
        hasTopscorer: json["has_topscorer"],
        hasKnockoutStage: json["has_knockout_stage"],
        logo: json["logo"],
        hasStanding: json["has_standing"],
        hasTransfer: json["has_transfer"],
        stickToTop: json["stick_to_top"],
        order: json["order"],
        localizedName: json["localized_name"],
        matches: json["matches"] == null
            ? []
            : List<CompetitionMatchMatch>.from(
                json["matches"]!.map((x) => CompetitionMatchMatch.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "competition_id": competitionId,
        "sort": sort,
        "name_en": nameEn,
        "name_fa": nameFa,
        "has_topscorer": hasTopscorer,
        "has_knockout_stage": hasKnockoutStage,
        "logo": logo,
        "has_standing": hasStanding,
        "has_transfer": hasTransfer,
        "stick_to_top": stickToTop,
        "order": order,
        "localized_name": localizedName,
        "matches": matches == null
            ? []
            : List<dynamic>.from(matches!.map((x) => x.toJson())),
      };
}

class Team {
  Team({
    required this.teamId,
    required this.nameEn,
    required this.nameFa,
    required this.isNational,
    this.hasTransfer,
    this.country,
    required this.logo,
    required this.localizedName,
  });

  int teamId;
  String nameEn;
  String nameFa;
  bool isNational;
  bool? hasTransfer;
  String? country;
  String logo;
  String localizedName;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        teamId: json["team_id"],
        nameEn: json["name_en"],
        nameFa: json["name_fa"],
        isNational: json["is_national"],
        hasTransfer: json["has_transfer"],
        country: json["country"],
        logo: json["logo"],
        localizedName: json["localized_name"],
      );

  Map<String, dynamic> toJson() => {
        "team_id": teamId,
        "name_en": nameEn,
        "name_fa": nameFa,
        "is_national": isNational,
        "has_transfer": hasTransfer,
        "country": country,
        "logo": logo,
        "localized_name": localizedName,
      };
}

class Channel {
  Channel({
    required this.id,
    required this.nameFa,
    required this.image,
  });

  int id;
  String nameFa;
  String image;

  factory Channel.fromJson(Map<String, dynamic> json) => Channel(
        id: json["id"],
        nameFa: json["name_fa"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_fa": nameFa,
        "image": image,
      };
}

class Location {
  Location({
    this.nameEn,
    this.nameFa,
    this.lat,
    this.long,
  });

  String? nameEn;
  dynamic nameFa;
  dynamic lat;
  dynamic long;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        nameEn: json["name_en"],
        nameFa: json["name_fa"],
        lat: json["lat"],
        long: json["long"],
      );

  Map<String, dynamic> toJson() => {
        "name_en": nameEn,
        "name_fa": nameFa,
        "lat": lat,
        "long": long,
      };
}

enum DateText { empty }

final dateTextValues = EnumValues({"امروز": DateText.empty});

class Stadium {
  Stadium({
    required this.id,
    required this.nameEn,
    required this.nameFa,
    this.description,
    required this.image,
    required this.localizedName,
  });

  int id;
  String nameEn;
  String nameFa;
  dynamic description;
  String image;
  String localizedName;

  factory Stadium.fromJson(Map<String, dynamic> json) => Stadium(
        id: json["id"],
        nameEn: json["name_en"],
        nameFa: json["name_fa"],
        description: json["description"],
        image: json["image"],
        localizedName: json["localized_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_en": nameEn,
        "name_fa": nameFa,
        "description": description,
        "image": image,
        "localized_name": localizedName,
      };
}

class LiveBox {
  LiveBox({
    required this.enable,
    required this.type,
    required this.headLine,
    this.title,
    this.description,
    this.imageUrl,
    this.matchId,
    this.newsId,
    this.news,
    required this.matches,
  });

  bool enable;
  int type;
  String headLine;
  dynamic title;
  dynamic description;
  dynamic imageUrl;
  dynamic matchId;
  dynamic newsId;
  dynamic news;
  List<LiveBoxMatch> matches;

  factory LiveBox.fromJson(Map<String, dynamic> json) => LiveBox(
        enable: json["enable"],
        type: json["type"],
        headLine: json["head_line"],
        title: json["title"],
        description: json["description"],
        imageUrl: json["image_url"],
        matchId: json["match_id"],
        newsId: json["news_id"],
        news: json["news"],
        matches: List<LiveBoxMatch>.from(
            json["matches"].map((x) => LiveBoxMatch.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "enable": enable,
        "type": type,
        "head_line": headLine,
        "title": title,
        "description": description,
        "image_url": imageUrl,
        "match_id": matchId,
        "news_id": newsId,
        "news": news,
        "matches": List<dynamic>.from(matches.map((x) => x.toJson())),
      };
}

class LiveBoxMatch {
  LiveBoxMatch({
    required this.matchId,
    required this.homeTeamId,
    required this.awayTeamId,
    required this.currentPeriod,
    required this.submitComment,
    this.liveUrl,
    this.week,
    required this.timestamp,
    required this.matchStarted,
    required this.hasPrediction,
    this.tvChannel,
    required this.predictable,
    this.oldStatus,
    this.liveStreamUrl,
    required this.hasVideo,
    required this.matchEnded,
    required this.hasNews,
    required this.useTimestamp,
    required this.dateText,
    required this.hasLive,
    required this.shortDateText,
    required this.midDateText,
    required this.weekNumber,
    required this.hasDetails,
    required this.hasHeadToHead,
    required this.longDateText,
    required this.showStreamLogo,
    this.calendarText,
    required this.location,
    this.challenge,
    required this.status,
    required this.homeTeam,
    required this.awayTeam,
    this.stage,
    required this.news,
  });

  int matchId;
  int homeTeamId;
  int awayTeamId;
  int currentPeriod;
  int submitComment;
  dynamic liveUrl;
  dynamic week;
  int timestamp;
  bool matchStarted;
  bool hasPrediction;
  dynamic tvChannel;
  bool predictable;
  dynamic oldStatus;
  dynamic liveStreamUrl;
  bool hasVideo;
  bool matchEnded;
  bool hasNews;
  bool useTimestamp;
  String dateText;
  bool hasLive;
  DateText shortDateText;
  DateText midDateText;
  int weekNumber;
  bool hasDetails;
  bool hasHeadToHead;
  DateText longDateText;
  bool showStreamLogo;
  dynamic calendarText;
  Location location;
  dynamic challenge;
  String status;
  Team homeTeam;
  Team awayTeam;
  dynamic stage;
  List<dynamic> news;

  factory LiveBoxMatch.fromJson(Map<String, dynamic> json) => LiveBoxMatch(
        matchId: json["match_id"],
        homeTeamId: json["home_team_id"],
        awayTeamId: json["away_team_id"],
        currentPeriod: json["current_period"],
        submitComment: json["submit_comment"],
        liveUrl: json["live_url"],
        week: json["week"],
        timestamp: json["timestamp"],
        matchStarted: json["match_started"],
        hasPrediction: json["has_prediction"],
        tvChannel: json["tv_channel"],
        predictable: json["predictable"],
        oldStatus: json["old_status"],
        liveStreamUrl: json["live_stream_url"],
        hasVideo: json["has_video"],
        matchEnded: json["match_ended"],
        hasNews: json["has_news"],
        useTimestamp: json["use_timestamp"],
        dateText: json["date_text"],
        hasLive: json["has_live"],
        shortDateText: dateTextValues.map[json["short_date_text"]]!,
        midDateText: dateTextValues.map[json["mid_date_text"]]!,
        weekNumber: json["week_number"],
        hasDetails: json["has_details"],
        hasHeadToHead: json["has_head_to_head"],
        longDateText: dateTextValues.map[json["long_date_text"]]!,
        showStreamLogo: json["show_stream_logo"],
        calendarText: json["calendar_text"],
        location: Location.fromJson(json["location"]),
        challenge: json["challenge"],
        status: json["status"],
        homeTeam: Team.fromJson(json["home_team"]),
        awayTeam: Team.fromJson(json["away_team"]),
        stage: json["stage"],
        news: List<dynamic>.from(json["news"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "match_id": matchId,
        "home_team_id": homeTeamId,
        "away_team_id": awayTeamId,
        "current_period": currentPeriod,
        "submit_comment": submitComment,
        "live_url": liveUrl,
        "week": week,
        "timestamp": timestamp,
        "match_started": matchStarted,
        "has_prediction": hasPrediction,
        "tv_channel": tvChannel,
        "predictable": predictable,
        "old_status": oldStatus,
        "live_stream_url": liveStreamUrl,
        "has_video": hasVideo,
        "match_ended": matchEnded,
        "has_news": hasNews,
        "use_timestamp": useTimestamp,
        "date_text": dateText,
        "has_live": hasLive,
        "short_date_text": dateTextValues.reverse[shortDateText],
        "mid_date_text": dateTextValues.reverse[midDateText],
        "week_number": weekNumber,
        "has_details": hasDetails,
        "has_head_to_head": hasHeadToHead,
        "long_date_text": dateTextValues.reverse[longDateText],
        "show_stream_logo": showStreamLogo,
        "calendar_text": calendarText,
        "location": location.toJson(),
        "challenge": challenge,
        "status": status,
        "home_team": homeTeam.toJson(),
        "away_team": awayTeam.toJson(),
        "stage": stage,
        "news": List<dynamic>.from(news.map((x) => x)),
      };
}

class Story {
  Story({
    required this.id,
    required this.title,
    required this.type,
    required this.cover,
    required this.media,
    required this.visits,
    required this.createdAt,
    required this.shareLink,
    required this.halfRateMedia,
  });

  int id;
  String title;
  int type;
  String cover;
  List<String> media;
  int visits;
  String createdAt;
  String shareLink;
  List<String> halfRateMedia;

  factory Story.fromJson(Map<String, dynamic> json) => Story(
        id: json["id"],
        title: json["title"],
        type: json["type"],
        cover: json["cover"],
        media: List<String>.from(json["media"].map((x) => x)),
        visits: json["visits"],
        createdAt: json["created_at"],
        shareLink: json["share_link"],
        halfRateMedia: List<String>.from(json["half_rate_media"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "type": type,
        "cover": cover,
        "media": List<dynamic>.from(media.map((x) => x)),
        "visits": visits,
        "created_at": createdAt,
        "share_link": shareLink,
        "half_rate_media": List<dynamic>.from(halfRateMedia.map((x) => x)),
      };
}

class Tab {
  Tab({
    required this.id,
    required this.title,
    required this.date,
    this.hasLiveStream,
  });

  String id;
  String title;
  DateTime date;
  bool? hasLiveStream;

  factory Tab.fromJson(Map<String, dynamic> json) => Tab(
        id: json["id"],
        title: json["title"],
        date: DateTime.parse(json["date"]),
        hasLiveStream: json["has_live_stream"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "has_live_stream": hasLiveStream,
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
