import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieHorizontalListview extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListview(
      {super.key,
      required this.movies,
      this.title,
      this.subTitle,
      this.loadNextPage});

  @override
  State<MovieHorizontalListview> createState() => _MovieHorizontalListviewState();
}

class _MovieHorizontalListviewState extends State<MovieHorizontalListview> {

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;

      if (( scrollController.position.pixels + 200) >= scrollController.position.maxScrollExtent) {
        print('Load next movie');

        widget.loadNextPage!();
      }
      
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (widget.title != null || widget.subTitle != null)
            _Title(title: widget.title, subTitle: widget.subTitle),
          Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: widget.movies.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
              return FadeInRight(child: _SildeH(movie: widget.movies[index]));
            },
          ))
        ],
      ),
    );
  }
}

class _SildeH extends StatelessWidget {
  final Movie movie;
  const _SildeH({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          //* Imagen
          SizedBox(
            width: 150,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(movie.posterPath,
                    fit: BoxFit.cover, width: 150,
                    loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const CircularProgressIndicator(strokeAlign: 1);
                  }
                  return child;
                })),
          ),

          const SizedBox(height: 5),

          //* Titulo
          SizedBox(
            width: 150,
            child: Container(
              height: 25,
              child: Text(
                movie.title,
                maxLines: 2,
                style: textStyles.titleSmall,
              ),
            ),
          ),

          //* Rating
          SizedBox(
            width: 150,
            child: Row(
              children: [
                const Icon(
                  Icons.star_half_rounded, color: Colors.yellow),
                  const SizedBox(width: 3),
                  Text(movie.voteAverage.toStringAsFixed(1), style: textStyles.bodyMedium?.copyWith( color: Color.fromARGB(255, 199, 181, 20))), 
                  const Spacer(),
                  Text(HumanFormats.number( movie.popularity), style: textStyles.bodyMedium ), 
          
          
          
          
                
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const _Title({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null) Text(title!, style: titleStyle),
          const Spacer(),
          if (subTitle != null)
            FilledButton.tonal(
                style: const ButtonStyle(visualDensity: VisualDensity.compact),
                onPressed: () {},
                child: Text(subTitle!))
        ],
      ),
    );
  }
}
