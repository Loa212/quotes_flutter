import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:quotes_app/logic/Models/quoteOfTheDay_class.dart';

class QuoteOfTheDayService {
  Future<MyQuoteOfTheDay> fetchQuoteOfTheDay() async {
    final url = Uri.parse('https://quotes.rest/qod?language=en');
    final response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: '',
    });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return MyQuoteOfTheDay.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
