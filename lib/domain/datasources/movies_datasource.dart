import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDataSource {

//info de retorno una lista de movie
  Future<List<Movie>> getNowPlaying( { int page = 1} );
}