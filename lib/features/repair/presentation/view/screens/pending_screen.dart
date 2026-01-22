import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gueloprboy/core/constant/app_color.dart';
import 'package:gueloprboy/core/constant/app_images.dart';
import 'package:gueloprboy/core/constant/app_size_box.dart';
import 'package:gueloprboy/core/constant/app_text_styles.dart';

import '../widgets/maintenance_request_pending_card.dart';

class PendingScreen extends StatefulWidget {
  const PendingScreen({super.key});

  @override
  State<PendingScreen> createState() => _PendingScreenState();
}

class _PendingScreenState extends State<PendingScreen> {
  var maintenance = [
    AppImages.repair1,
    AppImages.repair2,
    AppImages.repair3,
    AppImages.repair4,
    AppImages.repair5,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16.0),
          itemCount: maintenance.length,
          separatorBuilder: (context, index) => AppSizeBox.height10,
          itemBuilder: (context, index) {
            return MaintenanceRequestPendingCard(
              image: maintenance[index],
              title: 'Leaky Faucet',
              room: 'Kitchen',
              date: 'April 3, 2025',
              status: 'Pending',
              situation: 'Emergency',
            );
          },
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsetsGeometry.all(10),
          height: 56.0.h,
          width: 116.0.w,
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: Colors.white),
              Text('Request', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
