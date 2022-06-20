import 'package:dropdown_search/dropdown_search.dart';
import 'package:fehu_app/app/core/utils/extensions.dart';
import 'package:fehu_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:fehu_app/app/widgets/global_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/custom_auth_textfield.dart';
import '../../../widgets/custom_search_dropdown.dart';

class SignupView extends GetView<AuthController> {
  const SignupView({Key? key}) : super(key: key);

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
                      child: 'Register'.h2,
                    ),
                    const SizedBox(height: 6),
                    SizedBox(
                      width: Get.width,
                      child: 'Sign up now to see FEHU data'.caption,
                    ),
                    const SizedBox(height: 15),
                    CustomAuthTextField(
                      hintText: 'Full Name',
                      inputType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      prefixIcon: Icons.person_outlined,
                      onSaved: (String? value) =>
                          controller.fullName.value = value!,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Full name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
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
                      hintText: 'Email Address',
                      inputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      prefixIcon: Icons.email_outlined,
                      onSaved: (String? value) =>
                          controller.email.value = value!,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email address';
                        } else if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                        ).hasMatch(value)) {
                          return 'Please enter a valid email address';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    CustomAuthTextField(
                      hintText: 'Phone Number',
                      inputType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      prefixIcon: Icons.phone_outlined,
                      onSaved: (String? value) =>
                          controller.phone.value = value!,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone number';
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
                      obsecure: controller.signupObsecure.value,
                      suffixIcon: Icons.remove_red_eye_outlined,
                      onSaved: (String? value) =>
                          controller.password.value = value!,
                      onSuffixTap: () => controller.signupObsecure.value =
                          !controller.signupObsecure.value,
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
                    const SizedBox(height: 8),
                    CustomAuthTextField(
                      hintText: 'Section Number',
                      inputType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      prefixIcon: Icons.pattern_rounded,
                      onSaved: (String? value) =>
                          controller.section.value = value!,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your section number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    CustomSearchDropdown(
                      dropdownMode: Mode.DIALOG,
                      hint: 'Academic year'.tr,
                      data: const ['Preparatory', '1st', '2nd', '3rd', '4th'],
                      validator: 'select your academic year',
                      onChanged: (val) {
                        controller.academicYear.value = val!;
                      },
                    ),
                    const SizedBox(height: 8),
                    (controller.isDepartmentsLoading.value)
                        ? const Center(child: CircularProgressIndicator())
                        : (controller.departments.isEmpty)
                            ? const SizedBox()
                            : CustomSearchDropdown(
                                dropdownMode: Mode.MENU,
                                hint: 'select Department'.tr,
                                data: controller.departments
                                    .map((e) => e.title!)
                                    .toList(),
                                validator: 'select your department',
                                onChanged: (val) {
                                  int id = controller.departments
                                      .where((e) => e.title == val)
                                      .first
                                      .id!;
                                  controller.departmentId.value = id;
                                },
                              ),
                    const SizedBox(height: 8),
                    (controller.isBatchesLoading.value)
                        ? const Center(child: CircularProgressIndicator())
                        : (controller.batches.isEmpty)
                            ? const SizedBox()
                            : CustomSearchDropdown(
                                dropdownMode: Mode.MENU,
                                hint: 'select Batch Number'.tr,
                                data: controller.batches
                                    .map((e) => e.number!.toString())
                                    .toList(),
                                validator: 'select your Batch Number',
                                onChanged: (val) {
                                  int id = controller.batches
                                      .where((e) => e.number.toString() == val)
                                      .first
                                      .id!;
                                  controller.batchId.value = id;
                                },
                              ),
                    const SizedBox(height: 20),
                    GlobalButton(
                      text: 'Sign up',
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.formKey.currentState!.save();
                          controller.register();
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: Get.textTheme.bodyText1!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () => Get.offNamed(Routes.login),
                            child: Text(
                              'Sign in',
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
