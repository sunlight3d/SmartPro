import 'package:flutter/material.dart';

class RatingDialog extends StatelessWidget {
  final Function(int rating) onRatingSelected;

  const RatingDialog({Key? key,
    required this.onRatingSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Đánh giá ứng dụng'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Chọn số sao cho ứng dụng:'),
          SizedBox(height: 16),
          _buildRatingStars(context),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Hủy'),
        ),
      ],
    );
  }

  Widget _buildRatingStars(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        final starCount = index + 1;
        return Expanded(child: IconButton(
          onPressed: () {
            onRatingSelected(starCount);
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.star, color: Colors.amber),
          iconSize: 40,
        ));
      }),
    );
  }
}
