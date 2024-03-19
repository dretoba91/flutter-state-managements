// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_state_managements/favorite_app/model/movie_model.dart';
import 'package:flutter_state_managements/favorite_app/widgets/movie_card.dart';
import 'package:flutter_state_managements/helpers/movie_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Movies extends StatefulWidget {
  const Movies({super.key});

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  List<Map<String, dynamic>> movieLists = [];
  List<Map<String, dynamic>> favoriteMovies = [];
  List<Map<String, dynamic>> removeDup = [];
  final newMovies = MovieModel();

  @override
  void initState() {
    super.initState();
    setState(() {
      movieLists.addAll(newMovies.movies);
    });
    log("added movie lists $movieLists");
  }

  clickFavorite(int index) {
    log('id passed $index');

    log("inside map method: $index");
    for (var movie in movieLists) {
      if (movie['id'] == index) {
        removeDup.add(movie);
        Provider.of<MovieProvider>(context, listen: false)
            .setAddedFavoriteMovies(movie);
        // if (Provider.of<MovieProvider>(context, listen: false)
        //     .addedFavoriteMovies
        //     .contains(movie)) {
        //   log("this is true");
        // } else {
        //   Provider.of<MovieProvider>(context, listen: false)
        //       .setAddedFavoriteMovies(movie);
        // }
      }
    }
    favoriteMovies = removeDup.toSet().toList();

    log("movies added => $favoriteMovies");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Provider',
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70,
                  width: 380,
                  child: GestureDetector(
                    onTap: () {
                      context.goNamed('favorite', extra: {
                        'favorite_movies': favoriteMovies,
                      });
                    },
                    child: Card(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      color: Colors.deepOrange,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Go to my list',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontFamily: "Montserrat",
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '(${Provider.of<MovieProvider>(context, listen: true).addedFavoriteMovies.length})',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontFamily: "Montserrat",
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: movieLists.length,
                    itemBuilder: (context, index) {
                      return MovieCards(
                          isFavoritePage: false,
                          title: movieLists[index]['title'],
                          duration: movieLists[index]['duration'],
                          id: movieLists[index]['id'],
                          clickedFavorite: () {
                            clickFavorite(movieLists[index]['id']);
                          });
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}
