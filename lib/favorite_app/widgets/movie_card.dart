// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_state_managements/favorite_app/model/movie_model.dart';
import 'package:flutter_state_managements/helpers/movie_provider.dart';
import 'package:provider/provider.dart';

class MovieCards extends StatelessWidget {
  MovieCards({
    super.key,
    this.isFavoritePage,
    required this.title,
    required this.duration,
    required this.id,
    required this.clickedFavorite,
  });

  final bool? isFavoritePage;
  final String title;
  final String duration;
  final int id;
  final Function clickedFavorite;

  final newMovies = MovieModel();

  @override
  Widget build(BuildContext context) {
    // final movieProvider = Provider.of<MovieProvider>(context, listen: false).clickedFavorite;
    return SizedBox(
      height: 70,
      width: 350,
      child: Card(
        color: isFavoritePage == false ? Colors.blueGrey[700] : Colors.grey,
        elevation: 1.5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontFamily: "Montserrat",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    duration,
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontFamily: "Montserrat",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              isFavoritePage == false
                  ? GestureDetector(
                      onTap: () {
                        clickedFavorite();
                        Provider.of<MovieProvider>(context, listen: false)
                            .setClickedFavorite(id);
                      },
                      child: Icon(
                        Icons.favorite,
                        color: Provider.of<MovieProvider>(context, listen: true)
                                    .clickedFavorite
                                    .contains(id) ==
                                true
                            ? Colors.red
                            : Colors.white,
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        clickedFavorite();
                      },
                      child: Text(
                        'Remove',
                        style: TextStyle(
                          color: Color.fromARGB(255, 231, 24, 24),
                          fontFamily: "Montserrat",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
