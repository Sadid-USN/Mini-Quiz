class PostList {
  final List<Post> posts;

  PostList({required this.posts});

  factory PostList.fromJson(List<dynamic> parsedJson) {
    List<Post> posts = [];
    posts = parsedJson.map((e) => Post.fromJson(e)).toList();

    return PostList(posts: posts);
  }
}

class Post {
  int? albumId;
  int? id;
  String? title;
  String? body;

  Post({this.albumId, this.body, this.id, this.title});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        albumId: json['albumId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }
}
