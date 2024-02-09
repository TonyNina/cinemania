



//este repositorio es inmutable, su objetivo es proporcionar
// a todos los demas providers la inf necesaria para que puedan consultar
//la info de RepositoryImpl
import 'package:cinemapedia/infraestructure/datasource/actor_moviedb_datasource.dart';
import 'package:cinemapedia/infraestructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMovieDbDatasource());
} );
 