class CardEntity{
  final String title;
  final String image;

  CardEntity({required this.title, required this.image});

}

List<CardEntity> cardList = [
  CardEntity(title: "Канапе", image: 'assets/kanape.png'),
  CardEntity(title: "Сырная тарелка", image: 'assets/cheese.png'),
  CardEntity(title: "Шашлык на мангале", image: 'assets/shashlik.png'),
  CardEntity(title: "Морепродукты", image: 'assets/seafood.png'),
  CardEntity(title: "Свежие фрукты", image: 'assets/fruits.png'),
  CardEntity(title: "Авторские лимонады", image: 'assets/lemonade.png'),
];
