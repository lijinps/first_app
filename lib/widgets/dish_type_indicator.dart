
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodTypeIndicator extends StatelessWidget {
  final int foodType;
  FoodTypeIndicator({
    this.foodType,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          border: Border.all(
            color: foodType == 1 ? Colors.red : Colors.green,
          ),
        ),
        padding: EdgeInsets.all(5),
        child: CircleAvatar(
          backgroundColor: foodType == 1 ? Colors.red : Colors.green,
          radius: 1,
        ));
  }
}
