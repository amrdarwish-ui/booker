import 'package:booker/consts.dart';
import 'package:booker/view_model/account_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class EditProfileView extends GetWidget<AccountViewModel> {
  EditProfileView({
    Key? key,
  }) : super(key: key) {
    nameCont.text = controller.userModel!.name;
    bioCont.text = controller.userModel!.bio;
  }
  // ignore: annotate_overrides
  final controller = Get.put(AccountViewModel());
  final nameCont = TextEditingController();
  final bioCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountViewModel>(
      builder: (controller) => Container(
        height: Get.height * 0.6,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: Get.width * 200 / Get.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: nameCont,
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            TextFormField(
                              controller: bioCont,
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.pickImage();
                        },
                        child: controller.image != null
                            ? Container(
                                width: Get.width * 84 / Get.width,
                                height: Get.width * 84 / Get.width,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: FileImage(controller.image!),
                                      fit: BoxFit.cover),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0, 1),
                                        blurRadius: 10)
                                  ],
                                ),
                              )
                            : Column(children: [
                                controller.userModel!.img == ''
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
                                              image: NetworkImage(
                                                  controller.userModel!.img),
                                              fit: BoxFit.cover),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.grey,
                                                offset: Offset(0, 1),
                                                blurRadius: 10)
                                          ],
                                        ),
                                      ),
                              ]),
                      )
                    ]),
                Row(
                  children: [
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        controller.saveEdit(nameCont.text, bioCont.text);
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      ),
    );
  }
}
