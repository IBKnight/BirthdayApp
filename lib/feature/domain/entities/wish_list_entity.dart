class WishEntity {
  String? id;
  final String title;
  final String url;
  final bool isPicked;

  WishEntity(
      {required this.title, required this.url, required this.isPicked, this.id});

}