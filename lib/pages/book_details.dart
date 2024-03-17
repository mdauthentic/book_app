import 'package:book_app/model/book.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final book = ModalRoute.of(context)!.settings.arguments as Book;

    final author = "by: ${book.author}";

    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(book.title,
                style: GoogleFonts.bricolageGrotesque(
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    letterSpacing: -1,
                    height: 1.1)),
            Text(
              book.genre,
              style: GoogleFonts.bricolageGrotesque(
                fontWeight: FontWeight.w300,
              ),
            ),
            Row(
              children: [
                Text(
                  author,
                  style: GoogleFonts.bricolageGrotesque(
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Text(
                  book.published,
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: ListBody(
                children: <Widget>[
                  Text(
                    book.description,
                    style: GoogleFonts.bricolageGrotesque(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
