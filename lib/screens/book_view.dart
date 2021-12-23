import 'dart:developer';

import 'package:book_reading/models/last_point.dart';
import 'package:book_reading/models/user.dart';
import 'package:book_reading/utils/utils.dart';
import 'package:book_reading/widgets/book_view_widgets/book_details.dart';
import 'package:book_reading/widgets/book_view_widgets/chapter_tile.dart';
import 'package:book_reading/widgets/book_view_widgets/color_overlay.dart';
import 'package:book_reading/widgets/home_widget/book_cover.dart';
import 'package:book_reading/widgets/home_widget/rating.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookView extends StatelessWidget {
  const BookView({Key? key}) : super(key: key);

  static const String routeName = '/book_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            child: BookCover(
              bookCover: bookProvider(context).currentlyReadingBook!.bookCover,
              height: screenHeight(context) * 0.45,
              width: screenWidth(context),
              fit: BoxFit.cover,
            ),
          ),
          ColorOverlay(),
          Column(
            children: [
              BookDetails(book: bookProvider(context).currentlyReadingBook!),
              Container(
                height: screenHeight(context) * 0.4,
                child: ListView.builder(
                  itemCount: bookProvider(context)
                      .currentlyReadingBook!
                      .chapters
                      .length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final chapter = bookProvider(context)
                        .currentlyReadingBook!
                        .chapters[index];
                    return ChapterTile(
                      chapter: chapter,
                    );
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class BookViewArgs {
  final Book book;
  final Function(LastPoint) onLastPointChanged;

  BookViewArgs({required this.book, required this.onLastPointChanged});
}
