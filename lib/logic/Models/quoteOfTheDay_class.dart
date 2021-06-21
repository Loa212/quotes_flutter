class MyQuoteOfTheDay {
  Success success;
  Contents contents;
  String baseurl;
  Copyright copyright;

  MyQuoteOfTheDay({this.success, this.contents, this.baseurl, this.copyright});

  MyQuoteOfTheDay.fromJson(Map<String, dynamic> json) {
    success =
        json['success'] != null ? new Success.fromJson(json['success']) : null;
    contents = json['contents'] != null
        ? new Contents.fromJson(json['contents'])
        : null;
    baseurl = json['baseurl'];
    copyright = json['copyright'] != null
        ? new Copyright.fromJson(json['copyright'])
        : null;
  }
}

class Success {
  int total;

  Success({this.total});

  Success.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }
}

class Contents {
  List<Quotes> quotes;

  Contents({this.quotes});

  Contents.fromJson(Map<String, dynamic> json) {
    if (json['quotes'] != null) {
      quotes = new List<Quotes>();
      json['quotes'].forEach((v) {
        quotes.add(new Quotes.fromJson(v));
      });
    }
  }
}

class Quotes {
  String quote;
  String length;
  String author;
  List<String> tags;
  String category;
  String language;
  String date;
  String permalink;
  String id;
  String background;
  String title;

  Quotes(
      {this.quote,
      this.length,
      this.author,
      this.tags,
      this.category,
      this.language,
      this.date,
      this.permalink,
      this.id,
      this.background,
      this.title});

  Quotes.fromJson(Map<String, dynamic> json) {
    quote = json['quote'];
    length = json['length'];
    author = json['author'];
    tags = json['tags'].cast<String>();
    category = json['category'];
    language = json['language'];
    date = json['date'];
    permalink = json['permalink'];
    id = json['id'];
    background = json['background'];
    title = json['title'];
  }
}

class Copyright {
  int year;
  String url;

  Copyright({this.year, this.url});

  Copyright.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    url = json['url'];
  }
}
