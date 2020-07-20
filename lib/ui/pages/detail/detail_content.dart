import 'package:flutter/material.dart';
import 'package:deliciousfood/core/model/meal_model.dart';
import 'package:deliciousfood/core/extension/int_extentsion.dart';

class LDDetailContent extends StatelessWidget {
  final LDMealModel _meal;

  LDDetailContent(this._meal);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          buildImage(),
          buildTilte("材料制作"),
          buildMaterials(context),
          buildTilte("步骤"),
          buildStep(context)
        ],
      ),
    );
  }

  Widget buildImage() {
    return Image.network(_meal.imageUrl, width: double.infinity);
  }

  Widget buildMaterials(BuildContext context) {
    return buildList(
        context: context,
        child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _meal.ingredients.length,
            itemBuilder: (ctx, index) {
              return Card(
                color: Colors.amber,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(_meal.ingredients[index]),
                ),
              );
            }));
  }

  Widget buildStep(BuildContext context) {
    return buildList(
        context: context,
        child: ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _meal.steps.length,
          itemBuilder: (ctx, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text("#${index + 1}"),
              ),
              title: Text(_meal.steps[index]),
            );
          },
          separatorBuilder: (ctx, index) {
            return Divider();
          },
        ));
  }

  // 公共方法

  Widget buildTilte(String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.px),
      child: Text(
        title,
        style: TextStyle(fontSize: 20.px, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildList({BuildContext context, Widget child}) {
    return Container(
      padding: EdgeInsets.all(8.px),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.px)),
      width: MediaQuery.of(context).size.width - 30.px,
      child: child,
    );
  }
}
