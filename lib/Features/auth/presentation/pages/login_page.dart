import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_monkey/Features/auth/presentation/blocs/bloc/auth_bloc.dart';
import 'package:meal_monkey/core/text_form_fields/custom_text_form_field.dart';
import 'package:meal_monkey/core/validator/my_validators.dart';
import 'package:meal_monkey/injection_injectable_package.dart';

import '../../../../core/buttons/filled_button_widget.dart';
import '../../../../core/routes/app_route_const.dart';
import '../../../../core/util/snackbar_message.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../domain/entities/user_entity.dart';
import '../widgets/login/facbook_button_widget.dart';
import '../widgets/login/forgot_password_widget.dart';
import '../widgets/login/google_button_widget.dart';
import '../widgets/login/no_accout_sign_up_widget.dart';
import '../widgets/login/or_login_with_widget.dart';
import '../widgets/login/subtitle_login_widget.dart';
import '../widgets/login/title_login_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey();

  final AuthBloc authBloc = getIt<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 55.h),
              const TitleLoginWidget(),
              SizedBox(height: 10.h),
              const SubtitleLoginWidget(),
              SizedBox(height: 30.h),
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
                      MyAppRouteConst.homePage,
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
                  buttonText: "Login",
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      authBloc.add(
                        LogInEvent(
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
              SizedBox(height: 10.h),
              const ForgotPasswordWidget(),
              SizedBox(height: 50.h),
              const OrLoginWithWidget(),
              SizedBox(height: 10.h),
              const FacbookButtonWidget(),
              SizedBox(height: 15.h),
              const GoogleButtonWidget(),
              SizedBox(height: 15.h),
              const NoAccoutSignUpWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
