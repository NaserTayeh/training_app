// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_brace_in_string_interps

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class IngredientProgress extends StatelessWidget {
  final String ingredient;
  final double leftAmount;
  final double progress, width;
  final Color progressColor;

  IngredientProgress({
    required this.ingredient,
    required this.leftAmount,
    required this.progress,
    required this.progressColor,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ingredient.toUpperCase(),
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Container(
                  height: 10,
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                Container(
                  height: 10,
                  width: width * progress,
                  decoration: BoxDecoration(
                      color: progressColor,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Text('${leftAmount} ' + 'unit'.tr())
          ],
        )
      ],
    );
  }
}
