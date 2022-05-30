import 'dart:async';
import 'package:booker/model/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreViewModel extends GetxController {
  bool isOpend = false;
  List<BookModel> topList = [];
  List<BookModel> bestList = [];
  List<BookModel> genresList = [];
  CollectionReference topRef = FirebaseFirestore.instance.collection('top');
  CollectionReference bestRef = FirebaseFirestore.instance.collection('best');
  CollectionReference booksRef = FirebaseFirestore.instance.collection('books');
  CollectionReference genresRef =
      FirebaseFirestore.instance.collection('genres');
  List<Color?> genereColors = [
    Colors.blue[900],
    Colors.amber[900],
    Colors.indigo[900],
    Colors.pink[900]
  ];
  List<String> geners = [];
  @override
  void onInit() {
    getTopPicks();
    getBestSeller();
    getgeners();
    super.onInit();
  }

  void getBestSeller() async {
    await bestRef.get().then((value) {
      bestList.clear();
      for (var i in value.docs) {
        BookModel bookModel = BookModel.fromMap(i);
        bookModel.id = i.id;
        bestList.add(bookModel);
      }
      update();
    });
  }

  void getTopPicks() async {
    await topRef.get().then((value) {
      topList.clear();
      for (var i in value.docs) {
        BookModel bookModel = BookModel.fromMap(i);
        bookModel.id = i.id;
        topList.add(bookModel);
      }
      update();
    });
  }

  void getgeners() async {
    await genresRef.get().then((value) {
      geners.clear();
      for (var i in value.docs) {
        geners.add(i['genre']);
      }
    });

    update();
  }

  void getGenres(String genre) async {
    await booksRef.where('genre', isEqualTo: genre).get().then((value) {
      genresList.clear();
      for (var i in value.docs) {
        BookModel bookModel = BookModel.fromMap(i);
        bookModel.id = i.id;
        genresList.add(bookModel);
      }
      update();
    });
  }

  void animate() {
    Timer.periodic(const Duration(seconds: 1), (timer) {});
    isOpend = true;
    update();
  }

  @override
  void onReady() {
    animate();
    super.onReady();
  }
}
