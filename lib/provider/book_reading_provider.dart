import 'dart:convert';

import 'package:book_reading/models/last_point.dart';
import 'package:book_reading/models/user.dart';
import 'package:book_reading/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookReadingProvider with ChangeNotifier {
  late User user;

  LastPoint? lastPoint;

  int? bookReadingDetailsIndex;

  Book? currentlyReadingBook;

  Chapter? currentlyReadingChapter;

  Future<void> setLastLeftOffPoint({required int pageNo}) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    final lastPoint = LastPoint(
        bookTitle: currentlyReadingBook!.title,
        bookAuthor: currentlyReadingBook!.author,
        chapterNo: currentlyReadingChapter!.chapterNo,
        totalChapters: currentlyReadingBook!.chapters.length,
        bookCover: currentlyReadingBook!.bookCover,
        pageNo: pageNo);
    this.lastPoint = lastPoint;
    notifyListeners();
    _pref.setString("lastPoint", jsonEncode(lastPoint.toJson()));
  }

  void showDetails(int bookIndex) {
    if (bookReadingDetailsIndex == bookIndex) {
      bookReadingDetailsIndex = null;
    } else {
      bookReadingDetailsIndex = bookIndex;
    }
    notifyListeners();
  }

  Future<void> getUserData() async {
    final data = await rootBundle.loadString('assets/data/users.json');
    final Map<String, dynamic> rawData = jsonDecode(data);
    final userData = rawData["users"]["123456"];
    this.user = User.fromJson(userData);

    SharedPreferences _prefs = await SharedPreferences.getInstance();

    final lastPointString = _prefs.getString("lastPoint");

    if (lastPointString != null) {
      final lastPointRaw = jsonDecode(lastPointString) as Map<String, dynamic>;

      this.lastPoint = LastPoint.fromJson(lastPointRaw);
    }
  }
}
