class EntertainmentsEntity{
  final String title;
  final String subtitle;
  final String image;

  EntertainmentsEntity({required this.title, required this.subtitle, required this.image});
}


List<EntertainmentsEntity> entertainmentsList = [
  EntertainmentsEntity(title: 'Настольные игры', subtitle: 'Мафия, уно, домино, экивоки и другие', image: 'assets/entertainments_icons/games.png'),
  EntertainmentsEntity(title: 'Бассейн', subtitle: 'Два бассейна с подогревом', image: 'assets/entertainments_icons/pool.png'),
  EntertainmentsEntity(title: 'Компьютерный клуб', subtitle: 'Можно поиграть в кс', image: 'assets/entertainments_icons/computer.png'),
  // EntertainmentsEntity(title: '123', subtitle: '123', image: '123'),
];