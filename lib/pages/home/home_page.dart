import 'package:afisha_market/core/bloc/home/home_bloc.dart';
import 'package:afisha_market/core/data/source/remote/response/RegionResponse.dart';
import 'package:afisha_market/core/di/dependency_manager.dart';
import 'package:afisha_market/pages/components/shimmers/product_grid_list_shimmer.dart';
import 'package:afisha_market/pages/home/widget/app_bar.dart';
import 'package:afisha_market/pages/home/widget/carousel_slider.dart';
import 'package:afisha_market/pages/home/widget/product_item.dart';
import 'package:afisha_market/pages/product_detail/ProductDetailPage.dart';
import 'package:afisha_market/pages/utils/const.dart';
import 'package:afisha_market/pages/utils/custom_button_two.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../components/shimmers/carousel_shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final bloc = HomeBloc(homeRepository, filterRepository);
  final controller = RefreshController();

  @override
  void initState() {
    bloc.add(HomeInitEvent());
    bloc.add(HomeGetMaterialTypes());
    print('Home page');
    super.initState();
  }

  int selectedMaterialTypeIndex = -1;

  @override
  Widget build(BuildContext context) {
    final heightOfAppbar = (_scaffoldKey.currentState?.appBarMaxHeight??0);

    final l10n = AppLocalizations.of(context);
    final customHeight = MediaQuery.of(context).size.height * 0.9;
    print('heightOfAppbar --> $heightOfAppbar');
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.status == Status.success) {
            controller.loadComplete();
            controller.refreshCompleted();
          }
        },
        builder: (context, state) {
          return SafeArea(
            key: _scaffoldKey,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Builder(builder: (context) {
                return Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: CustomSearchBar(search: (searchText) {
                                EasyDebounce.debounce("my_search_debounce", const Duration(seconds: 2), () {
                                  bloc.add(HomeSearchEvent(searchText));
                                });
                              })),
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    isDismissible: false,
                                    barrierColor: Colors.black.withOpacity(0.5),
                                    builder: (context) {
                                      return StatefulBuilder(builder: (context, setState){
                                        return Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        padding: const EdgeInsets.only(
                                            top: 12,
                                            right: 12,
                                            left: 12,
                                            bottom: 12
                                        ),
                                        height: customHeight,
                                        child: Column(
                                          children: [
                                            Container(
                                              height: customHeight / 1.5,
                                              padding: const EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: 1
                                                  ),
                                                  borderRadius: BorderRadius.circular(12)
                                              ),
                                              child: ListView.builder(
                                                  itemCount: state.materialTypeResponse?.mahsulotTolasi.length,
                                                  itemBuilder: (context, index){
                                                return InkWell(
                                                  onTap: (){
                                                    setState((){
                                                      selectedMaterialTypeIndex = index;
                                                    });
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.all(12),
                                                      margin: EdgeInsets.all(12),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(12),
                                                        color: (selectedMaterialTypeIndex == index)? mainColor: null,
                                                        border: Border.all(
                                                            color:(selectedMaterialTypeIndex == index)?blueColor: Colors.grey,
                                                            width: 1
                                                        ),
                                                      ),
                                                      child: Text(
                                                        state.materialTypeResponse?.mahsulotTolasi[index].name??"",
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(color:(selectedMaterialTypeIndex == index)? Colors.black: Colors.black),
                                                      )
                                                  ),
                                                );
                                              })
                                            ),
                                            SizedBox(height: customHeight * 0.01,),
                                            Spacer(),
                                            CustomButtonTwo(l10n?.apply??'', onTap: (){
                                              context.read<HomeBloc>().add(HomeFilterProductsByMaterialTypes(state.materialTypeResponse?.mahsulotTolasi[selectedMaterialTypeIndex].name??''));
                                              // setState((){
                                              //   selectedMaterialTypeIndex = -1;
                                              // });
                                              Navigator.of(context).pop();
                                            },),
                                          ],
                                        )
                                        );
                                      });
                                    },
                                  );
                                },
                                child: Container(
                                    margin: const EdgeInsets.only(right: 16),
                                    width: 50,
                                    height: 50,
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: SvgPicture.asset("assets/icons/filter_inside.svg")),
                              )
                            ],
                          ),
                          Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Text("${AppLocalizations.of(context)?.viewCounts}${state.viewCount}")
                          )
                        ],
                      ),
                      Expanded(
                        child: SmartRefresher(
                          controller: controller,
                          enablePullDown: true,
                          enablePullUp: true,
                          onRefresh: () async {
                            bloc.add(HomeInitEvent());
                          },
                          onLoading: () async {
                            bloc.add(HomeNextEvent());
                          },
                          footer: const ClassicFooter(loadStyle: LoadStyle.ShowWhenLoading),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Column(
                                      children: [
                                        Builder(builder: (context) {
                                          if (state.isFetchingAds) {
                                            return CarouselShimmer();
                                          } else if (state.adList.isNotEmpty) {
                                            return CustomCarouselSlider(carouselItems: state.adList);
                                          } else {
                                            return Container();
                                          }
                                        }),
                                      ],
                                    ),
                                  ],
                                ),
                                Builder(builder: (context) {
                                  if (state.isFetchingProducts) {
                                    return const ProductGridListShimmer();
                                  }
                                  if (state.productList.isNotEmpty) {
                                    print('Product List --> ${state.productList}');
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: GridView.builder(
                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 5,
                                          mainAxisSpacing: 5,
                                          childAspectRatio: 0.58,
                                        ),
                                        itemCount: state.productList.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, i) {
                                          return GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailPage(product: state.productList[i],)));
                                              },
                                              child: ProductItem(product: state.productList[i])
                                          );
                                        },
                                      ),
                                    );
                                  } else if(state.isFetchingFilteredProducts) {
                                    return Container(
                                      padding: const EdgeInsets.only(top: 50),
                                      child: Center(child: CircularProgressIndicator()),
                                    );
                                  }else{
                                    return Container(
                                      padding: const EdgeInsets.only(top: 50),
                                      child: Center(child: Text(AppLocalizations.of(context)?.productsNotFound ?? '')),
                                    );
                                  }
                                })
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
