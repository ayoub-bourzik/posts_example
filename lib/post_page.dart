import 'package:flutter/material.dart';
import 'package:posts_example/post.dart';
import 'package:posts_example/post_detail.dart';

class PostsPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Latest News"),
      ),
      body: FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post> posts = snapshot.data;
            return ListView(
              children: posts
                  .map(
                    (Post post) => Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(post.title),
                          subtitle: Text("Ajouter par user : ${post.userId}"),
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PostDetail(
                                post: post,
                              ),
                            ),
                          ),
                        ),
                        Divider(color: Colors.black),
                      ],
                    ),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
