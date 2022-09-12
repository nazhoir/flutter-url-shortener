// To parse this JSON data, do
//
//     final shortUrlResult = shortUrlResultFromJson(jsonString);

import 'dart:convert';

ShortUrlResult shortUrlResultFromJson(String str) =>
    ShortUrlResult.fromJson(json.decode(str));

String shortUrlResultToJson(ShortUrlResult data) => json.encode(data.toJson());

class ShortUrlResult {
  ShortUrlResult({
    this.shortLink,
    this.warning,
    this.previewLink,
  });

  String? shortLink;
  List<Warning>? warning;
  String? previewLink;

  factory ShortUrlResult.fromJson(Map<String, dynamic> json) => ShortUrlResult(
        shortLink: json["shortLink"],
        warning:
            List<Warning>.from(json["warning"].map((x) => Warning.fromJson(x))),
        previewLink: json["previewLink"],
      );

  Map<String, dynamic> toJson() => {
        "shortLink": shortLink,
        "warning": List<dynamic>.from(warning!.map((x) => x.toJson())),
        "previewLink": previewLink,
      };
}

class Warning {
  Warning({
    this.warningCode,
    this.warningMessage,
  });

  String? warningCode;
  String? warningMessage;

  factory Warning.fromJson(Map<String, dynamic> json) => Warning(
        warningCode: json["warningCode"],
        warningMessage: json["warningMessage"],
      );

  Map<String, dynamic> toJson() => {
        "warningCode": warningCode,
        "warningMessage": warningMessage,
      };
}
