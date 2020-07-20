import 'package:flutter/material.dart';
import 'package:deliciousfood/core/extension/int_extentsion.dart';

class LDHomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.px,
      child: Drawer(
        child: Column(
          children: <Widget>[
            buildHeader(),
            buildContent(Icon(Icons.restaurant), "进餐", () {

            }),
            buildContent(Icon(Icons.settings), "过滤", () {

            }),
          ],
        ),
      ),
    );

  }

  Widget buildHeader() {
    return Container(
      width: double.infinity,
      height: 88,
      color: Colors.orange,
      alignment: Alignment(0, 0.5),
      child: Text("标题", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
    );
  }

  Widget buildContent(Widget icon, String title, Function func) {
    return ListTile(
      leading: icon,
      title: Text(title),
      onTap: func,
    );
  }
}
