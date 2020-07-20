import 'package:flutter/material.dart';
import 'package:deliciousfood/core/extension/int_extentsion.dart';

class LDOperationItem extends StatelessWidget {

  final Widget _icon;
  final String _title;

  LDOperationItem(this._icon, this._title);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: <Widget>[
          _icon,
          SizedBox(width: 3.px,),
          Text(_title)
        ],
    );
  }
}
