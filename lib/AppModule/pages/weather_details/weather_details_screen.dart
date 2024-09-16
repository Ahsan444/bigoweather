import 'package:flutter/material.dart';
import 'package:weather_app/AppModule/api/model/weather_model.dart';
import 'package:weather_app/AppModule/utils/app_colors.dart';
import 'package:weather_app/AppModule/utils/app_images.dart';
import 'package:weather_app/AppModule/utils/app_text.dart';

class WeatherDetailsScreen extends StatelessWidget {
  final List<CurrentConditions>? days;
  const WeatherDetailsScreen({super.key,this.days});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.darkBlue,
        title:  const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(text:' 7 Days',fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.whiteColor,)
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Expanded(child: ListView(
              shrinkWrap: true,

              children: [
                ListView.builder(
                  itemCount: days?.take(7).length,
                  shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context,int index){
                  return ListTile(
                    leading: AppText(text:'${days![index].datetime}',color: AppColors.whiteColor.withOpacity(0.8),fontSize: 16,),
                    title: Row(
                      children: [
                        SizedBox(
                          width: 35,
                          height: 35,
                          child:days![index].conditions?.name == 'CLEAR'? Image.asset(AppImages.cloudsImage) : days![index].conditions?.name == 'PARTIALLY_CLOUDY' ?
                          Image.asset(AppImages.heavyRainImage) : days![index].conditions?.name == 'RAIN' ? Image.asset(AppImages.thunderIcon) : Image.asset(AppImages.cloudsImage),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: AppText(text: '${days![index].conditions?.name}',color: AppColors.whiteColor.withOpacity(0.8),fontSize: 12,),),
                      ],
                    ),
                    horizontalTitleGap: 30,
                    trailing: AppText(text: '${'${days![index].temp}'}°',color: AppColors.whiteColor.withOpacity(0.8),fontSize: 16,),
                  );
                },
                ),
              ],
            ))
          ],
        ),
      )
    );
  }
}
