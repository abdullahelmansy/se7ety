import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/enums/user_type.dart';
import 'package:se7ety/core/functions/dialog.dart';
import 'package:se7ety/core/functions/email_vaildation.dart';
import 'package:se7ety/core/functions/navigation.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/core/widgets/custom_button.dart';
import 'package:se7ety/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:se7ety/feature/auth/presentation/bloc/auth_event.dart';
import 'package:se7ety/feature/auth/presentation/bloc/auth_state.dart';
import 'package:se7ety/feature/auth/presentation/views/doctor_details_view.dart';
import 'package:se7ety/feature/auth/presentation/views/login_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key, required this.userType});
  final UserType userType;

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isVisiable = true;
  String handleUserType() {
    return widget.userType == UserType.doctor ? 'دكتور' : 'مريض';
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          if (widget.userType == UserType.doctor) {
            pushAndRemoveUntil(context, const DoctorDetailsView());
          } else {}
          // Navigator.pop(context);
        } else if (state is AuthErrorState) {
          Navigator.pop(context);
          showErrorDialog(context, state.error);
        } else if (state is RegisterLoadingState) {
          showLoadingDialog(context);
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: 200,
                    ),
                    const Gap(20),
                    Text(
                      'سجل حساب جديد ك "${handleUserType()}"',
                      style: getTitleStyle(),
                    ),
                    const Gap(30),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      style: TextStyle(color: AppColors.black),
                      controller: name,
                      decoration: InputDecoration(
                        hintText: 'الاسم',
                        hintStyle: getbodyStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppColors.color1,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) return 'من فضلك ادخل الاسم';
                        return null;
                      },
                    ),
                    const Gap(25),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: AppColors.black),
                      controller: email,
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                        hintText: 'name@example.com',
                        hintStyle: getbodyStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.email,
                          color: AppColors.color1,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'من فضلك ادخل الايميل';
                        } else if (!emailValidate(value)) {
                          return 'من فضلك ادخل الايميل صحيح';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Gap(25),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      style: TextStyle(color: AppColors.black),
                      controller: password,
                      obscureText: isVisiable,
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                          hintText: '********',
                          hintStyle: getbodyStyle(color: Colors.grey),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: AppColors.color1,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisiable = !isVisiable;
                              });
                            },
                            icon: Icon(
                              isVisiable
                                  ? Icons.remove_red_eye
                                  : Icons.visibility_off_rounded,
                            ),
                          )),
                      validator: (value) {
                        if (value!.isEmpty) return 'من فضلك ادخل كلمة مرور';
                        return null;
                      },
                    ),
                    const Gap(25),
                    CustomButton(
                        text: 'تسجيل الدخول',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(RegisterEvent(
                                  name.text,
                                  email: email.text,
                                  password: password.text,
                                  userType: widget.userType,
                                ));
                          }
                        }),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'لدي حساب',
                            style: getbodyStyle(color: AppColors.black),
                          ),
                          TextButton(
                              onPressed: () {
                                pushReplacement(context,
                                    LoginView(userType: widget.userType));
                              },
                              child: Text(
                                'سجل دخول',
                                style: getbodyStyle(color: AppColors.color1),
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
