import 'dart:developer';

import 'package:book_reading/models/last_point.dart';
import 'package:book_reading/models/user.dart';
import 'package:book_reading/provider/book_reading_provider.dart';
import 'package:book_reading/utils/utils.dart';
import 'package:book_reading/widgets/home_widget/book_cover.dart';
import 'package:book_reading/widgets/home_widget/book_of_the_day.dart';
import 'package:book_reading/widgets/home_widget/circle_notch.dart';
import 'package:book_reading/widgets/home_widget/continue_reading.dart';
import 'package:book_reading/widgets/home_widget/rating.dart';
import 'package:book_reading/widgets/home_widget/reading_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    setState(() {});
    // });

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            CircleNotch(),
            Align(
              alignment: Alignment(2.5, -1.4),
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFE8BEB5),
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.13,
                ),
                ReadingSection(),
                BestOfTheDay(
                    book: getBestOfTheDayBook(bookProvider.user.books)),
                if (bookProvider.lastPoint != null)
                  Consumer<BookReadingProvider>(
                      builder: (context, provider, _) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child:
                          ContinueReading(lastPoint: bookProvider.lastPoint!),
                    );
                  })
              ],
            ),
          ],
        ),
      ),
    );
  }

  BookReadingProvider get bookProvider =>
      Provider.of<BookReadingProvider>(context, listen: false);

  Book getBestOfTheDayBook(List<Book> books) {
    List<Book> booksToSort = books.map((e) => e).toList();
    booksToSort.sort((a, b) => b.rating.compareTo(a.rating));

    return booksToSort.first;
  }
}

class HomebookProvider {
  User user;

  LastPoint? lastPoint;

  HomebookProvider({required this.user, this.lastPoint});
}
