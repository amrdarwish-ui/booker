import 'dart:convert';

import 'package:booker/model/book_model.dart';
import 'package:flutter/foundation.dart';

class UserModel {
  String name;
  String uid;
  String email;
  String password;
  int phone;
  String img;
  String bio;
  List books;
  List reviews;
  UserModel({
    required this.name,
    required this.uid,
    required this.email,
    required this.password,
    required this.phone,
    required this.img,
    required this.bio,
    required this.books,
    required this.reviews,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uid': uid,
      'email': email,
      'password': password,
      'phone': phone,
      'img': img,
      'bio': bio,
      'books': books,
      'reviews': reviews,
    };
  }

  factory UserModel.fromMap(map) {
    return UserModel(
      name: map['name'] ?? '',
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      phone: map['phone']?.toInt() ?? 0,
      img: map['img'] ?? '',
      bio: map['bio'] ?? '',
      books: List.from(map['books']),
      reviews: List.from(map['reviews']),
    );
  }
}
