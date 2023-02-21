import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:week5discussion/common_widgets/brandname.dart';
import 'package:week5discussion/common_widgets/wallpaperlist.dart';
import 'package:week5discussion/data/data.dart';
import 'package:week5discussion/models/categories_model.dart';
import 'package:http/http.dart' as http;
import 'package:week5discussion/models/wallpaper_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoriesModel> categories = [];
  List<WallPaperModel> wallpapers = [];

  getTrendingWallPapers() async {
    WallPaperModel? wallpaperModel;

    var response = await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?per_page=15&page=1"),
        headers: {"Authorization": apiKey});

    // print(response.body.toString());

    Map<String, dynamic> jsonData = jsonDecode(response
        .body); //Parses the string and returns the resulting Json object.
    jsonData['photos'].forEach((element) => {
          wallpaperModel = WallPaperModel.fromMap(element),
          wallpapers.add(wallpaperModel!)
        });

    setState(() {});
  }

  @override
  void initState() {
    getTrendingWallPapers();
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(30)),
              margin: EdgeInsets.symmetric(horizontal: 24),
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Search Wallpapers",
                          border: InputBorder.none),
                    ),
                  ),
                  Icon(Icons.search)
                ],
              ),
            ),
            // HORIZONTAL LIST VIEW OF CATEGORIES
            SizedBox(
              height: 16,
            ),
            Container(
              height: 80,
              child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      title: categories[index].categoryName,
                      imgUrl: categories[index].imgUrl,
                    );
                  }),
            ),

            WallpaperList(wallpapers: wallpapers, context: context)
          ],
        )),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  CategoryTile({super.key, required this.imgUrl, required this.title});

  final String imgUrl, title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4),
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(imgUrl,
                  height: 50, width: 100, fit: BoxFit.cover)),
          Container(
            height: 50,
            width: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black26,
            ),
            child: Text(
              title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
