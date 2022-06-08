import 'package:socket_io_constants/socket_io_constants.dart';

///
/// Enum which is used for SocketIO callback
enum IOContentType { chat, videoCall, audioCall, stream }

/// Enum which is used to manage Type for [Content.type]
enum IOSubType { message, messageSent, messageReceived, messageSeen }
