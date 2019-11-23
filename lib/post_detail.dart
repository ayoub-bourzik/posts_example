import 'package:flutter/material.dart';
import 'package:posts_example/post.dart';

class PostDetail extends StatefulWidget {
  PostDetail({Key key, Post post,}) : super(key: key);

  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(),
    );
  }
}