import 'package:flutter/material.dart';
import 'package:rt_news/presentation/screens/webView_screen.dart';

Widget buildArticleItem(
  context,
  article,
) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WebViewScreen(article["url"])));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(article['urlToImage'] ??
                    "https://euvsdisinfo.eu/uploads/2018/07/RT.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      article['title'] ?? "title",
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    article['publishedAt'],
                    style: const TextStyle(
                      fontSize: 8,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
