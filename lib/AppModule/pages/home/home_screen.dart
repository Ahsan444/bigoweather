import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/AppModule/pages/home/widgets/header_widget.dart';
import 'package:weather_app/AppModule/pages/weather_details/weather_details_screen.dart';
import 'package:weather_app/AppModule/provider/home/home_provider.dart';
import 'package:weather_app/AppModule/utils/app_colors.dart';
import 'package:weather_app/AppModule/utils/app_images.dart';
import 'package:weather_app/AppModule/utils/app_text.dart';
import 'package:weather_app/AppModule/utils/app_utils.dart';


class HomeScreen extends StatefulWidget {
  final String location;
  const HomeScreen({super.key,required this.location});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeProvider homeProvider;
  @override
  void initState() {
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_)async {
      homeProvider.getCurrentDayDateMonth;
     await homeProvider.getWeatherData(widget.location,context);

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: SafeArea(
        child: Consumer<HomeProvider>(
  builder: (context, provider, child) {
      return  provider.weatherModel.latitude == null  ? AppUtils.showLoading(context): Column(
          children: [
            HeaderWidget(
              currentLocation: provider.weatherModel.address,
              temp: '${provider.weatherModel.currentConditions?.temp}',
              weatherCondition: provider.weatherModel.currentConditions?.conditions?.name,
              day:  provider.getCurrentDayDateMonth() =='' ? '':provider.getCurrentDayDateMonth(),
              widget:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CurrentWeatherWidget(title: '${provider.weatherModel.currentConditions?.windspeed} km/h',),
                  CurrentWeatherWidget(title: '${provider.weatherModel.currentConditions?.dew}',
                  subTitle: 'Humidity',
                  imgPath: AppImages.dropSvg,width: 14,height: 14,),
                  CurrentWeatherWidget(
                    title: '${provider.weatherModel.currentConditions?.cloudcover}',
                    subTitle: 'Chance of rain',
                    imgPath: AppImages.chanceOfRain,width: 14,height: 14,
                  ),
                ],
              ),
            ),
            Expanded(child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: ListTile(
                    leading: const Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 14),
                      child: AppText(text: 'Today',color: AppColors.whiteColor,fontSize: 18,fontWeight: FontWeight.w700,),
                    ),
                    contentPadding: EdgeInsets.zero,
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AppText(text: '7 days',color: AppColors.whiteColor.withOpacity(0.5), fontSize: 14,fontWeight: FontWeight.w500,),
                          IconButton(onPressed: (){
                          }, icon: const Icon(Icons.arrow_forward_ios,color: AppColors.whiteColor,size: 15,),padding: EdgeInsets.zero,)
                        ],
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> WeatherDetailsScreen(days: provider.weatherModel.days,)));
                    },
                    splashColor: AppColors.whiteColor.withOpacity(0.1),
                  ),
                ),
              ],),),
          ],
        );
  },
),
      ),
    );
  }

}

