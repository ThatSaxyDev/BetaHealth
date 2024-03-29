// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:betahealth/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoteInputBox extends ConsumerWidget {
  final double? height;
  final double? width;
  final String hintText;
  final TextEditingController? controller;
  final bool obscuretext;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final int? maxLines;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  const NoteInputBox({
    Key? key,
    this.height,
    this.width,
    required this.hintText,
    this.controller,
    this.obscuretext = false,
    this.validator,
    this.suffixIcon,
    this.keyboardType,
    this.maxLines,
    this.onChanged,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final currenTheme = ref.watch(themeNotifierProvider);
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        onTap: onTap,
        onChanged: onChanged,
        maxLines: maxLines,
        style: TextStyle(
          fontSize: 16.sp,
          color: Pallete.blackColor,
        ),
        controller: controller,
        obscureText: obscuretext,
        obscuringCharacter: '*',
        cursorColor: Pallete.blackColor,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          // filled: true,
          // fillColor: currenTheme.cardColor,
          // contentPadding: EdgeInsets.fromLTRB(24.w, 20.h, 0, 20.h),
          helperText: " ",
          helperStyle: const TextStyle(fontSize: 0.0005),
          errorStyle: const TextStyle(fontSize: 0.0005),
          isDense: true,

          suffixIcon: suffixIcon,
          hintText: hintText,

          hintStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: Pallete.textGrey,
          ),
          border: InputBorder.none
          // border: OutlineInputBorder(
          //   borderSide: BorderSide(color: currenTheme.cardColor),
          // ),
          // enabledBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: currenTheme.cardColor),
          //   borderRadius: BorderRadius.circular(8.r),
          // ),
          // focusedBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: currenTheme.cardColor),
          //   borderRadius: BorderRadius.circular(8.r),
          // ),
        ),
        validator: validator,
      ),
    );
  }
}

// class AltTextInputBox extends StatelessWidget {
//   final double? height;
//   final double? width;
//   final String hintText;
//   final String inputTitle;
//   final TextEditingController controller;
//   final bool obscuretext;
//   final FormFieldValidator<String>? validator;
//   final Widget? suffixIcon;
//   const AltTextInputBox({
//     Key? key,
//     this.height,
//     this.width,
//     required this.hintText,
//     required this.inputTitle,
//     required this.controller,
//     this.obscuretext = false,
//     this.validator,
//     this.suffixIcon,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 56.h,
//       width: width,
//       padding: EdgeInsets.only(top: 10.h),
//       decoration: BoxDecoration(
//           color: AppColors.textFillGrey,
//           border: Border.all(
//             color: AppColors.textBorderGrey,
//           ),
//           borderRadius: BorderRadius.circular(8.r)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: EdgeInsets.only(left: 24.w),
//             child: Text(
//               inputTitle,
//               style: TextStyle(
//                 color: AppColors.grey3,
//                 fontSize: 8.sp,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 32.h,
//             child: TextFormField(
//               style: TextStyle(
//                 fontSize: 12.sp,
//               ),
//               controller: controller,
//               obscureText: obscuretext,
//               obscuringCharacter: '*',
//               cursorColor: Colors.black,
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: AppColors.textFillGrey,
//                 contentPadding: EdgeInsets.only(top: 20.h, left: 24.w),
//                 helperText: " ",
//                 helperStyle: const TextStyle(fontSize: 0.0005),
//                 errorStyle: const TextStyle(fontSize: 0.0005),
//                 // isDense: true,

//                 suffixIcon: suffixIcon,
//                 hintText: hintText,
//                 hintStyle: TextStyle(
//                   fontSize: 12.sp,
//                   fontWeight: FontWeight.w400,
//                   color: AppColors.grey,
//                 ),
//                 // hintText: hintText,

//                 // hintStyle: TextStyle(
//                 //   fontSize: 13.sp,
//                 //   fontWeight: FontWeight.w400,
//                 //   color: AppColors.grey3,
//                 // ),
//                 border: const OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.transparent),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(color: Colors.transparent),
//                   borderRadius: BorderRadius.circular(8.r),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(color: Colors.transparent),
//                   borderRadius: BorderRadius.circular(8.r),
//                 ),
//                 errorBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(color: AppColors.primaryRed),
//                 ),
//               ),
//               validator: validator,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
