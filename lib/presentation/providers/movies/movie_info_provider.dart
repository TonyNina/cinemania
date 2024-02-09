import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_respository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {

  final movieRepository = ref.watch(movieRepositoryProvider);

  return MovieMapNotifier(getMovie: movieRepository.getMovieById);
});



typedef GetMovieCallBack = Future<Movie>Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String,Movie>> {
  
  final GetMovieCallBack getMovie; 

  MovieMapNotifier({
    required this.getMovie,
  }):super({});

  Future<void> loadMovie( String moviedId) async{
     if( state[moviedId] != null ) return;
     print('relizando peticion http');

     final movie = await getMovie(moviedId);
     state = {...state, moviedId: movie};
  }

}