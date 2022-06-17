import 'package:calculator/app/core/ui/themes/app_colors.dart';
import 'package:flutter/material.dart';

enum Buttons {
  sum(label: '+', color: AppColors.grey),
  subtraction(label: '-', color: AppColors.grey),
  multiplication(label: 'x', color: AppColors.grey),
  division(label: '÷', color: AppColors.grey),
  clear(label: 'AC', color: AppColors.grey),
  parenthesisLeft(label: '(', color: AppColors.grey),
  parenthesisRight(label: ')', color: AppColors.grey),
  percentage(label: '%', color: AppColors.grey),
  exp(label: 'EXP', color: AppColors.grey),
  ans(label: 'Ans', color: AppColors.grey),
  elevation(label: 'X^y', color: AppColors.grey),
  squareRoot(label: '√', color: AppColors.grey),
  tan(label: 'tan', color: AppColors.grey),
  e(label: 'e', color: AppColors.grey),
  log(label: 'log', color: AppColors.grey),
  cos(label: 'cos', color: AppColors.grey),
  pi(label: 'π', color: AppColors.grey),
  ln(label: 'ln', color: AppColors.grey),
  sin(label: 'sin', color: AppColors.grey),
  lnv(label: 'lnv', color: AppColors.grey),
  x(label: 'x!', color: AppColors.grey),
  deg(label: 'Deg', color: AppColors.grey),
  rad(label: 'Rad', color: AppColors.grey),
  result(label: '=', color: AppColors.blue),
  dot(label: '.', color: AppColors.lightGrey),
  one(label: '1', color: AppColors.lightGrey),
  two(label: '2', color: AppColors.lightGrey),
  three(label: '3', color: AppColors.lightGrey),
  four(label: '4', color: AppColors.lightGrey),
  five(label: '5', color: AppColors.lightGrey),
  six(label: '6', color: AppColors.lightGrey),
  seven(label: '7', color: AppColors.lightGrey),
  eight(label: '8', color: AppColors.lightGrey),
  nine(label: '9', color: AppColors.lightGrey),
  zero(label: '0', color: AppColors.lightGrey);

  final String label;
  final Color color;
  const Buttons({required this.label, required this.color});
}
