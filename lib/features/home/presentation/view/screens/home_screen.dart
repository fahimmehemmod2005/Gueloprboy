import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gueloprboy/app/routes/route_name.dart';
import 'package:gueloprboy/core/constant/app_images.dart';
import 'package:gueloprboy/core/constant/app_size_box.dart';
import 'package:gueloprboy/features/home/presentation/view/widgets/for_rent_house_details.dart';
import '../widgets/house_details.dart';
import '../widgets/profile_list_tile.dart';
import '../widgets/widget_background_image.dart';
import '../widgets/widget_bottom_sheet.dart';
import '../widgets/widget_search_input_field.dart';
import '../widgets/widget_title_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final house = [
    AppImages.house1,
    AppImages.house2,
    AppImages.house3,
    AppImages.house4,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            BackgroundImage(), // background image
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSizeBox.height20,
                    ProfileListTile(
                      notificationTap: (){
                        Navigator.pushNamed(context, RouteName.notificationScreen);
                      },
                    ),
                    AppSizeBox.height10,
                    SearchInputField(
                      onTap: () {
                        _showFilterBottomSheet(context);
                      },
                    ),
                    AppSizeBox.height10,
                    TitleBar(
                      title: 'Properties',
                      subTitle: 'See all',
                      onTap: () {},
                    ),
                    AppSizeBox.height5,

                    // Horizontal ListView of HouseDetails
                    SizedBox(
                      height: 305.0.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: house.length,
                        separatorBuilder: (_, _) => AppSizeBox.width10,
                        itemBuilder: (context, index) {
                          return HouseDetails(houseImage: house[index]);
                        },
                      ),
                    ),

                    AppSizeBox.height20,

                    // Feature Listing Title
                    TitleBar(
                      title: 'Feature Listing',
                      subTitle: 'See all',
                      textColor1: Colors.black,
                      textColor2: Colors.black,
                      onTap: () {},
                    ),
                    AppSizeBox.height5,

                    // Vertical list of HouseDetails with spacing
                    Column(
                      children: house
                          .map((v) => ForRentHouseDetails(houseImage: v))
                          .toList(),
                    ),

                    AppSizeBox.height20, // extra space at the bottom
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (builder) {
      return WidgetBottomSheet();
    },
  );
}
