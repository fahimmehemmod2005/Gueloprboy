import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gueloprboy/core/constant/app_color.dart';
import 'package:gueloprboy/core/constant/app_images.dart';
import 'package:gueloprboy/core/constant/app_text_styles.dart';

import '../widgets/profile_list_tile.dart';
import '../widgets/widget_background_image.dart';
import '../widgets/widget_search_input_field.dart';
import '../widgets/widget_title_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 21),
                  ProfileListTile(),
                  const SizedBox(height: 22),
                  SearchInputField(),
                  const SizedBox(height: 24),
                  TitleBar(
                    title: 'Properties',
                    subTitle: 'See all',
                    onTap: (){},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


