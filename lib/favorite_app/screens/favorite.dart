// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_state_managements/favorite_app/model/movie_model.dart';
import 'package:flutter_state_managements/favorite_app/widgets/movie_card.dart';
import 'package:flutter_state_managements/helpers/movie_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  final List favoritemovies;
  const FavoritePage({super.key, required this.favoritemovies});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List favoriteMovies = [];
  List<Map<String, dynamic>> filteredFavoriteMovies = [];
  @override
  void initState() {
    super.initState();

    log("favorite page 2 ${Provider.of<MovieProvider>(context, listen: false).addedFavoriteMovies}");
  }

  removeFavoriteMovie(int index) {
    for (var movie in favoriteMovies.toList()) {
      if (movie['id'] == index) {
        setState(() {
          Provider.of<MovieProvider>(context, listen: false)
              .setAddedFavoriteMovies(movie);
          Provider.of<MovieProvider>(context, listen: false)
              .setClickedFavorite(index);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    favoriteMovies =
        Provider.of<MovieProvider>(context, listen: false).addedFavoriteMovies;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'My List (${Provider.of<MovieProvider>(context, listen: false).addedFavoriteMovies.length})',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontFamily: "Montserrat",
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: favoriteMovies.length,
              itemBuilder: (context, index) {
                return MovieCards(
                  isFavoritePage: true,
                  title: favoriteMovies[index]['title'],
                  duration: favoriteMovies[index]['duration'],
                  id: favoriteMovies[index]['id'],
                  clickedFavorite: () {
                    removeFavoriteMovie(favoriteMovies[index]['id']);
                    Provider.of<MovieProvider>(context, listen: false)
                        .addedFavoriteMovies;
                  },
                );
              },
            )),
      ),
    );
  }
}
