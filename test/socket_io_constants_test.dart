import 'package:socket_io_constants/socket_io_constants.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(SocketIoConstants.instance.addUser, isTrue);
    });
  });
}
