import 'package:ios_chatapp/model/message.dart';

// ignore: non_constant_identifier_names
List<Message> DUMMY_MESSAGES = [
  Message(
    text: 'First Messsage',
    date: DateTime.now().subtract(const Duration(minutes: 1)),
    isSendByMe: false
  ),
  Message(
    text: 'Second Messsage',
    date: DateTime.now().subtract(const Duration(minutes: 2)),
    isSendByMe: false
  ),
  Message(
    text: 'Third Messsage',
    date: DateTime.now().subtract(const Duration(minutes: 3)),
    isSendByMe: false
  ),
  Message(
    text: 'Fourth Messsage',
    date: DateTime.now().subtract(const Duration(minutes: 4)),
    isSendByMe: false
  ),
  Message(
    text: 'Fifth Messsage',
    date: DateTime.now().subtract(const Duration(minutes: 5)),
    isSendByMe: false
  ),
  Message(
    text: 'Sixth Messsage',
    date: DateTime.now().subtract(const Duration(minutes: 6)),
    isSendByMe: false
  ),
  Message(
    text: 'Seventh Messsage',
    date: DateTime.now().subtract(const Duration(minutes: 7)),
    isSendByMe: false
  ),
];
