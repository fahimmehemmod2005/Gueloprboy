import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gueloprboy/app/routes/route_name.dart';
import 'package:gueloprboy/app/widgets/widget_header.dart';
import 'package:gueloprboy/core/constant/app_size_box.dart';
import 'package:gueloprboy/features/repair/presentation/view/screens/pending_screen.dart';

class RepairScreen extends StatefulWidget {
  const RepairScreen({super.key});

  @override
  State<RepairScreen> createState() => _RepairScreenState();
}

class _RepairScreenState extends State<RepairScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  WidgetHeader(
                    title: 'Maintenance Request',
                    width: 90,
                    showNotification: true,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteName.notificationScreen,
                      );
                    },
                  ),

                  AppSizeBox.height20,

                  Container(
                    height: 40.h,
                    width: double.infinity,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: const Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      labelStyle: const TextStyle(fontWeight: FontWeight.w500),
                      indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      tabs: const [
                        Tab(text: 'Pending'),
                        Tab(text: 'On Going'),
                        Tab(text: 'Completed'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AppSizeBox.height10,
            Expanded(
              child: TabBarView(
                children: [
                  PendingScreen(),
                  Center(child: Text('OnGoing')),
                  Center(child: Text('Complete')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
