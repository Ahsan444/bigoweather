import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/AppModule/utils/app_colors.dart';
import 'package:weather_app/AppModule/utils/app_images.dart';
import 'package:weather_app/AppModule/utils/app_text.dart';

class HeaderWidget extends StatelessWidget {
  final String? currentLocation,temp,weatherCondition,day,imagePath;
  final Widget? widget;
  const HeaderWidget({super.key,this.weatherCondition,this.currentLocation,this.temp,this.day,this.imagePath,this.widget});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          colors: [
            AppColors.mainColor,
            AppColors.swatchColor4,
          ],
        ),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.whiteColor),
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(5),
                child: const Icon(Icons.grid_view_rounded,color: AppColors.whiteColor,size: 15,),
              ),
              Row(
                children: [
                  SvgPicture.asset(AppImages.locationPin,color: AppColors.whiteColor,),
                   AppText(text: currentLocation?? 'Location',color: AppColors.whiteColor,fontWeight: FontWeight.w600,fontSize: 21,),
                ],
              ),
              const Icon(Icons.more_vert,color: AppColors.whiteColor,),

            ],),
          Padding(padding: const EdgeInsets.only(top: 4,bottom: 0),
            child: SizedBox(
                width: size.width * 0.8,
                height: size.height * 0.2,
                child: SvgPicture.asset(imagePath??AppImages.chanceOfRain,colorFilter: const ColorFilter.mode(AppColors.whiteColor, BlendMode.srcIn),)),),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               AppText(text:temp?? '21',fontSize: 64,fontWeight: FontWeight.bold,color: AppColors.whiteColor,),
              Container(
                width: 10,
                height:10,
                margin: EdgeInsets.only(top: 20.h),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.whiteColor.withOpacity(0.5),width: 2),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          AppText(text: weatherCondition??'ThunderStorm',color: AppColors.whiteColor,fontWeight: FontWeight.normal,fontSize: 21,),
          AppText(text:day?? 'Monday, 17 May',color: AppColors.whiteColor.withOpacity(0.5),fontWeight: FontWeight.normal,fontSize: 14,),
          Padding(padding: const EdgeInsets.symmetric(vertical: 10),
            child: Divider(
              color: AppColors.whiteColor.withOpacity(0.2),
              thickness: 1,
            ),),
          widget?? const SizedBox.shrink(),

        ],
      ),
    );
  }
}

class CurrentWeatherWidget extends StatelessWidget {
  final String? title,subTitle,imgPath;
  final double? width , height;
  const CurrentWeatherWidget({super.key,this.title,this.subTitle,this.imgPath,this.width,this.height});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SvgPicture.asset(imgPath?? AppImages.windSvg, colorFilter: const ColorFilter.mode(AppColors.whiteColor, BlendMode.srcIn),
      width: width,height: height,),
       Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: AppText(text:title?? '13 km/h',color: AppColors.whiteColor,fontWeight: FontWeight.normal,fontSize: 12,),
      ),
      AppText(text:subTitle?? 'Wind',color: AppColors.whiteColor.withOpacity(0.4),fontWeight: FontWeight.normal,fontSize: 10,),
    ],);
  }
}
