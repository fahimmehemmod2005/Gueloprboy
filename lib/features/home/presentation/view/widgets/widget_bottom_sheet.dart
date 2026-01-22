import 'package:flutter/material.dart';
import 'package:gueloprboy/features/home/presentation/viewmodel/filter_button_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../../app/widgets/primary_button.dart';
import '../../../../../core/constant/app_color.dart';
import '../../../../../core/constant/app_size_box.dart';
import '../../../../../core/constant/app_text_styles.dart';

class WidgetBottomSheet extends StatelessWidget {
  const WidgetBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final filter = context.watch<FilterButtonViewModel>();

    return SafeArea(
      top: false,
      child: Container(
        height: 800,
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
                  Text('Filter',
                      style: AppTextStyles.size16w600(
                          color: AppColor.titleColor)),
                  const CloseButton(),
                ],
              ),

              /// title
              Text('Rent Price Range',
                  style: AppTextStyles.size16w500(
                      color: AppColor.titleColor)),

              AppSizeBox.height10,

              Text(
                'Min \$400 - Max \$40000',
                style: AppTextStyles.size14w500(color: AppColor.iconColor),
              ),

              AppSizeBox.height10,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Min Rent',
                      style: AppTextStyles.size14w500(
                          color: AppColor.iconColor)),
                  Text('Max Rent',
                      style: AppTextStyles.size14w500(
                          color: AppColor.iconColor)),
                ],
              ),

              /// slider
              RangeSlider(
                activeColor: AppColor.primaryColor,
                inactiveColor: AppColor.borderColor,
                min: filter.minPrice,
                max: filter.maxPrice,
                values: filter.priceRange,
                divisions: 100,
                labels: RangeLabels(
                  '\$${filter.priceRange.start.round()}',
                  '\$${filter.priceRange.end.round()}',
                ),
                onChanged: filter.updatePrice,
              ),

              AppSizeBox.height5,
              Divider(color: AppColor.borderColor),
              AppSizeBox.height5,

              /// size
              Text('Property size',
                  style: AppTextStyles.size16w500(
                      color: AppColor.titleColor)),

              AppSizeBox.height10,

              Wrap(
                spacing: 15,
                children: filter.sizes.map((size) {
                  final selected = filter.selectedSize == size;
                  return ChoiceChip(
                    label: Text(size,
                        style: AppTextStyles.size14w500(
                            color:
                            selected ? Colors.white : Colors.black)),
                    selected: selected,
                    onSelected: (v) =>
                        filter.selectSize(v ? size : null),
                    selectedColor: AppColor.primaryColor,
                    backgroundColor: Colors.white,
                  );
                }).toList(),
              ),

              AppSizeBox.height10,

              /// bedroom
              Text('Bed Room',
                  style: AppTextStyles.size16w500(
                      color: AppColor.titleColor)),

              AppSizeBox.height10,

              Wrap(
                spacing: 15,
                children: [1, 2, 3, 4].map((num) {
                  final selected =
                  filter.selectedBedrooms.contains(num);
                  return FilterChip(
                    backgroundColor: Colors.white,
                    selectedColor: AppColor.primaryColor,
                    label: Text('$num',
                        style: AppTextStyles.size14w500(
                            color:
                            selected ? Colors.white : Colors.black)),
                    selected: selected,
                    onSelected: (_) => filter.toggleBedroom(num),
                  );
                }).toList(),
              ),

              AppSizeBox.height10,

              /// bathroom
              Text('Bath Room',
                  style: AppTextStyles.size16w500(
                      color: AppColor.titleColor)),

              AppSizeBox.height10,

              Wrap(
                spacing: 15,
                children: [1, 2, 3, 4].map((num) {
                  final selected =
                  filter.selectedBathrooms.contains(num);
                  return FilterChip(
                    backgroundColor: Colors.white,
                    selectedColor: AppColor.primaryColor,
                    label: Text('$num',
                        style: AppTextStyles.size14w500(
                            color:
                            selected ? Colors.white : Colors.black)),
                    selected: selected,
                    onSelected: (_) => filter.toggleBathroom(num),
                  );
                }).toList(),
              ),

              AppSizeBox.height5,
              Divider(color: AppColor.borderColor),
              AppSizeBox.height5,

              /// amenities
              Text('Amenities',
                  style: AppTextStyles.size16w500(
                      color: AppColor.titleColor)),

              AppSizeBox.height10,
              Row(
                    children: [
                      Checkbox(
                        value: filter.parking,
                        onChanged: (v) => filter.setParking(v!),
                        activeColor: AppColor.primaryColor,
                      ),
                      Text('Parking'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: filter.gym,
                        onChanged: (v) => filter.setGym(v!),
                        activeColor: AppColor.primaryColor,
                      ),
                      Text('Gym access'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: filter.cctv,
                        onChanged: (v) => filter.setCctv(v!),
                        activeColor: AppColor.primaryColor,
                      ),
                      Text('CCTV'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: filter.balcony,
                        onChanged: (v) => filter.setBalcony(v!),
                        activeColor: AppColor.primaryColor,
                      ),
                      Text('Balcony'),
                    ],
                  ),
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      label: 'Clear',
                      onPressed: filter.clearAll,
                    ),
                  ),
                  AppSizeBox.width20,
                  Expanded(
                    child: PrimaryButton(
                      label: 'Apply',
                      backgroundColor: AppColor.primaryColor,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


