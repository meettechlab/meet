import 'user_model.dart';

class Message{
  final User sender;
  final String time;
  final String text;
  final bool unread;

  Message({required this.sender, required this.time, required this.text, required this.unread});
}

List<Message> chats = [
  Message(
    sender: ironman,
    time: '5:30 PM',
    text: 'Hey dude! Even dead I\'m the hero. Love you 3000 guys.',
    unread: true,
  ),
  Message(
    sender: captainAmerica,
    time: '4:30 PM',
    text: 'Hey dude! Even dead I\'m the hero. Love you 3000 guys.',
    unread: true,
  ),
  Message(
    sender: blackWidow,
    time: '3:30 PM',
    text: 'Hey dude! Even dead I\'m the hero. Love you 3000 guys.',
    unread: true,
  ),
  Message(
    sender: scarletWitch,
    time: '2:30 PM',
    text: 'Hey dude! Even dead I\'m the hero. Love you 3000 guys.',
    unread: false,
  ),
  Message(
    sender: thor,
    time: '1:30 PM',
    text: 'Hey dude! Even dead I\'m the hero. Love you 3000 guys.',
    unread: false,
  ),
  Message(
    sender: hulk,
    time: '12:30 PM',
    text: 'Hey dude! Even dead I\'m the hero. Love you 3000 guys.',
    unread: false,
  ),
  Message(
    sender: spiderMan,
    time: '11:30 AM',
    text: 'Hey dude! Even dead I\'m the hero. Love you 3000 guys.',
    unread: false,
  ),
];