import 'package:bookly/Features/Home/Data/models/get_user_data/get_user_data.dart';

class UserState {}

final class UserInitial extends UserState {}

final class SignInLoadingState extends UserState {}

final class SignInSuccessState extends UserState {}

final class UserPicSuccessState extends UserState {}

final class SignInFailureState extends UserState {
  final String errMessage;

  SignInFailureState({required this.errMessage});
}

final class SignUpLoadingState extends UserState {}

final class SignUpSuccessState extends UserState {
  final String message;

  SignUpSuccessState({required this.message});
}

final class SignUpFailureState extends UserState {
  final String errMessage;

  SignUpFailureState({required this.errMessage});
}

final class GetUserLoadingState extends UserState {}

final class GetUserSuccessState extends UserState {
  final GetUserData user;

  GetUserSuccessState({required this.user});
}

final class GetUserFailureState extends UserState {
  final String errMessage;

  GetUserFailureState({required this.errMessage});
}
