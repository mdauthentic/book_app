import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Book {
  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.genre,
    required this.description,
    required this.isbn,
    required this.image,
    required this.published,
    required this.publisher,
  });

  final int id;
  final String title;
  final String author;
  final String genre;
  final String description;
  final String isbn;
  final String image;
  final String published;
  final String publisher;

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json["id"],
      title: json["title"],
      author: json["author"],
      genre: json["genre"],
      description: json["description"],
      isbn: json["isbn"],
      image: json["image"],
      published: json["published"],
      publisher: json["publisher"],
    );
  }
}

Future<List<Book>> fetchBook(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://fakerapi.it/api/v1/books?_quantity=10'));

  final data = jsonDecode(response.body)['data'];
  return compute(parseBooks, data);
}

List<Book> parseBooks(dynamic responseBody) {
  final parsed = (responseBody as List).cast<Map<String, dynamic>>();
  return parsed.map<Book>((json) => Book.fromJson(json)).toList();
}
