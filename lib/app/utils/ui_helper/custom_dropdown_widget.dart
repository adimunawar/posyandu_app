import 'package:flutter/material.dart';
import 'package:posyandu_app/app/data/models/ibu_hamil.dart';

import '../../data/models/ibu.dart';

class CustomDropDownItem extends StatelessWidget {
  final Function(int) onChanged;
  final int? selectedValue;
  final List<Ibu> menuList;
  final String label;
  final hinText;

  const CustomDropDownItem({
    Key? key,
    required this.onChanged,
    this.selectedValue,
    required this.menuList,
    required this.label,
    this.hinText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget dropdownList({
      Widget? hintTextt,
      int? selectedValue,
      Function(int)? onChanged,
      List<Ibu>? menuList,
      double? itemHeight,
      int? elevation,
      EdgeInsetsGeometry? menuPadding,
      Color? menuColor,
      bool hideUnderline = true,
      bool biggerText = false,
    }) {
      final items = menuList?.map((value) {
        return DropdownMenuItem<int>(
          value: value.id,
          child: Text(value.nama!),
          onTap: () {},
        );
      }).toList();
      return ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton<int>(
            value: selectedValue ?? 0,
            items: items,
            underline: SizedBox(),
            hint: hintTextt,
            isExpanded: true,
            onChanged: (value) {
              onChanged!(value!);
            }),
      );
    }

    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 14),
          Container(
            height: 50,
            // width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 0,
                right: 6,
                top: 6,
                bottom: 6,
              ),
              child: dropdownList(
                menuPadding: EdgeInsets.only(
                  left: 2,
                  right: 16,
                  top: 10,
                ),
                hintTextt: Container(
                  child: Text(
                    "Pilih $label",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontSize: 14),
                    // textAlign: TextAlign.center,
                  ),
                ),
                menuList: menuList,
                selectedValue: selectedValue,
                onChanged: onChanged,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
