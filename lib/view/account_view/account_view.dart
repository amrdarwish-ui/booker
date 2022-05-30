import 'package:booker/consts.dart';
import 'package:booker/dialogs.dart';
import 'package:booker/model/revew_model.dart';
import 'package:booker/model/user_model.dart';
import 'package:booker/view_model/account_view_model.dart';
import 'package:booker/widgets/account_data_widget.dart';
import 'package:booker/widgets/account_purchases_list.dart';
import 'package:booker/widgets/account_reviews.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountView extends GetWidget<AccountViewModel> {
  AccountView({Key? key}) : super(key: key);
  @override
  final controller = Get.put(AccountViewModel());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountViewModel>(
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
              body: cont.userModel == null
                  ? Center(child: Image.asset('assets/gif/loding.gif'))
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Container();
                        }
                        if (index == 1) {
                          return AccountPurchasesList(
                            bookList: cont.books,
                            reveiwsLength: cont.userModel!.reviews.length,
                          );
                        }
                        return InkWell(
                          onTap: () {
                            showSureDialog(() {
                              cont.deleteReview(ReviewModel.fromMap(
                                  cont.userModel!.reviews[index - 2]));
                            }, 'delete review');
                          },
                          child: AccountReviews(
                            reviewModel: ReviewModel.fromMap(
                                cont.userModel!.reviews[index - 2]),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        if (index == 0) {
                          return AccountDataWidget(userModel: cont.userModel!);
                        }
                        if (index == 1) {}
                        return Container();
                      },
                      itemCount: cont.userModel!.reviews.length + 2),
            ));
  }
}
