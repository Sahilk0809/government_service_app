import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class SearchEngineScreen extends StatefulWidget {
  const SearchEngineScreen({super.key});

  @override
  State<SearchEngineScreen> createState() => _SearchEngineScreenState();
}

class _SearchEngineScreenState extends State<SearchEngineScreen> {
  @override
  Widget build(BuildContext context) {
    InAppWebViewController? inAppWebViewController;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff1E1F22),
      appBar: AppBar(
        backgroundColor: const Color(0xff1E1F22),
        leading: const Icon(Icons.account_circle),
        title: const Text('Search Engine'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              cursorColor: Colors.white,
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  inAppWebViewController?.loadUrl(
                    urlRequest: URLRequest(
                      url: WebUri('https://www.google.com/search?q=$value'),
                    ),
                  );
                }
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                labelText: 'Search',
                labelStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: WebUri('https://www.google.com'),
          ),
          onWebViewCreated: (controller) {
            inAppWebViewController = controller;
          },
        ),
      ),
    );
  }
}
