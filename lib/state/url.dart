import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;

import '../models/url_result.dart';

class UrlShortenerState extends ChangeNotifier {
  final urlController = TextEditingController();

  // Change this key to use. to get the key look at https://firebase.google.com/docs/dynamic-links/rest
  String key = "YOUR KEY";
  // Enter the url to be used as as the url. Read more at https://firebase.google.com/docs/dynamic-links/rest
  String baseURL = "YOUR URL";

  String resultShortLink = "";
  Widget short = Container();

  handleGetLinkButton() async {
    final longUrl = urlController.text;

    final String? shortLink = await getShortLink(longUrl);
    resultShortLink = "$shortLink";

    short = Column(
      children: [
        Builder(builder: (context) {
          return GestureDetector(
            onDoubleTap: () {
              Clipboard.setData(ClipboardData(text: "$shortLink"));
              final snackBar = SnackBar(
                content: const Text("Your Shorlink Copied!"),
                action: SnackBarAction(label: "Ok", onPressed: () {}),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Container(
                color: Colors.amber[400],
                height: 100,
                child: Center(child: Text("$shortLink"))),
          );
        }),
        const Text(
          "Double Tap to copy",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        )
      ],
    );

    notifyListeners();
  }

  Future<String?> getShortLink(String longUrl) async {
    final result = await http.post(
      Uri.https("firebasedynamiclinks.googleapis.com", "/v1/shortLinks",
          {'key': key}),
      body: {
        "longDynamicLink": "$baseURL?link=$longUrl",
      },
    );

    if (result.statusCode == 200) {
      final response = shortUrlResultFromJson(result.body);

      return response.shortLink;
    } else {
      return "";
    }
  }
}
