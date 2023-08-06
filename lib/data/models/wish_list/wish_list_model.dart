class WishModel {
  String? id;
  final String title;
  final String url;
  final bool isPicked;

  WishModel(
      {required this.title, required this.url, required this.isPicked, this.id});


  WishModel fromJson(Map<String, dynamic> json) => WishModel(
    title: json['title'] as String,
    url: json['url'] as String,
    isPicked: json['isPicked'] as bool,
  );

  Map<String, dynamic> toJson() =>
      <String, dynamic>{
        'title': title,
        'url': url,
        'isPicked': isPicked,
      };

}


