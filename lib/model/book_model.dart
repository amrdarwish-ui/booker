class BookModel {
  String name;
  String auther;
  String genre;
  String aduio;
  String video;
  String poster;
  String pdf;
  String? id;
  num rate;
  BookModel({
    required this.name,
    required this.auther,
    required this.genre,
    required this.aduio,
    required this.video,
    required this.poster,
    required this.pdf,
    required this.rate,
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
      'rate': rate,
    };
  }

  factory BookModel.fromMap(map) {
    return BookModel(
      name: map['name'] ?? '',
      auther: map['auther'] ?? '',
      genre: map['genre'] ?? '',
      aduio: map['aduio'] ?? '',
      video: map['video'] ?? '',
      poster: map['poster'] ?? '',
      pdf: map['pdf'] ?? '',
      rate: map['rate'] ?? 0,
    );
  }
}
