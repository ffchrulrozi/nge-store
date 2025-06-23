import 'package:flutter/material.dart';
import 'package:nge_store/modules/home/providers/home_provider.dart';
import 'package:nge_store/utils/helper/divider_helper.dart';
import 'package:nge_store/utils/helper/style_helper.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(this.provider, {super.key});
  final HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                "Categories",
                style: text(context)
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                "See all",
                style:
                    text(context).titleMedium!.copyWith(color: Colors.purple),
              ),
              Icon(Icons.chevron_right, color:Colors.purple)
            ],
          ),
        ),
        v(1),
        SizedBox(
          height: 35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: provider.categories.length,
            itemBuilder: (context, index) {
              final category = provider.categories[index];

              return InkWell(
                onTap: () => provider.setCategory(category.slug ?? ""),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple),
                    borderRadius: BorderRadius.circular(5),
                    color: provider.selectedCategory == category.slug
                        ? Colors.purple
                        : null,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  margin: EdgeInsets.only(left: index == 0 ? 20 : 0, right: 10),
                  child: Text(
                    category.name ?? "",
                    style: TextStyle(
                      color: provider.selectedCategory == category.slug
                          ? Colors.white
                          : null,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
