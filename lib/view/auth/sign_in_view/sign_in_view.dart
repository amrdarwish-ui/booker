import 'package:auto_size_text/auto_size_text.dart';
import 'package:booker/consts.dart';
import 'package:booker/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInView extends GetWidget<AuthViewModel> {
  SignInView({Key? key}) : super(key: key);

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
                              "Sign In",
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
                          controller: cont.emailController,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            cont.buttonValidate();
                          },
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
                          controller: cont.passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          onChanged: (value) {
                            cont.buttonValidate();
                          },
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Transform.scale(
                                scale: 1.3,
                                child: Checkbox(
                                  value: cont.stayLoggedin,
                                  onChanged: (value) {
                                    cont.changeCheckBox(value);
                                  },
                                  activeColor: primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ),
                              const Text(
                                'Stay Logged In',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {},
                                child: const Text(
                                  'Forgotten Password?',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              cont.sginIn();
                            }
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            width: double.infinity,
                            height: Get.height * 56 / Get.height,
                            alignment: Alignment.center,
                            child: cont.isClicked
                                ? const CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.white),
                                    strokeWidth: 2,
                                  )
                                : Text(
                                    'Sign In',
                                    style: TextStyle(
                                        color: cont.isValidated
                                            ? Colors.white
                                            : primaryColor,
                                        fontSize: 15),
                                  ),
                            decoration: BoxDecoration(
                                color: cont.isValidated
                                    ? primaryColor
                                    : Colors.white,
                                border: Border.all(color: primaryColor),
                                boxShadow: [
                                  BoxShadow(
                                      color: primaryColor,
                                      offset:
                                          Offset(0, cont.isValidated ? 5 : 0),
                                      blurRadius: cont.isValidated ? 10 : 0)
                                ],
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
