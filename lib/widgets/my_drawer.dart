import 'package:booker/consts.dart';
import 'package:booker/view/about_us_view/about_us_view.dart';
import 'package:booker/view/account_view/account_view.dart';
import 'package:booker/view/intro_view/intro_view.dart';
import 'package:booker/widgets/drawer_devider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        // give it your desired border radius
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(250),
        ),
        // wrap with a sizedbox for a custom width [for more flexibility]
        child: SizedBox(
          width: Get.width * 0.75,
          height: Get.height,
          child: Drawer(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.2,
                  child: Center(
                    child: Container(
                      height: Get.height * 0.1,
                      width: Get.height * 0.1,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('assets/png/logo.png'),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                Container(
                  color: primaryColor,
                  child: ListTile(
                    title: const Text(
                      'Home',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Get.back();
                    },
                  ),
                ),
                // const DrawerDivider(),
                ListTile(
                  title: const Text(
                    'Account',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Get.to(
                      () => AccountView(),
                      transition: Transition.rightToLeft,
                    );
                  },
                ),
                // const DrawerDivider(),
                ListTile(
                  title: const Text(
                    'About us',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Get.to(() => const AboutUsView(),
                        transition: Transition.rightToLeft);
                  },
                ),
                // const DrawerDivider(),
                ListTile(
                  title: const Text(
                    'Log out',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Get.offAll(() => const IntroView(),
                        transition: Transition.downToUp);
                  },
                ),
                // const DrawerDivider(),
              ],
            ),
          ),
        ));
  }
}
