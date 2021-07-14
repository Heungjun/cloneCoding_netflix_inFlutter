import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  Tab _tabBarItem(IconData iconData, [String text = '']) {
    return Tab(
      icon: Icon(
        iconData,
        size: 18,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 9,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Container(
        height: 50,
        child: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          indicatorColor: Colors.transparent,
          tabs: <Widget>[
            _tabBarItem(Icons.home, '홈'),
            _tabBarItem(Icons.search, '검색'),
            _tabBarItem(Icons.save_alt, '저장한 콘텐츠'),
            _tabBarItem(Icons.list, '더보기'),
          ],
        ),
      ),
    );
  }
}
