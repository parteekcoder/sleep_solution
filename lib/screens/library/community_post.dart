import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/library/article_viewer.dart';
import 'package:night_gschallenge/screens/library/podcast_play_screen.dart';

class CommunityPost extends StatefulWidget {
  bool isLiked = false;
  String name, description, image, title, type;
  List<dynamic>? episode = null;
  CommunityPost(
      {required this.description,
      required this.image,
      required this.name,
      required this.title,
      required this.type,
      this.episode});
  @override
  State<CommunityPost> createState() => _CommunityPostState();
}

class _CommunityPostState extends State<CommunityPost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      // decoration: BoxDecoration(color: Color.fromRGBO(143, 227, 221, 1),borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          if (widget.episode == null) {
            Navigator.of(context).pushNamed(ArticleViewer.routeName,
                arguments: {
                  'image': widget.image,
                  'title': widget.title,
                  'description': widget.description
                });
          }else{
            Navigator.of(context).pushNamed(PodcastScreenPlay.routeName,arguments: {
              'image':widget.image,
              'title':widget.title,
              'description':widget.description,
              'episodes':widget.episode
            });
          }
        },
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(child: Icon(Icons.person)),
                      Container(
                        child: Text(
                          widget.name,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Text(
                      "shared an ${widget.type}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  )
                ],
              ),
            ),
            Container(
              // padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Theme.of(context).buttonColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.circular(16)),
                child: Row(
                  children: [
                    Container(
                      width: 115,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          widget.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              widget.title,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              widget.description,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            widget.isLiked
                                ? Icons.thumb_up
                                : Icons.thumb_up_alt_outlined,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          onPressed: () {
                            setState(() {
                              widget.isLiked = !widget.isLiked;
                            });
                          }),
                      Container(
                        child: Text('Like'),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.comment,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        onPressed: null,
                      ),
                      Container(
                        child: Text('Comment'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              child: Text(""),
              decoration: BoxDecoration(color: Theme.of(context).dividerColor),
              height: 1,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
