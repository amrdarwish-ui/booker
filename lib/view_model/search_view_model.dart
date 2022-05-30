import 'package:booker/model/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;
  CollectionReference genresRef =
      FirebaseFirestore.instance.collection('genres');
  CollectionReference booksRef = FirebaseFirestore.instance.collection('books');

  List<Color?> genereColors = [
    Colors.blue[900],
    Colors.amber[900],
    Colors.indigo[900],
    Colors.pink[900]
  ];
  List<String> geners = [];
  List<BookModel> booksList = [];
  List<BookModel> searchResultsList = [];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    getgeners();
    getAllBooks();
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

  void getAllBooks() async {
    await booksRef.get().then((value) {
      booksList.clear();
      for (var i in value.docs) {
        BookModel bookModel = BookModel.fromMap(i);
        bookModel.id = i.id;
        booksList.add(bookModel);
      }
      update();
    });
  }

  Future<void> search(String txt, String searchtype) async {
    print('search start');
    await booksRef
        .where(
          searchtype,
          isGreaterThanOrEqualTo: txt,
          isLessThan: txt == ''
              ? txt
              : txt.substring(0, txt.length - 1) +
                  String.fromCharCode(txt.codeUnitAt(txt.length - 1) + 1),
        )
        .get()
        .then((value) {
      searchResultsList.clear();
      for (var i in value.docs) {
        BookModel bookModel = BookModel.fromMap(i);
        bookModel.id = i.id;
        print(bookModel.name);
        searchResultsList.add(bookModel);
      }
      update();
    });
  }
}
