class ModelMovie {
  static List<ModelMovie> getMovies() => [
        ModelMovie(
            'Terminator',
            '1991',
            'PG-16',
            '25 Dec 1991',
            '2 h 36 min',
            'Action, thriller, fantasy, science fiction, detective, adventure',
            'James Cameron',
            'James Cameron',
            'Arnold Schwarzenegger, Linda Hamilton, Robert Patrick',
            'Terminator 2 follows Sarah Connor (Hamilton) and her ten-year-old son John (Furlong) as they are pursued by a new, more advanced Terminator: the liquid metal, shapeshifting T-1000 (Patrick), sent back in time to kill John and prevent him from becoming the leader of the human resistance',
            'English, Spanish',
            'USA',
            '2 oscars',
            'https://www.spletnik.ru/img/__post/30/30ca7b16fea6c33194c5e443180e9b47_669.jpg',
            '83',
            '8.5',
            '890, 617',
            'tt04995449',
            'movie',
            'True', [
          'https://i.pinimg.com/originals/9f/3f/85/9f3f853daf9c8d1c6bd2aed25fe1f6ed.jpg',
          'https://i.pinimg.com/236x/c9/0a/a6/c90aa61942b850ca9f1b906ec4ed6fab--terminator-movies-the-terminator.jpg',
          'https://i.pinimg.com/236x/57/18/2d/57182db2a6edba1051dfed9d85a31616--linda-hamilton-terminator-arnold-terminator.jpg',
          'https://wallpaperaccess.com/full/1571228.jpg',
          'https://i.pinimg.com/474x/05/42/a4/0542a49f1d1efcc7046f350db3ca23c4.jpg',
        ]),
        ModelMovie(
            'Matrix',
            '1999',
            'PG-15',
            '14 Oct 1999',
            '2 h 16 min',
            'Action, fantasy, science fiction, adventure',
            'Lana Wachowski, Lilly Wachowski',
            'Lilly Wachowski, Lana Wachowski',
            'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss, Hugo Weaving',
            'The Matrix is a computer-generated dream world designed to keep these humans under control. Humans are kept sedated, effectively living a virtual life. Neo awakens in a bed back on Morpheus\'s ship, and Morpheus further explains that one man was born into the Matrix with the power to change anything in it',
            'English, Spanish',
            'USA',
            '3 oscars',
            'https://250.took.nl/img/posters/large/0133093_large.jpg',
            '83',
            '8.5',
            '522, 950',
            'tt04995449',
            'movie',
            'True', [
          'https://m.media-amazon.com/images/M/MV5BMTkyODYyMTI1N15BMl5BanBnXkFtZTcwNDU3MTIxNA@@._V1_.jpg'
              'https://d2e111jq13me73.cloudfront.net/sites/default/files/styles/review_gallery_carousel_slide_thumbnail/public/screenshots/csm-movie/the-matrix-ss1.jpg?itok=gmTx4J8j',
          'https://64.media.tumblr.com/745a54e04bbdfea6c2b46c56ab6136b1/tumblr_ooql4wh0Yy1qetb0ho1_1280.jpg',
          'https://miro.medium.com/max/1313/1*788QODQjX67FKWYyGl7Udw.jpeg',
          'https://i1.sndcdn.com/artworks-000276434912-dfbggz-t500x500.jpg',
        ]),
        ModelMovie(
            'The Shawshank Redemption',
            '1994',
            'PG-16',
            '25 Dec 1994',
            '2 h 36 min',
            'Action, thriller, fantasy, science fiction, detective, adventure',
            'James Cameron',
            'James Cameron',
            'Arnold Schwarzenegger, Linda Hamilton, Robert Patrick',
            'Terminator 2 follows Sarah Connor (Hamilton) and her ten-year-old son John (Furlong) as they are pursued by a new, more advanced Terminator: the liquid metal, shapeshifting T-1000 (Patrick), sent back in time to kill John and prevent him from becoming the leader of the human resistance',
            'English, Spanish',
            'USA',
            '2 oscars',
            'https://mir-s3-cdn-cf.behance.net/project_modules/disp/2fa44b15344917.5628fd261893b.jpg',
            '73',
            '8.7',
            '890, 617',
            'tt04995449',
            'movie',
            'True', [
          'https://www.film.ru/sites/default/files/movies/frames/The-Shawshank-Redemption-01.jpg',
          'https://www.film.ru/sites/default/files/movies/frames/The-Shawshank-Redemption-02.jpg',
          'https://images.pristineauction.com/36/368436/main_1-David-Proval-Signed-The-Shawshank-Redemption-8x10-Photo-JSA-COA-PristineAuction.com.jpg',
          'https://i.pinimg.com/originals/ef/44/16/ef441685c738583664ccff7d73fbfb9f.jpg',
          'https://i.pinimg.com/originals/3c/8e/9c/3c8e9c044f53b994431f4aea37783760.jpg'
        ]),
      ];

  String title;
  String year;
  String rated;
  String released;
  String runtime;
  String genre;
  String director;
  String writer;
  String actors;
  String plot;
  String language;
  String country;
  String awards;
  String poster;
  String metascore;
  String imdbRating;
  String imdbVotes;
  String imdbID;
  String type;
  String response;
  List<String> images;
  ModelMovie(
      this.title,
      this.year,
      this.rated,
      this.released,
      this.runtime,
      this.genre,
      this.director,
      this.writer,
      this.actors,
      this.plot,
      this.language,
      this.country,
      this.awards,
      this.poster,
      this.metascore,
      this.imdbRating,
      this.imdbVotes,
      this.imdbID,
      this.type,
      this.response,
      this.images);
}
