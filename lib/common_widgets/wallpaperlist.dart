import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:week5discussion/models/wallpaper_model.dart';

Widget WallpaperList({required List<WallPaperModel> wallpapers, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(), //smooth scroll
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wallpaper) {
        return GridTile(
            child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              wallpaper.src.portrait,
              fit: BoxFit.cover,
            ),
          ),
        ));
      }).toList(),
    ),
  );
}
