import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:socket_io_constants/src/enum/io_content_type.dart';
import 'package:socket_io_constants/src/extension/enum_extension.dart';

class Content<T> {
  Content({this.type, this.data});

  IOContentType? type;
  T? data;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
      type: json["type"] != null ? (json['type'] as String).enumValueFromString(IOContentType.values) : json['type'],
      data: json["data"] != null ? convertMapToObject<T>(json['data']) : json["data"]);

  Map<String, dynamic> toJson() => {"type": type?.enumValueToString(), "data": jsonEncode(data)};
}

class Chat {
  Chat({
    this.id,
    this.fromUserId,
    this.toUserId,
    this.message,
    this.dateTime,
    this.isReceived,
    this.isSeen,
    this.isSent,
  });

  int? id;
  int? fromUserId;
  int? toUserId;
  String? message;
  DateTime? dateTime;
  bool? isReceived;
  bool? isSeen;
  bool? isSent;

  factory Chat.fromRawJson(String str) => Chat.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        id: json["id"],
        fromUserId: json["fromUserId"],
        toUserId: json["toUserId"],
        message: json["message"],
        dateTime: json["dateTime"] != null ? DateFormat("yyyy-MM-dd HH:mm:ss").parse(json["dateTime"]) : null,
        isReceived: json["isReceived"],
        isSeen: json["isSeen"],
        isSent: json["isSent"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fromUserId": fromUserId,
        "toUserId": toUserId,
        "message": message,
        "dateTime": dateTime,
        "isReceived": isReceived,
        "isSeen": isSeen,
        "isSent": isSent,
      };
}

convertMapToObject<T>(val, {dynamic jobCount}) {
  if (val is List) {
    final list = <T>[];
    for (var element in val) {
      list.add(getValue<T>(element));
    }
    return list;
  } else {
    return getValue<T>(val);
  }
}

getValue<T>(value) {
  switch (T) {
    case Chat:
      return Chat.fromJson(value);
    default:
      return value;
  }
}