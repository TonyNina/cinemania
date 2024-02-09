


import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/credits_response.dart';

class ActorMapper{
  static Actor castToEntity( Cast cast) => Actor(
    id: cast.id, 
    name: cast.name, 
    profilePath: cast.profilePath != null
    ? 'https://image.tmdb.org/t/p/w500${ cast.profilePath }'
    : 'https://i.pinimg.com/280x280_RS/e3/fc/f6/e3fcf6baaae5099edae7867dccd23854.jpg', 
    character: cast.character);
}