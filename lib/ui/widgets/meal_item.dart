import 'package:deliciousfood/core/viewmodel/favorite_view_model.dart';
import 'package:deliciousfood/ui/pages/detail/detail.dart';
import 'package:deliciousfood/ui/widgets/operation_item.dart';
import 'package:flutter/material.dart';

import 'package:deliciousfood/core/model/meal_model.dart';
import 'package:deliciousfood/core/extension/int_extentsion.dart';
import 'package:provider/provider.dart';

final cardRadius = 12.px;

class LDMealItem extends StatelessWidget {
  final LDMealModel _meal;

  LDMealItem(this._meal);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Card(
          margin: EdgeInsets.all(10.px),
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(cardRadius)),
          child: Column(
            children: <Widget>[buildContentInfo(), buildOperationInfo()],
          ),
        ),
        onTap: () {
          Navigator.of(context)
              .pushNamed(LDDetailScreen.routeName, arguments: _meal);
        });
  }

  Widget buildContentInfo() {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(cardRadius),
            topRight: Radius.circular(cardRadius),
          ),
          child: Image.network(
            _meal.imageUrl,
            width: double.infinity,
            height: 200.px,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            bottom: 5.px,
            right: 5.px,
            child: Container(
              width: 250.px,
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(6.px)),
              padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 5.px),
              child: Text(
                _meal.title,
                style: TextStyle(fontSize: 20.px, color: Colors.white),
              ),
            ))
      ],
    );
  }

  Widget buildOperationInfo() {
    return Padding(
      padding: EdgeInsets.all(4.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          LDOperationItem(Icon(Icons.schedule), "${_meal.duration}分钟"),
          LDOperationItem(Icon(Icons.restaurant), "${_meal.complexStr}"),
          buildFavorItem(),
        ],
      ),
    );
  }

  Widget buildFavorItem() {
    return Consumer<LDFavoriteViewModel>(builder: (ctx, favoriteVM, child) {
      final isFavorite = favoriteVM.isFavor(_meal);
      final iconWidget = isFavorite ? Icons.favorite : Icons.favorite_border;
      final iconColor = isFavorite ? Colors.redAccent : Colors.black;
      final title = isFavorite ? "已收藏" : "未收藏";
      return GestureDetector(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.px),
          child: LDOperationItem(
              Icon(
                iconWidget,
                color: iconColor,
              ),
              title),
        ),
        onTap: () {
          favoriteVM.handleMeal(_meal);
        },
      );
    });
  }
}
