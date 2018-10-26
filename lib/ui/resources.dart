import 'package:flutter/material.dart';

import 'package:afyabora/utils/api.dart';
import 'package:afyabora/models/resources/resource.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

class Resources extends StatefulWidget {
  @override
  _ResourcesState createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
  Future<Null> _launched;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Resource>>(
        future: api.getResources(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: '${snapshot.data[index].thumb}',
                          ),
                          ListTile(
                            title: Text('${snapshot.data[index].title}'),
                            onTap: () {
                              setState(() {
                               _launched = _launchURL(snapshot.data[index].url);
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  },
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future<Null> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
