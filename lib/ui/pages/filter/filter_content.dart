import 'package:deliciousfood/core/viewmodel/filter_view_model.dart';
import 'package:flutter/material.dart';

import 'package:deliciousfood/core/extension/int_extentsion.dart';
import 'package:provider/provider.dart';

class LDFilterContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[buildHeader(), buildContent()],
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      height: 80.px,
      alignment: Alignment.center,
      child: Text("展示你的选择"),
    );
  }

  Widget buildContent() {
    return Expanded(
        child: Consumer<LDFilterViewModel>(builder: (ctx, filterVM, child) {
      return ListView(children: <Widget>[
        buildTitleView("五谷蛋白", "展示五谷蛋白", filterVM.isGlutenFree, (value) {
          filterVM.isGlutenFree = value;
        }),
        buildTitleView("不含乳糖", "展示不含乳糖", filterVM.isLactoseFree, (value) {
          filterVM.isLactoseFree = value;
        }),
        buildTitleView("普通素食者", "展示普通素食者", filterVM.isVegetarian, (value) {
          filterVM.isVegetarian = value;
        }),
        buildTitleView("严格素食者", "展示严格素食者", filterVM.isVegan, (value) {
          filterVM.isVegan = value;
        })
      ]);
    }));
  }

  Widget buildTitleView(
      String title, String subTitle, bool isFavor, Function onChange) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: Switch(value: isFavor, onChanged: onChange),
    );
  }
}
