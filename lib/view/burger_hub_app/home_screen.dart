import 'package:flutter/material.dart';
import 'package:government_service_app/provider/burger_provider.dart';
import 'package:government_service_app/view/component/web_view.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var burgerProvider = Provider.of<BurgerProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: Colors.white,
      backgroundColor: const Color(0xffB7B4A5),
      appBar: AppBar(
        // backgroundColor: Colors.white,
        backgroundColor: const Color(0xffB7B4A5),
        elevation: 0.0,
        leading:
            const Icon(Icons.account_circle, color: Colors.black, size: 30),
        title: const Text(
          'Burger Hub',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            // Simplified Search Bar
            TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'Search restaurants',
                prefixIcon: const Icon(Icons.search, color: Colors.black54),
                filled: true,
                // fillColor: Colors.grey[200],
                fillColor: const Color(0xffA3A093),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: height * 0.018),
            // Burger List
            Expanded(
              child: ListView.builder(
                itemCount: burgerProvider.burgerList.length,
                itemBuilder: (context, index) {
                  var burger = burgerProvider.burgerList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyWebView(source: burger.url),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        // color: Colors.grey[100],
                        // color: const Color(0xff8E8B80),
                        // color: const Color(0xffAFAB9E),
                        color: const Color(0xffA3A093),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              burger.logo,
                              height: height * 0.08,
                              width: width * 0.18,
                              fit: BoxFit.cover,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            (loadingProgress
                                                    .expectedTotalBytes ??
                                                1)
                                        : null,
                                  ),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) =>
                                  const Text(
                                'Image Failed to load!',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ),
                          SizedBox(width: width * 0.03),
                          // Burger Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  burger.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: height * 0.005),
                                Text(
                                  burger.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
