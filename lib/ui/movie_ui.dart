import 'package:biz_card/models/model_movie.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {
  final String? thumbnail;

  MovieDetails({
    Key? key,
    this.thumbnail,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
                margin: EdgeInsets.all(3.0),
                width: MediaQuery.of(context).size.width,
                height: 250.0,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(12.0),
                    image: DecorationImage(
                        image: NetworkImage('$thumbnail'), fit: BoxFit.fill))),
            Icon(
              Icons.play_circle_outline,
              color: Colors.white,
              size: 100,
            )
          ],
        ),
      ],
    );
  }
}

TextStyle myTextStyle() {
  return TextStyle(fontSize: 15.0, color: Colors.white70);
}

class MovieDetailsHeaderWithPoster extends StatelessWidget {
  final ModelMovie? movie;
  MovieDetailsHeaderWithPoster({Key? key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        children: [
          Moviposter(poster: movie?.poster),
          SizedBox(
            width: 20.0,
          ),
          Expanded(child: MovieDetailsHeder(movie: movie))
        ],
      ),
    );
  }
}

class Moviposter extends StatelessWidget {
  final String? poster;

  const Moviposter({Key? key, this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        height: 200.0,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            image: DecorationImage(
                image: NetworkImage(poster!), fit: BoxFit.cover)),
      ),
    );
  }
}

class MovieDetailsHeder extends StatelessWidget {
  final ModelMovie? movie;

  const MovieDetailsHeder({Key? key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${movie?.title}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28.0,
            )),
        Text(
          'Release date ${movie?.released}'.toUpperCase(),
          style:
              TextStyle(fontWeight: FontWeight.w400, color: Colors.blueAccent),
        ),
        Text('Gener: ${movie?.genre}',
            style: TextStyle(
                fontWeight: FontWeight.w400, color: Colors.blueAccent)),
        SizedBox(
          height: 5.0,
        ),
        Text.rich(TextSpan(
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
            children: [TextSpan(text: movie?.plot)]))
      ],
    );
  }
}

class MovieCast extends StatelessWidget {
  final ModelMovie? movie;
  final String? images;

  const MovieCast({Key? key, this.movie, this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          children: [
            Container(
              height: 1.5,
              color: Colors.grey,
            ),
            Row(
              children: [
                Text('Cast: ',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w300,
                    )),
                Flexible(
                  child: Text(movie!.actors,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w300,
                      )),
                ),
              ],
            ),
            Row(
              children: [
                Text('Director: ',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w300,
                    )),
                Text(movie!.director,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w300,
                    )),
              ],
            ),
            Row(
              children: [
                Text('Awards: ',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w300,
                    )),
                Text(movie!.awards,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w300,
                    )),
              ],
            ),
            Container(
              height: 1.5,
              color: Colors.grey,
            ),
          ],
        ));
  }
}

class AllMovieImages extends StatelessWidget {
  final List<String>? images;

  const AllMovieImages({Key? key, this.images}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Movie images'.toUpperCase(),
            style: TextStyle(fontSize: 14.0, color: Colors.blue),
          ),
          Container(
            height: 180,
            child: ListView.separated(
              itemCount: images!.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return Padding(padding: EdgeInsets.symmetric(horizontal: 3.0));
              },
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width / 3.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      image: DecorationImage(
                          image: NetworkImage(images![index]),
                          fit: BoxFit.cover)),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
