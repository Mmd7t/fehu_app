import 'package:fehu_app/app/core/utils/extensions.dart';
import 'package:fehu_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:fehu_app/app/widgets/global_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/custom_auth_textfield.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Center(
                        child: Image.asset(
                          'assets/images/logo.jpeg',
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: Get.width,
                      child: 'Login'.h2,
                    ),
                    const SizedBox(height: 6),
                    SizedBox(
                      width: Get.width,
                      child: 'Welcome again'.caption,
                    ),
                    const SizedBox(height: 15),
                    CustomAuthTextField(
                      hintText: 'username',
                      inputType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      prefixIcon: Icons.person_outlined,
                      onSaved: (String? value) =>
                          controller.username.value = value!,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    CustomAuthTextField(
                      hintText: 'Password',
                      inputType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      prefixIcon: Icons.lock_outline,
                      obsecure: controller.loginObsecure.value,
                      suffixIcon: Icons.remove_red_eye_outlined,
                      onSaved: (String? value) =>
                          controller.password.value = value!,
                      onSuffixTap: () => controller.loginObsecure.value =
                          !controller.loginObsecure.value,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 digits';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 50),
                    GlobalButton(
                      text: 'Login',
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.formKey.currentState!.save();
                          controller.login();
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account? ',
                          style: Get.textTheme.bodyText1!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () => Get.offNamed(Routes.signup),
                            child: Text(
                              'Sign up',
                              style: Get.textTheme.bodyText1!.copyWith(
                                color: Get.theme.colorScheme.secondary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
