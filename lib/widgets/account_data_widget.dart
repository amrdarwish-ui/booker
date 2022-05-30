import 'package:booker/consts.dart';
import 'package:booker/model/user_model.dart';
import 'package:booker/view/account_view/edit_account_view.dart';
import 'package:booker/view_model/account_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountDataWidget extends StatelessWidget {
  const AccountDataWidget({Key? key, required this.userModel})
      : super(key: key);
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
      child: SizedBox(
        height: Get.height * 0.3,
        width: Get.width,
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width * 168 / Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userModel.name,
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Text(
                        userModel.bio,
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5), fontSize: 10),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    userModel.img == ''
                        ? Container(
                            width: Get.width * 84 / Get.width,
                            height: Get.width * 84 / Get.width,
                            child: const Center(
                              child: Icon(
                                Icons.person,
                                size: 45,
                                color: primaryColor,
                              ),
                            ),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 1),
                                    blurRadius: 10)
                              ],
                            ),
                          )
                        : Container(
                            width: Get.width * 84 / Get.width,
                            height: Get.width * 84 / Get.width,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(userModel.img),
                                  fit: BoxFit.cover),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 1),
                                    blurRadius: 10)
                              ],
                            ),
                          ),
                    SizedBox(
                      height: Get.height * 0.015,
                    ),
                    InkWell(
                      onTap: () {
                        Get.bottomSheet(EditProfileView());
                      },
                      child: Container(
                        child: const Center(
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        ),
                        height: Get.height * 29.5 / Get.height,
                        width: Get.width * 100 / Get.width,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0, 1),
                                  blurRadius: 10)
                            ],
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(colors: [
                              Color(0xff4FC58B),
                              Color(0xff00FF81)
                            ])),
                      ),
                    )
                  ],
                )
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      '${userModel.books.length}',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Books',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: Get.width * 0.05,
                ),
                Column(
                  children: [
                    Text(
                      '${userModel.reviews.length}',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Reviews',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
