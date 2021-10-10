class User{
  final int id;
  final String name;
  final String imageUrl;
  final bool isOnline;

  User({required this.id, required this.name, required this.imageUrl, required this.isOnline,});
}

final User currentUser = User(
  id : 0,
  name : 'Nick Fury',
  imageUrl: 'assets/images/demoUser.png',
  isOnline: true,
);
final User hulk = User(
  id : 1,
  name : 'Hulk',
  imageUrl: 'assets/images/demoUser.png',
  isOnline: true,
);
final User ironman = User(
  id : 2,
  name : 'Ironman',
  imageUrl: 'assets/images/demoUser.png',
  isOnline: true,
);
final User captainAmerica = User(
  id : 3,
  name : 'Captain America',
  imageUrl: 'assets/images/demoUser.png',
  isOnline: true,
);
final User thor = User(
  id : 4,
  name : 'Thor',
  imageUrl: 'assets/images/demoUser.png',
  isOnline: false,
);
final User scarletWitch = User(
  id : 5,
  name : 'Scarlet Witch',
  imageUrl: 'assets/images/demoUser.png',
  isOnline: false,
);
final User spiderMan = User(
  id : 6,
  name : 'Spider Man',
  imageUrl: 'assets/images/demoUser.png',
  isOnline: false,
);
final User blackWidow = User(
  id : 7,
  name : 'Black Widow',
  imageUrl: 'assets/images/demoUser.png',
  isOnline: false,
);

