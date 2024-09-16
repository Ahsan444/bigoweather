import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/AppModule/utils/app_colors.dart';





class CustomFormField extends StatelessWidget {
  final String? hint;
  final double? height;
  final Color? suffixIcon;
  final double fontSize;
  final double contentPadding;
  final double? iconSize;
  final double? iconPaddingRight;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool? isSelected;
  final bool? showPassword;
  final bool? obscureText;
  final bool? readOnly;
  final void Function()? onPressed;
  final void Function()? onFieldOnTap;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final int? lines;
  final Color? borderColor;
  final Widget? prefixIcon;
  final double borderRadius;
  final void Function(String)? onChanged;


  const CustomFormField({
    super.key,
    this.hint = "",
    this.fontSize = 14,
    this.contentPadding = 14,
    this.iconPaddingRight,
    this.maxLength,
    this.iconSize,
    this.onFieldOnTap,
    this.showPassword,
    this.obscureText,
    this.height,
    this.keyboardType,
    this.controller,
    this.readOnly,
    this.onPressed,
    this.isSelected,
    this.inputFormatters,
    this.textInputAction,
    this.validator,
    this.suffixIcon,
    this.lines,
    this.borderColor,
    this.prefixIcon,
    this.borderRadius = 8,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      showCursor: readOnly == true ? false : true,
      inputFormatters: inputFormatters,
      autocorrect: false,
      maxLength: maxLength,
      obscureText: obscureText ?? false,
      maxLines: lines ?? 1,
      readOnly: readOnly ?? false,
      keyboardType: keyboardType,
      cursorColor: AppColors.primaryColor,
      style: GoogleFonts.montserrat(
        color: AppColors.blackColor,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
      ),
      onTapOutside: (val){
        FocusScope.of(context).unfocus();
      },
      cursorErrorColor: Colors.red,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.mainColor.withOpacity(0.1),
        contentPadding: EdgeInsets.symmetric(
          horizontal: contentPadding,
          vertical: contentPadding,
        ),
        isDense: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? AppColors.greyColor),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? AppColors.greyColor),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? AppColors.greyColor),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        hintText: hint,
        hintStyle: GoogleFonts.montserrat(
          color: AppColors.fieldColor.withOpacity(0.7),
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
        errorStyle: GoogleFonts.montserrat(
          color: Colors.red,
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: (showPassword == true)
            ? IconButton(
          highlightColor: Colors.transparent,
          padding: EdgeInsets.only(right: iconPaddingRight ?? 10),
          icon: Icon(
            (obscureText == true)
                ? Icons.visibility_off
                : Icons.visibility,
            color: AppColors.greyColor,
            size: iconSize,
          ),
          onPressed: onPressed,
        )
            : null,
        prefixIcon: prefixIcon,
      ),
      validator: validator,
      onTap: onFieldOnTap,
      onChanged: onChanged,
    );
  }
}