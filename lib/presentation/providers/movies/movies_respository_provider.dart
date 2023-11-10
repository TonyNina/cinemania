
import 'package:cinemapedia/infraestructure/datasource/mobiedb_datasource.dart';
import 'package:cinemapedia/infraestructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//este repositorio es inmutable, su objetivo es proporcionar
// a todos los demas providers la inf necesaria para que puedan consultar
//la info de RepositoryImpl
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
} );
 