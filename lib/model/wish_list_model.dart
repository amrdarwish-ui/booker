class WishListModel {
  String name;
  String auther;
  String genre;
  String aduio;
  String video;
  String poster;
  String pdf;
  String? id;
  num rate;
  String uid;
  WishListModel({
    required this.name,
    required this.auther,
    required this.genre,
    required this.aduio,
    required this.video,
    required this.poster,
    required this.pdf,
    this.id,
    required this.rate,
    required this.uid,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'auther': auther,
      'genre': genre,
      'aduio': aduio,
      'video': video,
      'poster': poster,
      'pdf': pdf,
      'id': id,
      'rate': rate,
      'uid': uid,
    };
  }

  factory WishListModel.fromMap(map) {
    return WishListModel(
      name: map['name'] ?? '',
      auther: map['auther'] ?? '',
      genre: map['genre'] ?? '',
      aduio: map['aduio'] ?? '',
      video: map['video'] ?? '',
      poster: map['poster'] ?? '',
      pdf: map['pdf'] ?? '',
      id: map['id'],
      rate: map['rate'] ?? 0,
      uid: map['uid'] ?? '',
    );
  }
}
