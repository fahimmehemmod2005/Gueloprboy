import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gueloprboy/core/constant/app_color.dart';
import 'package:gueloprboy/core/constant/app_images.dart';
import 'package:gueloprboy/core/constant/app_text_styles.dart';
import 'package:gueloprboy/features/plots/presentation/view/screens/plots_screens.dart';
import 'package:gueloprboy/features/rent/presentation/view/screens/rent_screen.dart';
import 'package:gueloprboy/features/repair/presentation/view/screens/repair_screen.dart';
import 'package:gueloprboy/features/main/viewmodel/main_view_model.dart';
import 'package:provider/provider.dart';
import '../../chat/presentation/view/screens/chat_screen.dart';
import '../../home/presentation/view/screens/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screens = [
      HomeScreen(),
      RepairScreen(),
      RentScreen(),
      PlotsScreens(),
      ChatScreen(),
    ];

    var icons = [
      AppImages.home,
      AppImages.repair,
      AppImages.rent,
      AppImages.plot,
      AppImages.chat,
    ];

    var labels = ["Home", "Repair", "Rent", "Plots", "Chat"];

    return Consumer<MainViewModel>(
      builder: (context, provider, child) {
        return Scaffold(
          body: IndexedStack(
            index: provider.currentIndex,
            children: screens,
          ),

          bottomNavigationBar: SafeArea(
            bottom: true,
            top: false,
            child: Container(
              height: 56.0.h,
              padding: const EdgeInsets.symmetric(horizontal: 28),
              decoration: const BoxDecoration(
                  color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(icons.length, (index) {
                  final isSelected = provider.currentIndex == index;

                  return GestureDetector(
                    onTap: () {
                      provider.changeIndex(index);
                    },
                    child: isSelected
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.bandColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  icons[index],
                                  height: 22,
                                  width: 22,
                                  color: AppColor.primaryColor,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  labels[index],
                                  style: AppTextStyles.size14w500(
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Image.asset(
                            icons[index],
                            height: 22,
                            width: 22,
                            color: AppColor.iconColor,
                          ),
                  );
                }),
              ),
            ),
          ),
        );
      },
    );
  }
}
