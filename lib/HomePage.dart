import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: ClipRect(
          child: Banner(
            message: '饭团且龙爪',
            location: BannerLocation.topEnd,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _avatar(),
                _lists(),
              ],
            ),
          ),
        ),
      )),
    );
  }

  _avatar() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: CircleAvatar(
            maxRadius: 64,
            backgroundColor: Colors.transparent,
            backgroundImage:
                NetworkImage('https://yangxiaoge.github.io/img/avatar.png'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            'Bruce Yang',
            style: TextStyle(fontSize: 26),
          ),
        ),
      ],
    );
  }

  _lists() {
    List<Widget> listTiles = [];
    listTiles.add(_listItem("https://yangjianan.gitee.io/img/GitHub.webp",
        "Github", "关注我的开源项目 👨‍💻", "https://github.com/yangxiaoge"));
    listTiles.add(_listItem("https://yangjianan.gitee.io/img/kuan.webp", "Blog",
        "浏览我的最新博客 ✍", "http://yangjianan.gitee.io/"));
    listTiles.add(_listItem("https://yangjianan.gitee.io/img/shoukuan1.webp",
        "Award", "打赏我😋😍😃", "https://yangjianan.gitee.io/money/index.html"));
    listTiles.add(_listItem("https://yangjianan.gitee.io/img/bilibili.webp",
        "About", "关于我😋😍😃", "https://yangxiaoge.github.io/about/"));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: listTiles,
    );
  }

  _listItem(path, name, subTitle, link) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(path),
        backgroundColor: Colors.transparent,
      ),
      title: Text(name),
      subtitle: Text(subTitle),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        _launch(link);
      },
    );
  }

  _launch(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('不能启动');
    }
  }
}
