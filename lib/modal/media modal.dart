// To parse this JSON data, do
//
//     final musicModal = musicModalFromJson(jsonString);

import 'dart:convert';

MusicModal musicModalFromJson(String str) => MusicModal.fromJson(json.decode(str));

String musicModalToJson(MusicModal data) => json.encode(data.toJson());

class MusicModal {
  bool success;
  Data data;

  MusicModal({
    required this.success,
    required this.data,
  });

  factory MusicModal.fromJson(Map<String, dynamic> json) => MusicModal(
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
  };
}

class Data {
  int total;
  int start;
  List<Result> results;

  Data({
    required this.total,
    required this.start,
    required this.results,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    total: json["total"],
    start: json["start"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "start": start,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  String id;
  String name;
  ResultType type;
  String year;
  dynamic releaseDate;
  int duration;
  String label;
  bool explicitContent;
  int playCount;
  Language language;
  bool hasLyrics;
  dynamic lyricsId;
  String url;
  String copyright;
  Album album;
  Artists artists;
  List<DownloadUrl> image;
  List<DownloadUrl> downloadUrl;

  Result({
    required this.id,
    required this.name,
    required this.type,
    required this.year,
    required this.releaseDate,
    required this.duration,
    required this.label,
    required this.explicitContent,
    required this.playCount,
    required this.language,
    required this.hasLyrics,
    required this.lyricsId,
    required this.url,
    required this.copyright,
    required this.album,
    required this.artists,
    required this.image,
    required this.downloadUrl,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
    type: resultTypeValues.map[json["type"]]!,
    year: json["year"],
    releaseDate: json["releaseDate"],
    duration: json["duration"],
    label: json["label"],
    explicitContent: json["explicitContent"],
    playCount: json["playCount"],
    language: languageValues.map[json["language"]]!,
    hasLyrics: json["hasLyrics"],
    lyricsId: json["lyricsId"],
    url: json["url"],
    copyright: json["copyright"],
    album: Album.fromJson(json["album"]),
    artists: Artists.fromJson(json["artists"]),
    image: List<DownloadUrl>.from(json["image"].map((x) => DownloadUrl.fromJson(x))),
    downloadUrl: List<DownloadUrl>.from(json["downloadUrl"].map((x) => DownloadUrl.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": resultTypeValues.reverse[type],
    "year": year,
    "releaseDate": releaseDate,
    "duration": duration,
    "label": label,
    "explicitContent": explicitContent,
    "playCount": playCount,
    "language": languageValues.reverse[language],
    "hasLyrics": hasLyrics,
    "lyricsId": lyricsId,
    "url": url,
    "copyright": copyright,
    "album": album.toJson(),
    "artists": artists.toJson(),
    "image": List<dynamic>.from(image.map((x) => x.toJson())),
    "downloadUrl": List<dynamic>.from(downloadUrl.map((x) => x.toJson())),
  };
}

class Album {
  String id;
  String name;
  String url;

  Album({
    required this.id,
    required this.name,
    required this.url,
  });

  factory Album.fromJson(Map<String, dynamic> json) => Album(
    id: json["id"],
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "url": url,
  };
}

class Artists {
  List<All>? primary;
  List<dynamic>? featured;
  List<All>? all;

  Artists({
    this.primary,
    this.featured,
    this.all,
  });

  factory Artists.fromJson(Map<String, dynamic> json) => Artists(
    primary: json["primary"] == null ? [] : List<All>.from(json["primary"]!.map((x) => All.fromJson(x))),
    featured: json["featured"] == null ? [] : List<dynamic>.from(json["featured"]!.map((x) => x)),
    all: json["all"] == null ? [] : List<All>.from(json["all"]!.map((x) => All.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "primary": primary == null ? [] : List<dynamic>.from(primary!.map((x) => x.toJson())),
    "featured": featured == null ? [] : List<dynamic>.from(featured!.map((x) => x)),
    "all": all == null ? [] : List<dynamic>.from(all!.map((x) => x.toJson())),
  };
}

class All {
  String id;
  String name;
  Role role;
  List<DownloadUrl> image;
  AllType type;
  String url;

  All({
    required this.id,
    required this.name,
    required this.role,
    required this.image,
    required this.type,
    required this.url,
  });

  factory All.fromJson(Map<String, dynamic> json) => All(
    id: json["id"],
    name: json["name"],
    role: roleValues.map[json["role"]]!,
    image: List<DownloadUrl>.from(json["image"].map((x) => DownloadUrl.fromJson(x))),
    type: allTypeValues.map[json["type"]]!,
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "role": roleValues.reverse[role],
    "image": List<dynamic>.from(image.map((x) => x.toJson())),
    "type": allTypeValues.reverse[type],
    "url": url,
  };
}

class DownloadUrl {
  Quality quality;
  String url;

  DownloadUrl({
    required this.quality,
    required this.url,
  });

  factory DownloadUrl.fromJson(Map<String, dynamic> json) => DownloadUrl(
    quality: qualityValues.map[json["quality"]]!,
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "quality": qualityValues.reverse[quality],
    "url": url,
  };
}

enum Quality {
  THE_12_KBPS,
  THE_150_X150,
  THE_160_KBPS,
  THE_320_KBPS,
  THE_48_KBPS,
  THE_500_X500,
  THE_50_X50,
  THE_96_KBPS
}

final qualityValues = EnumValues({
  "12kbps": Quality.THE_12_KBPS,
  "150x150": Quality.THE_150_X150,
  "160kbps": Quality.THE_160_KBPS,
  "320kbps": Quality.THE_320_KBPS,
  "48kbps": Quality.THE_48_KBPS,
  "500x500": Quality.THE_500_X500,
  "50x50": Quality.THE_50_X50,
  "96kbps": Quality.THE_96_KBPS
});

enum Role {
  LYRICIST,
  MUSIC,
  PRIMARY_ARTISTS,
  SINGER,
  STARRING
}

final roleValues = EnumValues({
  "lyricist": Role.LYRICIST,
  "music": Role.MUSIC,
  "primary_artists": Role.PRIMARY_ARTISTS,
  "singer": Role.SINGER,
  "starring": Role.STARRING
});

enum AllType {
  ARTIST
}

final allTypeValues = EnumValues({
  "artist": AllType.ARTIST
});

enum Language {
  HINDI
}

final languageValues = EnumValues({
  "hindi": Language.HINDI
});

enum ResultType {
  SONG
}

final resultTypeValues = EnumValues({
  "song": ResultType.SONG
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
