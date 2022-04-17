import 'dart:convert';

import 'package:biz_card/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:progress_indicators/progress_indicators.dart';

class JsonParsing extends StatefulWidget {
  @override
  _JsonParsingState createState() => _JsonParsingState();
}

class _JsonParsingState extends State<JsonParsing> {
  Future? data;

  @override
  void initState() {
    super.initState();
    data = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parsing Json'),
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
              future: getData(),
              builder: (context, AsyncSnapshot snapShot) {
                if (snapShot.hasData) {
                  return createListView(snapShot.data, context);

                  // Text(
                  //   snapShot.data[5]['id'].toString(),
                  //   style: TextStyle(
                  //     fontSize: 25,
                  //   ),
                  // ); // this operration is indentical to the 'then' operation

                }
                return Center(
                  child: GlowingProgressIndicator(
                      duration: Duration(seconds: 2),
                      child: FadingText(
                        'Loading...',
                        style: TextStyle(fontSize: 25, color: primeryBrownDark),
                      )),
                );
              }),
        ),
      ),
    );
  }

  Widget createListView(List data, BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, int index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Text('${data[index]['title']}'),
              subtitle: Text('${data[index]['id']}'),
              leading: 
                CircleAvatar(
                  backgroundColor: primeryBrownLight,
                  radius: 25,
                  child: Text('${data[index]['id']}'),
                )
             
            ),
          ],
        );
      }),
    );
  }

  Future getData() async {
    var data;
    String url = 'https://jsonplaceholder.typicode.com/photos';
    NetworkObjects network = NetworkObjects(url);
    data = network.fetchData();
    // data.then((value) {
    //   print(value[0]['url']);
    // });

    return data;
  }
}

class NetworkObjects {
  final String url;

  NetworkObjects(this.url);

  Future fetchData() async {
    print(url);

    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
