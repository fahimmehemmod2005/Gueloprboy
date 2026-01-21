import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gueloprboy/app/widgets/primary_button.dart';

import '../../../../../core/constant/app_color.dart';
import '../../../../../core/constant/app_size_box.dart';
import '../../../../../core/constant/app_text_styles.dart';

class WidgetBottomSheet extends StatefulWidget {
  const WidgetBottomSheet({super.key});

  @override
  State<WidgetBottomSheet> createState() => _WidgetBottomSheetState();
}

class _WidgetBottomSheetState extends State<WidgetBottomSheet> {
  // range slider
  final double _minPrice = 400;
  final double _maxPrice = 40000;
  RangeValues _priceRange = const RangeValues(600, 800);

  // chip
  String? _selectedSize;
  final _sizes = ['950 sq ft', '1350 sq ft', '1400 sq ft', '1600 sq ft'];

  // bedrooms and bathrooms
  final _selectedBedrooms = [2];
  final _selectedBathrooms = [1];

  // checkbox list tile
  final _amenities = ['Parking', 'Gym', 'CCTV', 'Balcony'];
  bool _parking = false;
  bool _gym = false;
  bool _cctv = false;
  bool _balcony = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        height: 730, // responsive height
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSizeBox.height10,

              /// header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Filter',
                    style: AppTextStyles.size16w600(color: AppColor.titleColor),
                  ),
                  const CloseButton(),
                ],
              ),

              AppSizeBox.height10,

              /// title
              Text(
                'Rent Price Range',
                style: AppTextStyles.size16w500(color: AppColor.titleColor),
              ),

              AppSizeBox.height10,

              /// dynamic range text
              Text(
                'Min \$400 - Max \$40000',
                style: AppTextStyles.size14w500(color: AppColor.iconColor),
              ),

              AppSizeBox.height10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Min Rent',
                    style: AppTextStyles.size14w500(color: AppColor.iconColor),
                  ),
                  Text(
                    'Max Rent',
                    style: AppTextStyles.size14w500(color: AppColor.iconColor),
                  ),
                ],
              ),

              /// slider
              RangeSlider(
                activeColor: AppColor.primaryColor,
                inactiveColor: AppColor.borderColor,
                min: _minPrice,
                max: _maxPrice,
                values: _priceRange,
                divisions: 100,
                labels: RangeLabels(
                  '\$${_priceRange.start.round()}',
                  '\$${_priceRange.end.round()}',
                ),
                onChanged: (RangeValues value) {
                  setState(() {
                    _priceRange = value;
                  });
                },
              ),
              AppSizeBox.height5,
              Divider(color: AppColor.borderColor),
              AppSizeBox.height5,
              Text(
                'Property size',
                style: AppTextStyles.size16w500(color: AppColor.titleColor),
              ),
              AppSizeBox.height10,
              Wrap(
                spacing: 15,
                children: _sizes.map((size) {
                  final selected = _selectedSize == size;
                  return ChoiceChip(
                    label: Text(
                      size,
                      style: AppTextStyles.size14w500(
                        color: selected ? Colors.white : Colors.black,
                      ),
                    ),
                    selected: selected,
                    onSelected: (bool value) {
                      setState(() {
                        _selectedSize = value ? size : null;
                      });
                    },
                    selectedColor: AppColor.primaryColor,
                    backgroundColor: Colors.white,
                  );
                }).toList(),
              ),
              AppSizeBox.height10,
              Text(
                'Bed Room',
                style: AppTextStyles.size16w500(color: AppColor.titleColor),
              ),
              AppSizeBox.height10,
              Wrap(
                spacing: 15,
                children: [1, 2, 3, 4].map((num) {
                  final selected = _selectedBedrooms.contains(num);
                  return FilterChip(
                    backgroundColor: Colors.white,
                    selectedColor: AppColor.primaryColor,
                    label: Text(
                      '$num',
                      style: AppTextStyles.size14w500(
                        color: selected ? Colors.white : Colors.black,
                      ),
                    ),
                    selected: selected,
                    onSelected: (bool value) {
                      setState(() {
                        if (value) {
                          _selectedBedrooms.add(num);
                        } else {
                          _selectedBedrooms.remove(num);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              AppSizeBox.height10,
              Text(
                'Bath Room',
                style: AppTextStyles.size16w500(color: AppColor.titleColor),
              ),
              AppSizeBox.height10,
              Wrap(
                runSpacing: 10,
                spacing: 15,
                children: [1, 2, 3, 4].map((num) {
                  final selected = _selectedBathrooms.contains(num);
                  return FilterChip(
                    backgroundColor: Colors.white,
                    selectedColor: AppColor.primaryColor,
                    label: Text(
                      '$num',
                      style: AppTextStyles.size14w500(
                        color: selected ? Colors.white : Colors.black,
                      ),
                    ),
                    selected: selected,
                    onSelected: (bool value) {
                      setState(() {
                        if (value) {
                          _selectedBathrooms.add(num);
                        } else {
                          _selectedBathrooms.remove(num);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              AppSizeBox.height5,
              Divider(color: AppColor.borderColor),
              AppSizeBox.height5,
              Text(
                'Amenities',
                style: AppTextStyles.size16w500(color: AppColor.titleColor),
              ),
              AppSizeBox.height10,
              Wrap(
                spacing: 10,
                children: [
                  SizedBox(
                    height: 24,
                    width: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: AppColor.primaryColor,
                          value: _parking,
                          onChanged: (value) {
                            setState(() {
                              _parking = value!;
                            });
                          },
                        ),
                        AppSizeBox.width5,
                        Text(_amenities[0]),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                    width: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: AppColor.primaryColor,
                          value: _gym,
                          onChanged: (value) {
                            setState(() {
                              _gym = value!;
                            });
                          },
                        ),
                        AppSizeBox.width5,
                        Text(_amenities[1]),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                    width: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: AppColor.primaryColor,
                          value: _cctv,
                          onChanged: (value) {
                            setState(() {
                              _cctv = value!;
                            });
                          },
                        ),
                        AppSizeBox.width5,
                        Text(_amenities[2]),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                    width: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: AppColor.primaryColor,
                          value: _balcony,
                          onChanged: (value) {
                            setState(() {
                              _balcony = value!;
                            });
                          },
                        ),
                        AppSizeBox.width5,
                        Text(_amenities[3]),
                      ],
                    ),
                  ),
                ],
              ),
              AppSizeBox.height20,
              Row(
                children: [
                  Expanded(child: PrimaryButton(label: 'Clear',onPressed: (){},)),
                  AppSizeBox.width20,
                  Expanded(child: PrimaryButton(
                    label: 'Apply',
                    backgroundColor: AppColor.primaryColor,
                    onPressed: (){},
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
