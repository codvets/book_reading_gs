import 'dart:developer';

import 'package:book_reading/models/last_point.dart';
import 'package:book_reading/models/user.dart';
import 'package:book_reading/screens/book_view.dart';
import 'package:book_reading/utils/utils.dart';
import 'package:book_reading/widgets/home_widget/rating.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookInformation extends StatefulWidget {
  BookInformation({
    Key? key,
    required this.book,
    required this.bookIndex,
  }) : super(key: key);

  final Book book;
  final int bookIndex;

  @override
  State<BookInformation> createState() => _BookInformationState();
}

class _BookInformationState extends State<BookInformation> {
  bool isShowingDetails = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: screenHeight(context) * 0.28,
        width: screenWidth(context) * 0.45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black26,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            bookProvider(context).bookReadingDetailsIndex == widget.bookIndex
                ? BookDetails(details: widget.book.details)
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Rating(rating: widget.book.rating),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(widget.book.title),
                        Text(widget.book.author),
                      ],
                    ),
                  ),
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        bookProvider(context).showDetails(widget.bookIndex);
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            'Details',
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        bookProvider(context).currentlyReadingBook =
                            widget.book;
                        Navigator.of(context).pushNamed(
                          BookView.routeName,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Read',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class BookDetails extends StatelessWidget {
  BookDetails({
    Key? key,
    required this.details,
  }) : super(key: key);

  final String details;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(details, style: GoogleFonts.poppins(fontSize: 12)),
    );
  }
}
