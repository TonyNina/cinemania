import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



//Provider para colocar solo 6 en el swiper
//  "ref" es la referencia a todo el arbol que crea provider
//Este es provider que va a traer las 6 peliculas 

final moviesSlideShowProvider = Provider<List<Movie>>((ref) {

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider); 

    if (nowPlayingMovies.isEmpty) return [];
    return nowPlayingMovies.sublist(0,6);


});