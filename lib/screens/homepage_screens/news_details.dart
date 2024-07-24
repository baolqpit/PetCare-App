import 'package:flutter/material.dart';
import 'package:petcare_app_management/model/news_model/news_model.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';
import 'package:petcare_app_management/share/Widgets/custom_app_bar.dart';
import 'package:petcare_app_management/share/format/format.dart';

class NewsDetails extends StatefulWidget {
  final NewsModel newsModel;
  const NewsDetails({super.key, required this.newsModel});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'News Detail', showReturnButton: true),
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimens.padding_horizontal,
              vertical: Dimens.padding_vertical),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppText(
                content: widget.newsModel.title,
                fontWeight: FontWeight.bold,
                textSize: Dimens.font_size_title,
              ),
              Dimens.height10,
              Image.network(widget.newsModel.urlToImage!),
              Dimens.height10,
              AppText(
                content: widget.newsModel.description,
              ),
              Dimens.height20,
              AppText(
                  content: "Author: ${widget.newsModel.author}"),
              AppText(
                  content:
                      "Published at: ${formatStringToDateTime(datetime: widget.newsModel.publishedAt!)}")
            ],
          ),
        ));
  }
}
