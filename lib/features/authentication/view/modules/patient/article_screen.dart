import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:store/common/widget/appBar/custom_appbar.dart';
import 'package:store/features/authentication/controller/category_controller/category_controller.dart';
import 'package:store/features/authentication/view/modules/patient/widget/categories_widget/categories_widget.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/size.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:store/utils/helper/helper_function.dart';
import 'package:store/viewModel/patient/article_view_model.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: Text("Articles", style: TextStyle(color: Colors.black)),
        bottomWidget: CategoriesWidget(),
      ),
      body: Consumer<CategoryProvider>(
        builder: (context, category, _) => SafeArea(
          child: ListView(
            children: [
              const Divider(
                color: TColors.grey,
              ),
              const SizedBox(
                height: TSized.spacebetweenItem,
              ),
              FutureBuilder(
                  future: context
                      .read<ArticleViewModel>()
                      .getCategories(category.selectedCategory),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: THelperFunction.showIndicator(20));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text(
                          "No Data Found!",
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: TSized.defaultSpace / 1.5,
                                right: TSized.defaultSpace / 1.5),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, left: 0, right: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          snapshot.data![index].image ?? "",
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      height: MediaQuery.sizeOf(context).width *
                                          0.5,
                                      fit: BoxFit.cover,
                                      errorWidget: (context, url, error) =>
                                          const Icon(
                                        Icons.error,
                                        color: Colors.red,
                                      ),
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              Center(
                                        child: THelperFunction.showIndicator(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: TSized.spacebetweenItem,
                                  ),
                                  ReadMoreText(
                                    snapshot.data![index].title ?? "",
                                    trimLines: 2,
                                    colorClickableText: TColors.primary,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: 'Show more',
                                    trimExpandedText: 'Show less',
                                    moreStyle:
                                        Theme.of(context).textTheme.labelLarge,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(
                                    height: TSized.spacebetweenItem,
                                  ),
                                  ReadMoreText(
                                    snapshot.data![index].message ?? "",
                                    trimLines: 2,
                                    colorClickableText: TColors.primary,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: 'Show more',
                                    trimExpandedText: 'Show less',
                                    moreStyle:
                                        Theme.of(context).textTheme.labelLarge,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: snapshot.data!.length,
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
