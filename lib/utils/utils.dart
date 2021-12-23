import 'package:book_reading/provider/book_reading_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

BookReadingProvider bookProvider(context) =>
    Provider.of<BookReadingProvider>(context, listen: false);
