import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gueloprboy/app/widgets/widget_header.dart';
import 'package:gueloprboy/core/constant/app_color.dart';
import 'package:gueloprboy/core/constant/app_images.dart';
import 'package:gueloprboy/core/constant/app_size_box.dart';
import 'package:gueloprboy/features/home/presentation/view/widgets/widget_title_bar.dart';

import '../../../../../core/constant/app_text_styles.dart';
import '../widgets/notification_card.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  var notificationCard1 = [
    {
      'icon': AppImages.wallet,
      'title': 'Rent Payment Reminder',
      'subTitle': 'Rent is due on April 15, 2025. Don’t forget to pay on time to avoid late fees.',
      'time': '2 min ago'
    },
    {
      'icon': AppImages.repair,
      'title': 'Maintenance Request Update',
      'subTitle': 'Your request for Leaking faucet in kitchen is now marked as In Progress.',
      'time': '4 min ago'
    },
    {
      'icon': AppImages.plot,
      'title': 'New Property Available',
      'subTitle': '89 Greenfield Lane, Boston – A new apartment is available.',
      'time': '1 hr ago'
    },
  ];
  var notificationCard2 = [
    {
      'icon': AppImages.plot,
      'title': 'Maintenance Request Update',
      'subTitle': 'Your request for Leaking faucet in kitchen is now marked as In Progress.',
      'time': '2 days ago'
    },
    {
      'icon': AppImages.plot,
      'title': 'New Property Available',
      'subTitle': '89 Greenfield Lane, Boston – A new apartment is available.',
      'time': '2 days ago'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              WidgetHeader(title: 'Notification', width: 130),
              AppSizeBox.height10,
              TitleBar(
                title: 'Today',
                subTitle: 'Mark all as read',
                textColor1: Colors.black,
                textColor2: AppColor.primaryColor,
              ),
              Column(
                children: notificationCard1.map((item){
                  return NotificationCard(
                    icon: item['icon'],
                    title: item['title'],
                    subTitle: item['subTitle'],
                    time: item['time'],
                  );
                }).toList(),
              ),
              TitleBar(
                  title: 'Yesterday',
                  subTitle: 'Mark all as read',
                textColor1: Colors.black,
                textColor2: AppColor.primaryColor,
              ),
              Column(
                children: notificationCard2.map((item){
                  return NotificationCard(
                    icon: item['icon'],
                    title: item['title'],
                    subTitle: item['subTitle'],
                    time: item['time'],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
