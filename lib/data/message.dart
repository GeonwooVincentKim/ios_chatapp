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
    isSendByMe: true
  ),
  Message(
    text: 'Third Messsage',
    date: DateTime.now().subtract(const Duration(days: 3, minutes: 3)),
    isSendByMe: true
  ),
  Message(
    text: 'Fourth Messsage',
    date: DateTime.now().subtract(const Duration(days: 3, minutes: 4)),
    isSendByMe: false
  ),
  Message(
    text: 'Fifth Messsage',
    date: DateTime.now().subtract(const Duration(minutes: 5)),
    isSendByMe: true
  ),
  Message(
    text: 'Sixth Messsage',
    date: DateTime.now().subtract(const Duration(minutes: 6)),
    isSendByMe: false
  ),
  Message(
    text: 'Test Message',
    date: DateTime.now().subtract(const Duration(hours: 1)),
    isSendByMe: false
  ),
  Message(
    text: 'Grave Messsage',
    date: DateTime.now().subtract(const Duration(hours: 1, minutes: 6)),
    isSendByMe: false
  ),
  Message(
    text: 'Share we watch TV?',
    date: DateTime.now().subtract(const Duration(hours: 1)),
    isSendByMe: false
  ),
  Message(
    text: 'Sure',
    date: DateTime.now().subtract(const Duration(minutes: 54)),
    isSendByMe: true
  ),
  Message(
    text: 'Test Message',
    date: DateTime.now().subtract(const Duration(hours: 1)),
    isSendByMe: false
  ),
  Message(
    text: 'Sixth Messsage',
    date: DateTime.now().subtract(const Duration(hours: 1, minutes: 35)),
    isSendByMe: true
  ),
  Message(
    text: 'Get Messsage',
    date: DateTime.now().subtract(const Duration(days: 1, hours: 3, seconds: 10)),
    isSendByMe: false
  ),
  Message(
    text: 'Test Messsage',
    date: DateTime.now().subtract(const Duration(minutes: 6)),
    isSendByMe: false
  ),
  Message(
    text: 'Wow Messsage',
    date: DateTime.now().subtract(const Duration(minutes: 6)),
    isSendByMe: false
  ),
  Message(
    text: 'Seventh Messsage',
    date: DateTime.now().subtract(const Duration(minutes: 7)),
    isSendByMe: false
  ),
  Message(
    text: 'Eigth Messsage',
    date: DateTime.now().add(const Duration(minutes: 8)),
    isSendByMe: false
  ),
  // Message(
  //   text: 'Ninth Messsage',
  //   date: DateTime.now().add(const Duration(days: 1, minutes: 9)),
  //   isSendByMe: false
  // ),
  // Message(
  //   text: 'Ten Messsage',
  //   date: DateTime.now().add(const Duration(days: 1, minutes: 10)),
  //   isSendByMe: false
  // ),
];
