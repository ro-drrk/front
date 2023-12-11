import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pill_cart/controller/search_controller.dart';
import 'package:pill_cart/helper/constant.dart';
import 'package:pill_cart/main.dart';
import 'package:pill_cart/models/medicines_model.dart';
import 'package:pill_cart/widgets/custom_drawer.dart';
import 'package:pill_cart/widgets/text_fields/custom_search_bar.dart';

class SearchResultsScreen extends StatelessWidget {
  Future<List<Medicines>>? searchResults;

  TextEditingController searchController = TextEditingController();

  CustomSearchController customSearchController = Get.find();

  SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('from sr screen');
    return SafeArea(
      child: Scaffold(
        endDrawer: CustomDrawer(),
        appBar: AppBar(
          leadingWidth: 48,
          foregroundColor: kBrand800,
          title: Text(
            'Search Results',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSearchBar(
                  controller: customSearchController,
                  onChanged: (value) {
                    customSearchController.search(value);
                  },
                  onTapOutside: (p0) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  isScure: true,
                  textController: searchController,
                  isSuffix: true,
                  preIcon: FontAwesomeIcons.magnifyingGlass,
                  isPrefix: true,
                ),
                SizedBox(
                  height: 8,
                ),
                Expanded(
                  child:
                      GetBuilder<CustomSearchController>(builder: (controller) {
                    return ListView.builder(
                      itemCount: controller.searchResults.length,
                      itemBuilder: (context, index) {
                        return Text(controller.searchResults[index].tradeName);
                      },
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
