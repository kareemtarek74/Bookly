import 'package:bookly/Features/Authentication/presentation/view/widgets/custom_form_button.dart';
import 'package:bookly/Features/Authentication/presentation/view/widgets/custom_input_field.dart';
import 'package:bookly/Features/Authentication/presentation/view/widgets/dont_have_an_account.dart';
import 'package:bookly/Features/Authentication/presentation/view/widgets/forget_password_widget.dart';
import 'package:bookly/Features/Authentication/presentation/view/widgets/page_header.dart';
import 'package:bookly/Features/Authentication/presentation/view/widgets/page_heading.dart';
import 'package:bookly/Features/Authentication/presentation/view_models/user_cubit.dart';
import 'package:bookly/Features/Authentication/presentation/view_models/user_state.dart';
import 'package:bookly/Features/Home/presentation/presentation/views/home_view.dart';
import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const PageHeader(),
            Expanded(
              child: BlocConsumer<UserCubit, UserState>(
                listener: (context, state) {
                  if (state is SignInSuccessState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Success'),
                      ),
                    );
                    BlocProvider.of<UserCubit>(context).getUserData();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const homeView(),
                        ));
                  } else if (state is SignInFailureState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.errMessage),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        key: context.read<UserCubit>().signInFormKey,
                        child: Column(
                          children: [
                            const PageHeading(title: 'Sign-in'),
                            //!Email
                            CustomInputField(
                              labelText: 'Email',
                              hintText: 'Your email',
                              controller: context.read<UserCubit>().signInEmail,
                            ),
                            const SizedBox(height: 16),
                            //!Password
                            CustomInputField(
                              labelText: 'Password',
                              hintText: 'Your password',
                              obscureText: true,
                              suffixIcon: true,
                              controller:
                                  context.read<UserCubit>().signInPassword,
                            ),
                            const SizedBox(height: 16),
                            //! Forget password?
                            ForgetPasswordWidget(size: size),
                            const SizedBox(height: 20),
                            //!Sign In Button
                            state is SignInLoadingState
                                ? const CircularProgressIndicator()
                                : CustomFormButton(
                                    innerText: 'Sign In',
                                    onPressed: () {
                                      BlocProvider.of<UserCubit>(context)
                                          .signIn();
                                    },
                                  ),
                            const SizedBox(height: 18),
                            //! Dont Have An Account ?
                            DontHaveAnAccountWidget(size: size),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
