class Message {
  final String text;
  final DateTime date;
  final bool isSendByMe;

  const Message({
    required this.text,
    required this.date,
    required this.isSendByMe
  });

  factory Message.from(Message message) {
    return Message(
      text: message.text,
      date: message.date,
      isSendByMe: message.isSendByMe
    );
  }

  factory Message.fromJson(Map<dynamic, dynamic> json) {
    return Message(
      text: json['text'] as String,
      date: json['date'] as DateTime,
      isSendByMe: json['isSendByMe'] as bool
    );
  }
}
