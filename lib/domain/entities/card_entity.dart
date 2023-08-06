class CardEntity{
  final String title;
  final String image;
  final List<String> ingredients;

  CardEntity({required this.title, required this.image, required this.ingredients});

}

List<CardEntity> cardList = [
  CardEntity(title: "Канапе", image: 'assets/kanape.png', ingredients: ['Хлеб','Салат','Ветчина','Яйцо']),
  CardEntity(title: "Сырная тарелка", image: 'assets/cheese.png', ingredients: ['Виноград','Камамбер','Чеддер','Канталь', 'Дор Блю']),
  CardEntity(title: "Шашлык на мангале", image: 'assets/shashlik.png', ingredients: ['Лук','Свинина','Говядина', 'Томатный соус']),
  CardEntity(title: "Морепродукты", image: 'assets/seafood.png', ingredients: ['Устрицы','Краб','Креветки','Мидии']),
  CardEntity(title: "Свежие фрукты", image: 'assets/fruits.png', ingredients: ['Ананас','Арбуз','Киви','Манго', 'Виноград']),
  CardEntity(title: "Авторские лимонады", image: 'assets/lemonade.png', ingredients: ['Тархун','Дюшес','Байка','Саяны', 'Миндальный лимонад']),
];
