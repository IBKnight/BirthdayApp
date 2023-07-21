class AppBannerEntity{
  final String title;
  final String image;

  AppBannerEntity({required this.title, required this.image});
  
}

List<AppBannerEntity> appbannerList = [
  AppBannerEntity(title: "25 августа 2023", image: "assets/appbanner_main.png"),
  AppBannerEntity(title: "26 августа 2023", image: "assets/seafood.png"),
  AppBannerEntity(title: "27 августа 2023", image: "assets/shashlik.png"),
  AppBannerEntity(title: "28 августа 2023", image: "assets/lemonade.png"),
];
