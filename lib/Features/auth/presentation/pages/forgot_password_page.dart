import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/buttons/filled_button_widget.dart';
import '../../../../core/text_form_fields/custom_text_form_field.dart';
import '../../../../core/validator/my_validators.dart';
import '../widgets/forgotPass/subtitle_forgot_pass_widget.dart';
import '../widgets/forgotPass/title_forgot_pass_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

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
              const TitleForgotPassWidget(),
              SizedBox(height: 10.h),
              const SubtitleForgotPassWidget(),
              SizedBox(height: 30.h),
              CustomTextFormFieldWidget(
                validator: MyValidators().emailValidator,
                keyboardType: TextInputType.emailAddress,
                isPassword: false,
                fieldHint: "Your Email",
                controller: _emailController,
              ),
              SizedBox(height: 40.h),
              FilledButtonWidget(
                buttonText: "Send",
                onPressed: () {
                  if (_key.currentState!.validate()) {
                  } else {
                    
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
