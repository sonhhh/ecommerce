import 'package:ecommerce/model/enum/load_status.dart';
import 'package:ecommerce/ui/pages/page_view/home_page/home_provider.dart';
import 'package:ecommerce/ui/pages/widget/text_field_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchListView extends StatefulWidget {
  const SearchListView({super.key});

  @override
  State<SearchListView> createState() => _SearchListViewState();
}

class _SearchListViewState extends State<SearchListView> {
  late TextEditingController searchController;
  late HomeProvider provider;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    provider = context.read<HomeProvider>();
    provider.initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Icon(
              Icons.format_list_bulleted,
              size: 20,
              color: Colors.black,
            )
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            AppTextFieldSearch(
              controller: searchController,
              hintText: 'Search Categories',
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Consumer<HomeProvider>(
                builder: (context, provider, child) {
                  if (provider.loadStatus == LoadStatus.success) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: provider.categories?.length,
                      itemBuilder: (context, index) {
                        final categories = provider.categories?[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Image.network(
                                  categories?.image ?? '',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  color: Colors.black.withOpacity(0.4),
                                  child: Center(
                                    child: Text(
                                      categories?.name ?? '',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
