import 'package:flutter/material.dart';
import 'package:paap_app/helper/news.dart';
import 'package:paap_app/models/Article.dart';
import 'package:paap_app/views/article_view.dart';

class CategoryNews extends StatefulWidget {
  final String category;

  CategoryNews(this.category);

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<Article> articleList = [];
  bool _loading = true;

  getCategoryNews() async {
    CatNews newsClass = CatNews();
    await newsClass.getNews(widget.category);
    articleList = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "PaaP",
          ),
          centerTitle: true,
          elevation: 0.0,
          actions: <Widget>[
            Opacity(
              opacity: 0,
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Icon(Icons.save)),
            )
          ],
        ),
        body: _loading
            ? Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 16),
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: articleList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return BlogTile(
                        imageUrl: articleList[index].urlToImage,
                        title: articleList[index].title,
                        description: articleList[index].description,
                        url: articleList[index].url,
                      );
                    },
                  ),
                ),
              ));
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, description, url;

  BlogTile(
      {required this.imageUrl,
      required this.title,
      required this.description,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArticleView(blogUrl: url)));
                  },
                  child: Image.network(imageUrl))),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(color: Colors.black54),
          )
        ],
      ),
    );
  }
}
