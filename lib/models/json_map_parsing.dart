import 'dart:convert';

import 'package:biz_card/models/post.dart';
import 'package:biz_card/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:progress_indicators/progress_indicators.dart';

class JsonMapParsin extends StatefulWidget {
  @override
  _JsonMapParsinState createState() => _JsonMapParsinState();
}

class _JsonMapParsinState extends State<JsonMapParsin> {
   Future<PostList> ? data;
  @override
  void initState() {
    super.initState();
    Network network = Network('https://jsonplaceholder.typicode.com/posts');
    data = network.loadPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primeryBrownDark,
        title: Text('Json Map Parsing'),
      ),
      body: Center(
          child: FutureBuilder(
              future: data,
              builder: (context, AsyncSnapshot<PostList> snapshot) {
                List<Post> allPosts;
                if (snapshot.hasData) {
                  allPosts = snapshot.data!.posts;
                  return createListView(allPosts, context);
                } else {
                  return Center(
                    child: GlowingProgressIndicator(
                        duration: Duration(seconds: 2),
                        child: FadingText(
                          'Loading...',
                          style:
                              TextStyle(fontSize: 25, color: primeryBrownDark),
                        )),
                  );
                }
              })),
    );
  }

  Widget createListView(List<Post> data, BuildContext context) {
    return Container(
     
    
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, int index) {
            return Card(
              color: primeryBrownDark,
              child: Padding(
                padding:  EdgeInsets.all(16.0),
                child: ListTile(
                  
                  title: Text('${data[index].title}', style: TextStyle(color: Colors.white),),
                  subtitle: Text('${data[index].id}',  style: TextStyle(color: primeryBrownLight),),
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Text("${data[index].id}", style: TextStyle(color: primeryBrownLight),),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class Network {
  final String url;

  Network(this.url);
  Future<PostList> loadPosts() async {
    final response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      return PostList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Something went wrong');
    }
  }
}
