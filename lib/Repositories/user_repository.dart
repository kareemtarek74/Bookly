// ignore_for_file: non_constant_identifier_names

import 'package:bookly/Features/Home/Data/models/get_user_data/get_user_data.dart';
import 'package:bookly/Features/Home/Data/models/sign_in_model.dart';
import 'package:bookly/Features/Home/Data/models/sign_up.dart';
import 'package:bookly/core/Api/Api_consumer.dart';
import 'package:bookly/core/Api/end_points.dart';
import 'package:bookly/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';

import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../core/Functions/upload_image_to_Api.dart';
import '../core/cache/cache_helper.dart';

class UserRepository {
  final ApiConsumer Api;

  UserRepository({required this.Api});

  Future<Either<String, SignInModel>> signIn(
      {required String email, required String password}) async {
    try {
      final response = await Api.post(Endpoints.signIn,
          data: {ApiKey.email: email, ApiKey.password: password});
      SignInModel user = SignInModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user.token!);
      CacheHelper().saveData(key: ApiKey.token, value: user.token);
      CacheHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
      return Right(user);
    } on ServerException catch (e) {
      return left(e.authErrorModel.errorMessage);
    }
  }

  Future<Either<String, SignUpModel>> signUp(
      {required String name,
      required String phone,
      required String email,
      required String password,
      required String confirmPassword,
      required XFile profilePic}) async {
    try {
      final response =
          await Api.post(Endpoints.signUp, isFormData: true, data: {
        ApiKey.name: name,
        ApiKey.phone: phone,
        ApiKey.email: email,
        ApiKey.password: password,
        ApiKey.confirmPassword: confirmPassword,
        ApiKey.location:
            '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
        ApiKey.profilePic: await uploadImageToApi(profilePic),
      });
      SignUpModel signUpModel = SignUpModel.fromJson(response);
      return Right(signUpModel);
    } on ServerException catch (e) {
      return Left(e.authErrorModel.errorMessage);
    }
  }

  Future<Either<String, GetUserData>> getUserData() async {
    try {
      final response = await Api.get(
        Endpoints.getUserEndPoint(
          CacheHelper().getData(key: ApiKey.id),
        ),
      );
      final GetUserData user = GetUserData.fromJson(response);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.authErrorModel.errorMessage);
    }
  }
}
