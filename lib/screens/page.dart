import 'dart:convert';

import 'package:book_reading/models/last_point.dart';
import 'package:book_reading/models/user.dart';
import 'package:book_reading/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageReading extends StatefulWidget {
  PageReading({Key? key}) : super(key: key);

  static const String routeName = '/page';

  @override
  State<PageReading> createState() => _PageReadingState();
}

class _PageReadingState extends State<PageReading> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bookProvider(context).currentlyReadingChapter!.title),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
          child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                  onPageChanged: (int index) {
                    bookProvider(context)
                        .setLastLeftOffPoint(pageNo: index + 1);
                  },
                  children: bookProvider(context)
                      .currentlyReadingChapter!
                      .pages
                      .map((page) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              page,
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.poppins(
                                fontSize: 21,
                                letterSpacing: 1,
                                wordSpacing: 1,
                              ),
                            ),
                          ))
                      .toList()),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                  '$currentPage/${bookProvider(context).currentlyReadingChapter!.pages.length}',
                  style: GoogleFonts.poppins(fontSize: 21)),
            ),
          ],
        ),
      )),
    );
  }
}

class PageReadingArguments {
  final Chapter chapter;
  final Book book;
  final Function(LastPoint) onLastPointChanged;

  PageReadingArguments(
      {required this.chapter,
      required this.book,
      required this.onLastPointChanged});
}
