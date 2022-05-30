import 'package:auto_size_text/auto_size_text.dart';
import 'package:booker/consts.dart';
import 'package:booker/dialogs.dart';
import 'package:booker/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpView extends GetWidget<AuthViewModel> {
  SignUpView({Key? key}) : super(key: key);
  // ignore: annotate_overrides
  final controller = Get.put(AuthViewModel());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
        builder: (cont) => Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 20,
                      color: primaryColor,
                    )),
              ),
              body: Padding(
                padding: EdgeInsets.only(
                    top: Get.height * 0.03, left: 20, right: 20),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            AutoSizeText(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        TextFormField(
                          controller: cont.nameController,
                          keyboardType: TextInputType.name,
                          validator: (val) {
                            if (val == null || val == '') {
                              return 'Please enter Name';
                            }

                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'First & Last Name',
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.025,
                        ),
                        TextFormField(
                          controller: cont.emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if (val == null || val == '') {
                              return 'Please enter Email';
                            } else if (!cont.isEmail(val)) {
                              return 'Invalid Email';
                            }

                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Email Adderss',
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.025,
                        ),
                        TextFormField(
                          controller: cont.phoneController,
                          keyboardType: TextInputType.phone,
                          validator: (val) {
                            if (val == null || val == '') {
                              return 'Please enter Phone';
                            } else if (val.length < 10) {
                              return 'Invalid Phone';
                            }

                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Mobile Phone',
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.025,
                        ),
                        TextFormField(
                          controller: cont.passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          validator: (val) {
                            if (val == null || val == '') {
                              return 'Please enter Password';
                            } else if (val.length < 8) {
                              return 'Short Password';
                            }

                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Password',
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.025,
                        ),
                        InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              cont.signUp();
                            }
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            width: double.infinity,
                            height: Get.height * 56 / Get.height,
                            alignment: Alignment.center,
                            child: const Text(
                              'Sign Up',
                              style:
                                  TextStyle(color: primaryColor, fontSize: 15),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: primaryColor),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
