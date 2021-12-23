import 'dart:developer';

import 'package:book_reading/models/last_point.dart';
import 'package:book_reading/models/user.dart';
import 'package:book_reading/screens/page.dart';
import 'package:book_reading/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChapterTile extends StatelessWidget {
  const ChapterTile({
    Key? key,
    required this.chapter,
  }) : super(key: key);

  final Chapter chapter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          bookProvider(context).currentlyReadingChapter = chapter;
          Navigator.of(context).pushNamed(PageReading.routeName);
        },
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 20),
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          shadowColor: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Chapter ${chapter.chapterNo} : ${chapter.title}",
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      chapter.description,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.chevron_right,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
