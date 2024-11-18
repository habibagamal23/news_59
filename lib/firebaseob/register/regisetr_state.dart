part of 'regisetr_cubit.dart';

@immutable
sealed class RegisetrState {}

final class RegisetrInitial extends RegisetrState {}

class RegisterLoading extends RegisetrState {}

class RegisterSuccess extends RegisetrState {
  final User user;

  RegisterSuccess(this.user);
}

class RegisterFailure extends RegisetrState {
  final String error;

  RegisterFailure(this.error);
}

class RegisterPasswordVisibilityToggled extends RegisetrState {
  final bool isVisible;

  RegisterPasswordVisibilityToggled(this.isVisible);
}
