
import 'package:flutter/material.dart';

import '../../../../../core/constant/app_images.dart';
import '../../../../../core/constant/app_text_styles.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Image.asset(AppImages.profile)),
      title: Text('Welcome, Joe!'),
      titleTextStyle: AppTextStyles.size16w600(color: Colors.white),
      subtitle: Row(
        children: [
          Image.asset(AppImages.location),
          const SizedBox(width: 10.0),
          Text(
            '1234 Elm Street, Apt 7B',
            style: AppTextStyles.size14w400(color: Colors.white),
          ),
          const SizedBox(width: 10.0),
          GestureDetector(
            child: Image.asset(AppImages.downArrow),
            onTap: () {},
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: Image.asset(AppImages.notification),
      ),
    );
  }
}