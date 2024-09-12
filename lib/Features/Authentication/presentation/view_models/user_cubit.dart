import 'package:bookly/Features/Authentication/presentation/view_models/user_state.dart';
import 'package:bookly/Repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:image_picker/image_picker.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepository) : super(UserInitial());
  // ignore: non_constant_identifier_names
  final UserRepository userRepository;

  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  //Profile Pic
  XFile? profilePic;
  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();

  signIn() async {
    emit(SignInLoadingState());
    final response = await userRepository.signIn(
        email: signInEmail.text, password: signInPassword.text);
    return response.fold(
      (errmessage) => emit(SignInFailureState(errMessage: errmessage)),
      (signInModel) => emit(SignInSuccessState()),
    );
  }

  uploadProfilePic(XFile image) async {
    profilePic = image;
    emit(UserPicSuccessState());
  }

  signUp() async {
    emit(SignUpLoadingState());
    final response = await userRepository.signUp(
        name: signUpName.text,
        phone: signUpPhoneNumber.text,
        email: signUpEmail.text,
        password: signInPassword.text,
        confirmPassword: confirmPassword.text,
        profilePic: profilePic!);
    response.fold(
      (errmessage) => emit(SignUpFailureState(errMessage: errmessage)),
      (signUpModel) => emit(SignUpSuccessState(message: signUpModel.message!)),
    );
  }

  getUserData() async {
    emit(GetUserLoadingState());
    final response = await userRepository.getUserData();
    response.fold(
      (errMessage) => emit(GetUserFailureState(errMessage: errMessage)),
      (getUserData) => emit(GetUserSuccessState(user: getUserData)),
    );
  }
}
