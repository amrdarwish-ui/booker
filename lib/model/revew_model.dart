class ReviewModel {
  String review;
  String img;
  num rate;
  ReviewModel({
    required this.review,
    required this.img,
    required this.rate,
  });

  Map<String, dynamic> toMap() {
    return {
      'review': review,
      'img': img,
      'rate': rate,
    };
  }

  factory ReviewModel.fromMap(map) {
    return ReviewModel(
      review: map['review'] ?? '',
      img: map['img'] ?? '',
      rate: map['rate'] ?? 0,
    );
  }
}
