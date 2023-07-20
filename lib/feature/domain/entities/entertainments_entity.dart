class EntertainmentsEntity{
  final String title;
  final String subtitle;
  final String image;
  final String color;
  EntertainmentsEntity({required this.title, required this.subtitle, required this.image, required this.color});
}


List<EntertainmentsEntity> entertainmentsList = [
  EntertainmentsEntity(title: 'Настольные игры', subtitle: 'Мафия, уно, домино, экивоки и другие', image: 'assets/entertainments_icons/games.png', color: "#4E4343"),
  EntertainmentsEntity(title: 'Настольные игры', subtitle: 'Мафия, уно, домино, экивоки и другие', image: 'assets/entertainments_icons/games.png', color: "#4E4343"),
  EntertainmentsEntity(title: 'Бассейн', subtitle: 'Два бассейна с подогревом', image: 'assets/entertainments_icons/pool.png', color: "#4E4343"),
  EntertainmentsEntity(title: 'Бассейн', subtitle: 'Два бассейна с подогревом', image: 'assets/entertainments_icons/pool.png', color: "#4E4343"),
  EntertainmentsEntity(title: 'Компьютерный клуб', subtitle: 'Можно поиграть в кс', image: 'assets/entertainments_icons/computer.png', color: "#4E4343"),
];