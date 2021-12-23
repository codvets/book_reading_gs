import 'package:book_reading/app/book_reading.dart';
import 'package:book_reading/provider/book_reading_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => BookReadingProvider(), child: BookReading()));
}
