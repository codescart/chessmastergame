import 'package:flutter/material.dart';

class AppTheme {
  String name;
  LinearGradient background;
  Color lightTile;
  Color darkTile;
  Color moveHint;
  Color checkHint;
  Color latestMove;
  Color border;

  AppTheme({
    this.name,
    this.background,
    this.lightTile = const Color(0xFFC9B28F),
    this.darkTile = const Color(0xFF69493b),
    this.moveHint = const Color(0xdd5c81c4),
    this.latestMove = const Color(0xccc47937),
    this.checkHint = const Color(0x88ff0000),
    this.border = const Color(0xffffffff),
  });
}

List<AppTheme> get themeList {
  var themeList = <AppTheme>[
    AppTheme(
      name: 'Light',
      background: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xD8AFA9E6),
          Color(0xFF99A4E4),
        ],
      ),
      lightTile: const Color(0xffd18b47),
      darkTile: const Color(0xffffce9e),
      moveHint: const Color(0xaaffff00),
      latestMove: const Color(0xaadb70eb),
      border: const Color(0xff184387),
    ),
    AppTheme(
      name: 'Dark',
      background: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF0E082E),
          Color(0xFF231A75),
        ],
      ),
      lightTile: const Color(0xff0088ff),
      darkTile: const Color(0xff8934eb),
      moveHint: const Color(0xdddb70eb),
      checkHint: const Color.fromARGB(135, 184, 111, 111),
      latestMove: const Color(0xcc2dba6f),
      border: const Color(0xffdb70eb),
    ),
  ];
  themeList.sort((a, b) => a.name.compareTo(b.name));
  return themeList;
}
