import 'package:calculator/app/core/ui/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final String valueToDisplay;
  final String history;
  const ResultWidget(
      {super.key, required this.valueToDisplay, required this.history});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: const Color(0xFFecece9),
            width: 1.5,
          ),
        ),
        alignment: const Alignment(1.0, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 5),
                child: Icon(
                  Icons.history,
                  color: AppColors.strongGrey,
                ),
              ),
            ),
            RichText(
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              text: TextSpan(
                  text: '$history \n',
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.strongGrey,
                  ),
                  children: [
                    TextSpan(
                      text: valueToDisplay,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
