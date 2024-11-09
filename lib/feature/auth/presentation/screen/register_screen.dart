import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ety/core/enums/user_type.dart';
import 'package:se7ety/core/functions/dialog.dart';
import 'package:se7ety/core/functions/navigation.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/core/widgets/custom_button.dart';
import 'package:se7ety/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:se7ety/feature/auth/presentation/screen/doctor_register_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.userType});
  final UserType userType;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController displayName = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isVisible = true;
  String handleUserType() {
    return widget.userType == UserType.doctor ? 'دكتور' : 'مريض';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            if (widget.userType == UserType.doctor) {
              pushAndRemoveUntil(context, const DoctorRegisterScreen());
            } else {}
          } else if (state is AuthErrorState) {
            Navigator.pop(context);
            showErrorDialog(context, state.error);
          } else if (state is RegisterLoadingState) {
            showLoadingDialog(context);
          }
        },
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                  left: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: 200,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'سجل حساب جديد ك "${handleUserType()}"',
                      style: getTitleStyle(),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: displayName,
                      style: TextStyle(color: AppColors.black),
                      decoration: InputDecoration(
                        hintText: 'الاسم',
                        hintStyle: getBodyStyle(color: Colors.grey),
                        prefixIcon: const Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) return 'من فضلك ادخل الاسم';
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      textAlign: TextAlign.end,
                      style: TextStyle(color: AppColors.black),
                      decoration: InputDecoration(
                        hintText: 'Abdullah@example.com',
                        hintStyle: getBodyStyle(color: Colors.grey),
                        prefixIcon: const Icon(Icons.email_rounded),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'من فضلك ادخل الايميل';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      textAlign: TextAlign.end,
                      controller: passwordController,
                      style: TextStyle(color: AppColors.black),
                      decoration: InputDecoration(
                        hintText: '********',
                        hintStyle: getBodyStyle(color: Colors.grey),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: Icon(
                            (isVisible)
                                ? Icons.remove_red_eye
                                : Icons.visibility_off_rounded,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) return 'من فضلك ادخل كلمة السر';
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                        text: 'تسجيل حساب',
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(RegisterEvent(
                                name: displayName.text,
                                email: emailController.text,
                                password: passwordController.text,
                                userType: widget.userType));
                          }
                        }),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        children: [
                          Text(
                            'لدي حساب ؟',
                            style: getBodyStyle(color: Colors.black),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'سجل دخول',
                                style: getBodyStyle(color: AppColors.color1),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
