import 'package:flutter/material.dart';

class TextfieldCustom extends StatelessWidget {
  final bool isReadOnly;
  final TextInputType inputType;
  final String nama;
  final String namaTextEdit;
  final FormFieldValidator<String>? validator;
  const TextfieldCustom(
      {Key? key,
      required this.inputType,
      required this.nama,
      required this.namaTextEdit,
      this.validator,
      this.isReadOnly = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 12),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              nama,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            keyboardType: inputType,

            validator: validator,
            readOnly: isReadOnly,
            // style: primaryTextStyle.copyWith(
            //     fontSize: 15,
            //     fontWeight: medium,
            //     color: isReadOnly
            //         ? ColorPlatte.greyTextColor
            //         : ColorPlatte.dartkText),
            decoration: InputDecoration(
                hintText: "Masukkan $nama",
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey, width: 0.5))),
          ),
        ),
        SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
