import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:paap_app/helper/data.dart';
import 'package:paap_app/helper/news.dart';
import 'package:paap_app/models/Article.dart';
import 'package:paap_app/models/Category.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Category> categoryList = <Category>[];
  List<Article> articleList = <Article>[];
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryList = getCategory();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articleList = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PaaP",
        ),
        centerTitle: true,
        elevation: 0.0,
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
              child: Column(
                  children: <Widget>[
                    // CATEGORIES
                    Container(
                      height: 70,
                      child: ListView.builder(
                          itemCount: categoryList.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategoryTile(
                                imageUrl: categoryList[index].imageUrl,
                                categoryName: categoryList[index].categoryName);
                          }),
                    ),

                    // BLOGS
                    Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: articleList.length,
                        itemBuilder: (context, index){
                           return BlogTile(
                             imageUrl: articleList[index].urlToImage,
                             title: articleList[index].title,
                             description: articleList[index].description,
                           );
                        },
                      ),
                    )
                  ],
                ),
              ),
          ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;

  CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                imageUrl,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 120,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.black26),
              child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, description;

  BlogTile(
      {required this.imageUrl, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(imageUrl),
          Text(title),
          Text(description)
        ],
      ),
    );
  }
}
