part of 'empty_cubit.dart';

abstract class emptyState extends Equatable {}

class InitialState extends emptyState {
  @override
  List<Object> get props => [];
}

class emptySuccess extends emptyState {
  final dynamic data;
  emptySuccess(this.data);

  @override
  List<Object> get props => [data];
}

class emptyFailed extends emptyState {
  final dynamic message;
  emptyFailed(this.message);

  @override
  List<Object> get props => [message];
}
