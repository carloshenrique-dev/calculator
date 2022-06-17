part of 'home_controller.dart';

enum HomeStatus {
  initial,
  calculated,
  failure;
}

class HomeState extends Equatable {
  final HomeStatus status;
  final String operation;
  final String num1;
  final String result;
  final List<String> history;
  const HomeState._({
    required this.status,
    required this.num1,
    required this.result,
    required this.operation,
    required this.history,
  });

  @override
  List<Object?> get props => [operation, num1, result, status, history];

  HomeState.initial()
      : this._(
          num1: '0',
          result: '0',
          operation: '',
          history: [''],
          status: HomeStatus.initial,
        );

  HomeState copyWith({
    HomeStatus? status,
    String? operation,
    String? result,
    String? num1,
    List<String>? history,
  }) {
    return HomeState._(
      status: status ?? this.status,
      num1: num1 ?? this.num1,
      result: result ?? this.result,
      history: history ?? this.history,
      operation: operation ?? this.operation,
    );
  }
}
