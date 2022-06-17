import 'package:calculator/app/entities/buttons.dart';
import 'package:calculator/app/modules/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'button_widget.dart';

class PortraitLayout extends StatelessWidget {
  final HomeController controller;
  const PortraitLayout({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ButtonWidget(
            label: Buttons.parenthesisLeft.label,
            color: Buttons.parenthesisLeft.color,
            onPressed: () {},
          ),
          ButtonWidget(
            label: Buttons.parenthesisRight.label,
            color: Buttons.parenthesisRight.color,
            onPressed: () {},
          ),
          ButtonWidget(
            label: Buttons.percentage.label,
            color: Buttons.percentage.color,
            onPressed: () {
              controller.percentage();
            },
          ),
          ButtonWidget(
            label: Buttons.clear.label,
            color: Buttons.clear.color,
            onPressed: () {
              controller.clear();
            },
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ButtonWidget(
            label: Buttons.seven.label,
            color: Buttons.seven.color,
            onPressed: () {
              controller.firstNumber(Buttons.seven.label);
            },
          ),
          ButtonWidget(
            label: Buttons.eight.label,
            color: Buttons.eight.color,
            onPressed: () {
              controller.firstNumber(Buttons.eight.label);
            },
          ),
          ButtonWidget(
            label: Buttons.nine.label,
            color: Buttons.nine.color,
            onPressed: () {
              controller.firstNumber(Buttons.nine.label);
            },
          ),
          ButtonWidget(
            label: Buttons.division.label,
            color: Buttons.division.color,
            onPressed: () {
              controller.secondNumber(Buttons.division.label);
            },
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ButtonWidget(
            label: Buttons.four.label,
            color: Buttons.four.color,
            onPressed: () {
              controller.firstNumber(Buttons.four.label);
            },
          ),
          ButtonWidget(
            label: Buttons.five.label,
            color: Buttons.five.color,
            onPressed: () {
              controller.firstNumber(Buttons.five.label);
            },
          ),
          ButtonWidget(
            label: Buttons.six.label,
            color: Buttons.six.color,
            onPressed: () {
              controller.firstNumber(Buttons.six.label);
            },
          ),
          ButtonWidget(
            label: Buttons.multiplication.label,
            color: Buttons.multiplication.color,
            onPressed: () {
              controller.secondNumber(Buttons.multiplication.label);
            },
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ButtonWidget(
            label: Buttons.one.label,
            color: Buttons.one.color,
            onPressed: () {
              controller.firstNumber(Buttons.one.label);
            },
          ),
          ButtonWidget(
            label: Buttons.two.label,
            color: Buttons.two.color,
            onPressed: () {
              controller.firstNumber(Buttons.two.label);
            },
          ),
          ButtonWidget(
            label: Buttons.three.label,
            color: Buttons.three.color,
            onPressed: () {
              controller.firstNumber(Buttons.three.label);
            },
          ),
          ButtonWidget(
            label: Buttons.subtraction.label,
            color: Buttons.subtraction.color,
            onPressed: () {
              controller.secondNumber(Buttons.subtraction.label);
            },
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ButtonWidget(
            label: Buttons.zero.label,
            color: Buttons.zero.color,
            onPressed: () {
              controller.firstNumber(Buttons.zero.label);
            },
          ),
          ButtonWidget(
            label: Buttons.dot.label,
            color: Buttons.dot.color,
            onPressed: () {
              controller.dot();
            },
          ),
          ButtonWidget(
            label: Buttons.result.label,
            color: Buttons.result.color,
            onPressed: () {
              controller.calculate();
            },
          ),
          ButtonWidget(
            label: Buttons.sum.label,
            color: Buttons.sum.color,
            onPressed: () {
              controller.secondNumber(Buttons.sum.label);
            },
          ),
        ],
      ),
    ]);
  }
}
