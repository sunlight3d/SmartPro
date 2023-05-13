import 'package:flutter/material.dart';
import 'package:myapp/widgets/rating_dialog.dart';

void showRatingDialog(BuildContext context, Function(int rating) onRatingSelected) {
  showDialog(context: context, builder: (BuildContext context){
    return RatingDialog(onRatingSelected: onRatingSelected);
  });
}