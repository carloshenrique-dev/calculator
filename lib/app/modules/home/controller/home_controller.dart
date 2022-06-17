import 'dart:developer';
import 'dart:math' as math;
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  HomeController() : super(HomeState.initial());

  void firstNumber(String value) {
    try {
      if (state.result.length == 1 && state.result == '0') {
        emit(state.copyWith(result: ''));
      }
      if (state.result.length < 10) {
        emit(state.copyWith(result: state.result + value));
      }
    } catch (e, s) {
      log('error to update your number, try again', error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  void secondNumber(String operation) {
    try {
      emit(state.copyWith(
          num1: state.result, operation: operation, result: '0'));
    } catch (e, s) {
      log('error to update your number, try again', error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  //function to realize basic calculation +,-, *, /, X^y
  void calculate() {
    try {
      var num1 = double.parse(state.num1);
      var num2 = double.parse(state.result);
      switch (state.operation) {
        case '+':
          emit(state.copyWith(result: (num1 + num2).toString()));
          state.history.add('$num1 ${state.operation} $num2 = ${state.result}');
          break;
        case '-':
          emit(state.copyWith(result: (num1 - num2).toString()));
          state.history.add('$num1 ${state.operation} $num2 = ${state.result}');
          int.parse('*');
          break;
        case 'x':
          emit(state.copyWith(result: (num1 * num2).toString()));
          state.history.add('$num1 ${state.operation} $num2 = ${state.result}');
          break;
        case '÷':
          emit(state.copyWith(result: (num1 / num2).toString()));
          state.history.add('$num1 ${state.operation} $num2 = ${state.result}');
          break;
        case 'X^y':
          emit(state.copyWith(result: math.pow(num1, num2).toString()));
          state.history.add('$num1 ${state.operation} $num2 = ${state.result}');
          break;
        default:
          break;
      }
    } catch (e, s) {
      log('error when we trying to calculate, try again',
          error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  //function to calc percentage
  void percentage() {
    try {
      emit(state.copyWith(num1: state.result));
      emit(state.copyWith(
          operation: '%',
          result: (double.parse(state.result) / 100).toString()));
      state.history.add('${state.operation} ${state.num1} = ${state.result}');
      emit(state.copyWith(history: state.history));
    } catch (e, s) {
      log('error when we trying to calculate the porcentage, try again',
          error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  //function to calc degrees (conversion from rad to degrees)
  void rad() {
    try {
      emit(state.copyWith(num1: state.result));
      emit(state.copyWith(
          operation: 'Rad',
          result: ((double.parse(state.result) * 180) / math.pi).toString()));
      state.history.add('${state.operation} ${state.num1} = ${state.result}');
      emit(state.copyWith(history: state.history));
    } catch (e, s) {
      log('error when we trying to calculate the rad, try again',
          error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  //function to calc degrees (conversion from degrees to rad)
  void deg() {
    try {
      emit(state.copyWith(num1: state.result));
      emit(state.copyWith(
          operation: 'Rad',
          result: ((double.parse(state.result) * math.pi) / 180).toString()));
      state.history.add('${state.operation} ${state.num1} = ${state.result}');
      emit(state.copyWith(history: state.history));
    } catch (e, s) {
      log('error when we trying to calculate the rad, try again',
          error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  //function to calc square root
  void squareRoot() {
    try {
      emit(state.copyWith(num1: state.result));
      emit(state.copyWith(
          operation: '√',
          result: (math.sqrt(double.parse(state.result)).toString())));
      state.history.add('${state.operation} ${state.num1} = ${state.result}');
      emit(state.copyWith(history: state.history));
    } catch (e, s) {
      log('error when we trying to calculate the square root, try again',
          error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  //function to calc ln
  void logCalc() {
    try {
      emit(state.copyWith(num1: state.result));
      emit(state.copyWith(
          operation: 'ln',
          result: ((math.log10e - math.log2e) / double.parse(state.result))
              .toString()));
      state.history.add('${state.operation} ${state.num1} = ${state.result}');
      emit(state.copyWith(history: state.history));
    } catch (e, s) {
      log('error when we trying to calculate the ln, try again',
          error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  //function to calc factorial
  void factorialCalc() {
    try {
      int factorial = 1;
      for (var i = 1; i <= double.parse(state.result); i++) {
        factorial = factorial * i;
      }
      emit(state.copyWith(num1: state.result));
      emit(state.copyWith(operation: 'x!', result: factorial.toString()));
      state.history.add('${state.operation} ${state.num1} = ${state.result}');
      emit(state.copyWith(history: state.history));
    } catch (e, s) {
      log('error when we trying to calculate the factorial, try again',
          error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  //function to calc log
  void ln() {
    try {
      emit(state.copyWith(num1: state.result));
      emit(state.copyWith(
          operation: 'log',
          result: (math.log(double.parse(state.result)).toString())));
      state.history.add('${state.operation} ${state.num1} = ${state.result}');
      emit(state.copyWith(history: state.history));
    } catch (e, s) {
      log('error when we trying to calculate the log, try again',
          error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  //function to calc cos
  void cos() {
    try {
      emit(state.copyWith(num1: state.result));
      emit(state.copyWith(
          operation: 'cos',
          result: (math.cos(double.parse(state.result)).toString())));
      state.history.add('${state.operation} ${state.num1} = ${state.result}');
      emit(state.copyWith(history: state.history));
    } catch (e, s) {
      log('error when we trying to calculate the cos, try again',
          error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  //function to calc exp
  void exp() {
    try {
      emit(state.copyWith(num1: state.result));
      emit(state.copyWith(
          operation: 'exp',
          result: (math.exp(double.parse(state.result)).toString())));
      state.history.add('${state.operation} ${state.num1} = ${state.result}');
      emit(state.copyWith(history: state.history));
    } catch (e, s) {
      log('error when we trying to calculate the exp, try again',
          error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  //function to calc sin
  void sin() {
    try {
      emit(state.copyWith(num1: state.result));
      emit(state.copyWith(
          operation: 'sin',
          result: (math.sin(double.parse(state.result)).toString())));
      state.history.add('${state.operation} ${state.num1} = ${state.result}');
      emit(state.copyWith(history: state.history));
    } catch (e, s) {
      log('error when we trying to calculate the sin, try again',
          error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  //function to calc tan
  void tan() {
    try {
      emit(state.copyWith(num1: state.result));
      emit(state.copyWith(
          operation: 'tan',
          result: (math.tan(double.parse(state.result)).toString())));
      state.history.add('${state.operation} ${state.num1} = ${state.result}');
      emit(state.copyWith(history: state.history));
    } catch (e, s) {
      log('error when we trying to calculate the tan, try again',
          error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  //function to calc e
  void e() {
    try {
      emit(state.copyWith(num1: state.result));
      emit(state.copyWith(
          operation: 'e',
          result: ((math.e * double.parse(state.result)).toString())));
      state.history.add('${state.operation} ${state.num1} = ${state.result}');
      emit(state.copyWith(history: state.history));
    } catch (e, s) {
      log('error when we trying to calculate the e, try again',
          error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  //function to calc pi
  void pi() {
    try {
      emit(state.copyWith(num1: state.result));
      emit(state.copyWith(
          operation: 'π',
          result: (math.pi * double.parse(state.result)).toString()));
      state.history.add('${state.operation} ${state.num1} = ${state.result}');
      emit(state.copyWith(history: state.history));
    } catch (e, s) {
      log('error when we trying to calculate the π, try again',
          error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  void clear() {
    try {
      emit(state.copyWith(result: '0', status: HomeStatus.initial));
    } catch (e, s) {
      log('error to clean, try again', error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  //function to add . into a numbers
  void dot() {
    try {
      if (!state.result.contains('.')) {
        emit(state.copyWith(result: '${state.result}.'));
      }
    } catch (e, s) {
      log('error to add . in your number', error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }
}
