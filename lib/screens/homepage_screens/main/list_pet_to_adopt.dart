import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/news_controller.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/screens/feature_screens/no_data_found_screen.dart';
import 'package:petcare_app_management/screens/homepage_screens/main/build_homepage_news_button.dart';
import 'package:petcare_app_management/screens/homepage_screens/pet_detail/pet_detail.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Images/images.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';
import 'package:petcare_app_management/share/format/format.dart';

class ListPetToAdopt extends StatefulWidget {
  const ListPetToAdopt({super.key});

  @override
  State<ListPetToAdopt> createState() => _ListPetToAdoptState();
}

class _ListPetToAdoptState extends State<ListPetToAdopt> {
  final UserController userController = Get.find();
  final NewsController newsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() => newsController.listNews.isEmpty
        ? const NoDataFoundScreen()
        : Column(
            children: newsController.listNews
                .map((news) => Column(
                      children: [
                        GestureDetector(
                          onTap: () => Get.to(() => PetDetail(
                                newsModel: news,
                              )),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(Dimens.circular10),
                                  child: Image.network(
                                    news.newsURL == ""
                                        ? 'https://th.bing.com/th/id/R.8359b42bbcae99fc2473fb9bdb6e1ae0?rik=FdiaSrRDfG9mAQ&pid=ImgRaw&r=0'
                                        : news.newsURL!,
                                    width: Get.width,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  )),
                              Dimens.height10,
                              AppText(
                                content: formatStringToDateTime(
                                    datetime: news.publicDate!),
                                color: AppColor.grey,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: AppText(
                                      content: news.newsTitle,
                                      color: AppColor.colorTextCyan,
                                      fontWeight: FontWeight.bold,
                                      textSize: Dimens.font_size_title,
                                    ),
                                  ),
                                 BuildHomepageNewsButton(newsModel: news)
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  SvgPicture.asset(
                                    Images.location_svg,
                                    color: AppColor.colorTextCyan,
                                  ),
                                  Dimens.width10,
                                  AppText(
                                    content: news.location,
                                    color: AppColor.colorTextCyan,
                                  )
                                ],
                              ),
                              Dimens.height5,
                              Row(
                                children: <Widget>[
                                  SvgPicture.asset(
                                    Images.services_svg,
                                    color: AppColor.colorTextCyan,
                                  ),
                                  Dimens.width10,
                                  AppText(
                                    content: news.abandonAnimalTypeName,
                                    color: AppColor.colorTextCyan,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                      ],
                    ))
                .toList(),
          ));
  }
}
