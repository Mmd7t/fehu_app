import 'package:dropdown_search/dropdown_search.dart';
import 'package:fehu_app/app/core/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchDropdown extends StatelessWidget {
  final List<String>? data;
  final String? hint;
  final String? validator;
  final Function(String?)? onChanged;
  final String? selectedItem;
  final Mode? dropdownMode;
  const CustomSearchDropdown({
    Key? key,
    this.data,
    this.validator,
    this.onChanged,
    this.hint,
    this.selectedItem,
    @required this.dropdownMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      mode: dropdownMode!,
      items: data,
      popupItemBuilder: (context, item, isSelected) {
        return ListTile(
          title: Text(
            item,
            style: Get.textTheme.bodyText1!.copyWith(
              color: Colors.white,
            ),
          ),
        );
      },
      selectedItem: selectedItem,
      validator: (String? value) {
        if (value == null || value == '') {
          return validator;
        } else {
          return null;
        }
      },
      popupTitle: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          hint!,
          style: Get.textTheme.subtitle1!
              .copyWith(color: Get.theme.colorScheme.secondary),
        ),
      ),
      onChanged: onChanged,
      selectionListViewProps: const SelectionListViewProps(
        physics: BouncingScrollPhysics(),
      ),
      scrollbarProps: ScrollbarProps(
        radius: const Radius.circular(20),
      ),
      dropDownButton: Icon(CupertinoIcons.arrow_down_circle,
          color: Get.theme.colorScheme.onPrimary, size: 20),
      dropdownButtonSplashRadius: 20,
      popupBackgroundColor: Get.theme.primaryColor,
      popupShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      // searchFieldProps: TextFieldProps(
      //   style: Get.textTheme.bodyText1!.copyWith(
      //     color: Colors.white,
      //   ),
      //   decoration: InputDecoration(
      //     hintText: 'search about'.tr,
      //     hintStyle: Get.textTheme.caption!.copyWith(
      //       color: Colors.white,
      //     ),
      //     filled: true,
      //     fillColor: Get.theme.colorScheme.secondary,
      //     border: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(12),
      //       borderSide: const BorderSide(color: Colors.transparent),
      //     ),
      //     enabledBorder: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(12),
      //       borderSide: const BorderSide(color: Colors.transparent),
      //     ),
      //   ),
      // ),
      dropdownSearchDecoration: CustomInputDecoration.decorate(
        padding: 8,
        hintText: hint!,
        prefixIcon: Icons.arrow_circle_down,
      ),
    );
  }
}
