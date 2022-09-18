import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../helpers/constants.dart';
import '../screens/articles_screen.dart';

// ignore: must_be_immutable
class ArticleWidget extends StatelessWidget {
  ArticleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ArticlesScreen()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.8,
        height: 120,
        margin: const EdgeInsets.only(left: 4, right: 4),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              imageUrl + "",
            ),
            fit: BoxFit.cover,
          ),
          gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 203, 203, 203),
                Color.fromARGB(255, 236, 236, 236)
              ]),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      const Color.fromARGB(255, 0, 0, 0).withOpacity(.7),
                      const Color.fromARGB(255, 47, 47, 47).withOpacity(.0)
                    ]),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            )),
      ),
    );
  }
}
