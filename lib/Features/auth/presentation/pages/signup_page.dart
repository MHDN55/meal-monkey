import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_monkey/Features/auth/presentation/blocs/bloc/auth_bloc.dart';
import 'package:meal_monkey/injection_injectable_package.dart';

import '../../../../core/buttons/filled_button_widget.dart';
import '../../../../core/routes/app_route_const.dart';
import '../../../../core/text_form_fields/custom_text_form_field.dart';
import '../../../../core/util/snackbar_message.dart';
import '../../../../core/validator/my_validators.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../domain/entities/user_entity.dart';
import '../widgets/signup/have_an_account_widget.dart';
import '../widgets/signup/subtitle_signup_widget.dart';
import '../widgets/signup/title_signup_widget.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPassController = TextEditingController();

  final AuthBloc authBloc = getIt<AuthBloc>();

  final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 55.h),
              const TitleSignupWidget(),
              SizedBox(height: 10.h),
              const SubtitleSignupWidget(),
              SizedBox(height: 30.h),
              CustomTextFormFieldWidget(
                validator: MyValidators().nameValidator,
                keyboardType: TextInputType.name,
                isPassword: false,
                fieldHint: "Name",
                controller: _nameController,
              ),
              SizedBox(height: 15.h),
              CustomTextFormFieldWidget(
                validator: MyValidators().emailValidator,
                keyboardType: TextInputType.emailAddress,
                isPassword: false,
                fieldHint: "Your Email",
                controller: _emailController,
              ),
              SizedBox(height: 15.h),
              CustomTextFormFieldWidget(
                validator: MyValidators().passwordValidator,
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                fieldHint: "Password",
                controller: _passwordController,
              ),
              SizedBox(height: 15.h),
              CustomTextFormFieldWidget(
                validator: confirmPasValidator,
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                fieldHint: "Confirm Password",
                controller: _confirmPassController,
              ),
              SizedBox(height: 40.h),
              BlocListener<AuthBloc, AuthState>(
                bloc: authBloc,
                listener: (context, state) async {
                  if (state.status == AuthStatus.loading) {
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return const LoadingWidget();
                      },
                    );
                  }
                  if (state.status == AuthStatus.loaded) {
                    (context).pushReplacementNamed(
                      MyAppRouteConst.loginPage,
                    );
                  }
                  if (state.status == AuthStatus.failure) {
                    (context).pop();

                    SnackBarMessage().showErrorSnackBar(
                      message: state.message,
                      context: context,
                    );
                  }
                },
                child: FilledButtonWidget(
                  buttonText: "Sign Up",
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      authBloc.add(
                        SignUpEvent(
                          user: UserEntity(
                            email: _emailController.text,
                            password: _passwordController.text,
                            name: _nameController.text,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: 15.h),
              const HaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }

  String? confirmPasValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please re-enter password';
    }
    if (_passwordController.text != _confirmPassController.text) {
      return "Password does not match";
    }
    return null;
  }
}
