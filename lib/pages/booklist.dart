import 'package:book_app/model/book.dart';
import 'package:book_app/pages/book_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookList extends StatelessWidget {
  const BookList({super.key, required this.books});

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(
              books.length,
              (index) => Container(
                //padding: const EdgeInsets.all(16.0),
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
                child: Card.outlined(
                  child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DetailScreen(),
                                settings: RouteSettings(
                                  arguments: books[index],
                                ),
                              ));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              "${books[index].genre} | ISBN: ${books[index].isbn}",
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                            Text(books[index].title,
                                style: GoogleFonts.bricolageGrotesque(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22,
                                    letterSpacing: -1,
                                    height: 1.1)),
                            ListBody(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    books[index].description,
                                    style: GoogleFonts.bricolageGrotesque(
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              children: [
                                Text(
                                  "by ${books[index].author}",
                                  style: GoogleFonts.bricolageGrotesque(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 11,
                                  ),
                                ),
                                const Spacer(
                                  flex: 1,
                                ),
                                Text(books[index].published,
                                    style: GoogleFonts.bricolageGrotesque(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 11,
                                    )),
                              ],
                            )
                          ],
                        ),
                      )),
                ),
              ),
            ),
          ),
        ),
      );
    }));
  }
}
