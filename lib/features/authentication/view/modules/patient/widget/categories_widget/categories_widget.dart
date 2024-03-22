import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/features/authentication/controller/category_controller/category_controller.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/size.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categoryList = [
      'Mental Health',
      'Depression',
      'Anxiety',
      'Psychology',
    ];
    return Consumer<CategoryProvider>(
      builder: (context, categoryProvider, _) => SizedBox(
        height: 50,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) =>
              const Padding(padding: EdgeInsets.only(right: 12)),
          itemBuilder: (context, index) {
            final String categoriesName = categoryList[index];
            final isSelected =
                categoriesName == categoryProvider.selectedCategory;
            return GestureDetector(
              onTap: () {
                categoryProvider.setSelectedCategory(categoriesName);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: isSelected ? TColors.primary : TColors.accent,
                    borderRadius: BorderRadius.circular(TSized.cardRadiusXsm)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Center(
                    child: Text(
                      categoriesName,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: categoryList.length,
        ),
      ),
    );
  }
}
