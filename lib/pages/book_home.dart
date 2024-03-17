import 'package:book_app/model/book.dart';
import 'package:book_app/pages/booklist.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookHome extends StatefulWidget {
  const BookHome({super.key, required this.title});
  final String title;

  @override
  State<BookHome> createState() => _BookHomeState();
}

class _BookHomeState extends State<BookHome> {
  /* @override
  void initState() {
    super.initState();
    futureBooks = futureBooks();
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(Icons.book_outlined)
              ],
            ),
          ),
          centerTitle: false,
        ),
        body: Container(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                    right: 16.0, left: 16.0, bottom: 16.0, top: 8.0),
                child: const SearchBar(
                  leading: Icon(Icons.search),
                  elevation: MaterialStatePropertyAll(0),
                  side: MaterialStatePropertyAll(
                      BorderSide(color: Color.fromRGBO(1, 1, 1, 0.1))),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0)))),
                  hintText: "Search...",
                ),
              ),
              Expanded(
                child: FutureBuilder<List<Book>>(
                  future: fetchBook(http.Client()),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('An error has occurred!'),
                      );
                    } else if (snapshot.hasData) {
                      return BookList(books: snapshot.data!);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
