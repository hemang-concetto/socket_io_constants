import 'dart:convert';

//import 'package:floor/floor.dart';
import 'package:intl/intl.dart';
import 'package:socket_io_constants/src/enum/io_content_type.dart';
import 'package:socket_io_constants/src/extension/enum_extension.dart';
import 'package:socket_io_constants/src/extension/string_extension.dart';

///
/// Class [Content] uses for sending and receiving data from server and client.
/// Here [T] is generic object which defines the Model object which comes from the response.
///
class Content<T> {
  Content({this.type, this.data, this.videoType});

  IOSubType? type;
  IOVideoType? videoType;

  T? data;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
      type: json["type"] != null
          ? (json['type'] as String).enumValueFromString<IOSubType>(IOSubType.values)
          : json['type'],
      videoType: json["videoType"] != null
          ? (json['videoType'] as String).enumValueFromString<IOVideoType>(IOVideoType.values)
          : json['videoType'],
      data: json["data"] != null ? convertMapToObject<T>(json['data']) : json["data"]);

  Map<String, dynamic> toJson() =>
      {"type": type?.enumValueToString(), "data": convertToMap<T>(data), "videoType": videoType?.enumValueToString()};
}

///
/// Class [Chat] uses for storing and retrieving message data.
///
//@entity
class Chat {
  Chat({
    this.id,
    this.localId,
    this.fromUserId,
    this.toUserId,
    this.message,
    this.dateTime,
    this.isReceived,
    this.isSeen,
    this.isSent,
  });

  //@primaryKey
  int? localId;

  String? id;
  String? fromUserId;
  String? toUserId;
  String? message;
  String? dateTime;
  bool? isReceived;
  bool? isSeen;
  bool? isSent;

  factory Chat.fromRawJson(String str) => Chat.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        id: json["id"],
        localId: json["localId"],
        fromUserId: json["fromUserId"],
        toUserId: json["toUserId"],
        message: json["message"],
        dateTime: json["dateTime"],
        isReceived: json["isReceived"],
        isSeen: json["isSeen"],
        isSent: json["isSent"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "localId": localId,
        "fromUserId": fromUserId,
        "toUserId": toUserId,
        "message": message,
        "dateTime": dateTime,
        "isReceived": isReceived,
        "isSeen": isSeen,
        "isSent": isSent,
      };

  DateTime? convertStringToDate() {
    if (dateTime == null) return null;
    return DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateTime!);
  }
}

///
/// Class [User] uses to store and to retrieve user data.
///
//@entity
class User {
  User({
    this.localId,
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.profilePic,
  });

  //@primaryKey
  int? localId;

  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? profilePic;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        localId: json["localId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        profilePic: json["profilePic"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "localId": localId,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "profilePic": profilePic,
      };
}

///
/// The method [convertMapToObject] converts your json response to the particular object
/// which is passed using [T]. It automatically manages JsonArray and JsonObject.
///
/// i.e. for getting ChatList and for getting Single Chat you directly should use :
/// [ convertMapToObject<Chat>() ]
///
convertMapToObject<T>(val) {
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

///
/// Used to convert your json to Particular Object
///
getValue<T>(value) {
  switch (T) {
    case Chat:
      return Chat.fromJson(value);
    case User:
      return User.fromJson(value);
    case VideoCall:
      return VideoCall.fromJson(value);
    case Description:
      return Description.fromJson(value);
    case Candidate:
      return Candidate.fromJson(value);
    default:
      return value;
  }
}

///
/// [convertToMap] method is used to convert your Object to Map
/// [T] is used for generic Object
///
Map convertToMap<T>(val) {
  if (val is List) {
    final list = [];
    for (var element in val) {
      list.add(setValue<T>(element));
    }
    return {for (var v in list) v[0]: v[1]};
  } else {
    return setValue<T>(val);
  }
}

///
/// [setValue] converts your json string into Map object
///
Map setValue<T>(value) {
  switch (T) {
    case Chat:
      return (value as Chat).toJson();
    case User:
      return (value as User).toJson();
    case VideoCall:
      return (value as VideoCall).toJson();
    case Description:
      return (value as Description).toJson();
    case Candidate:
      return (value as Candidate).toJson();
    default:
      return value;
  }
}

class VideoCall {
  VideoCall(
      {this.channelName,
      this.candidate,
      this.fromUserId,
      this.toUserId,
      this.description,
      this.streamId,
      this.accessToken});

  String? channelName;
  Candidate? candidate;
  String? fromUserId;
  String? toUserId;
  Description? description;
  String? streamId;
  String? accessToken;

  factory VideoCall.fromJson(Map<String, dynamic> json) => VideoCall(
      channelName: json["channelName"],
      candidate: json["candidate"] == null ? null : Candidate.fromJson(json["candidate"]),
      fromUserId: json["fromUserId"],
      toUserId: json["toUserId"],
      description: json["description"] == null ? null : Description.fromJson(json["description"]),
      accessToken: json["access_token"],
      streamId: json["streamId"]);

  Map<String, dynamic> toJson() => {
        "channelName": channelName,
        "candidate": candidate?.toJson(),
        "fromUserId": fromUserId,
        "toUserId": toUserId,
        "description": description?.toJson(),
        "streamId": streamId,
        "access_token": accessToken
      }..removeWhere((key, value) => value == null);
}

class Candidate {
  Candidate({
    this.sdpMLineIndex,
    this.sdpMid,
    this.candidate,
  });

  int? sdpMLineIndex;
  String? sdpMid;
  String? candidate;

  factory Candidate.fromJson(Map<String, dynamic> json) => Candidate(
        sdpMLineIndex: json["sdpMLineIndex"],
        sdpMid: json["sdpMid"],
        candidate: json["candidate"],
      );

  Map<String, dynamic> toJson() => {
        "sdpMLineIndex": sdpMLineIndex,
        "sdpMid": sdpMid,
        "candidate": candidate,
      };
}

class Description {
  Description({
    this.sdp,
    this.type,
  });

  String? sdp;
  String? type;

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        sdp: json["sdp"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "sdp": sdp,
        "type": type,
      };
}
