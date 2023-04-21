import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/data/message.dart';
import 'package:ios_chatapp/model/message.dart';

class MessageProvider with ChangeNotifier {
  final List<Message> _message = DUMMY_MESSAGES.toList();

  List<Message> get messageList => [..._message];
}
