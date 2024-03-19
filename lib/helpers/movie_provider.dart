// ignore_for_file: prefer_final_fields

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_state_managements/favorite_app/screens/favorite.dart';

class MovieProvider extends ChangeNotifier {
  bool _isFavotite = false;
  List<dynamic> _clickedFavorite = [];
  List _addedFavoriteMovies = [];

  get isFavorite => _isFavotite;
  get clickedFavorite => _clickedFavorite;
  get addedFavoriteMovies => _addedFavoriteMovies;

  Future<bool> setClickedFavorite(int value) async {
    if (_clickedFavorite.contains(value) == true) {
      _clickedFavorite.remove(value);
    } else {
      _clickedFavorite.add(value);
    }
    notifyListeners();
    return true;
  }

  Future<bool> setAddedFavoriteMovies(Map<String, dynamic> value) async {
    log("i was called!!");
    if (_addedFavoriteMovies.contains(value)) {
      _addedFavoriteMovies.remove(value);
    } else {
      _addedFavoriteMovies.add(value);
    }
    log('set value $_addedFavoriteMovies');
    notifyListeners();
    return true;
  }

  // Future<bool> removeFavoriteMovie(
  //     int index, Map<String, dynamic> movie) async {
  //   log('id passed $index');

  //   log("inside provider method: $index");
  //   log("this movies $movie");
  //   setAddedFavoriteMovies(movie);
  //   setClickedFavorite(index);
  //   notifyListeners();
  //   return true;
  // }
}
