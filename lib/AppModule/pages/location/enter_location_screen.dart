import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/AppModule/pages/home/home_screen.dart';
import 'package:weather_app/AppModule/provider/home/home_provider.dart';
import 'package:weather_app/AppModule/utils/app_colors.dart';
import 'package:weather_app/AppModule/utils/app_text.dart';
import 'package:weather_app/AppModule/utils/app_utils.dart';
import 'package:weather_app/AppModule/widgets/custom_field.dart';

class EnterLocationScreen extends StatefulWidget {
  const EnterLocationScreen({super.key});

  @override
  State<EnterLocationScreen> createState() => _EnterLocationScreenState();
}

class _EnterLocationScreenState extends State<EnterLocationScreen> {
  final TextEditingController locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgcolor,
      appBar: AppBar(
        title: const AppText(text:'Enter Location',fontSize: 14,fontWeight: FontWeight.w600,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: AppText(text: 'Please enter your location\nto check weather',fontSize: 16,fontWeight: FontWeight.w600,),
              ),
            ),
            Center(
              child: CustomFormField(
                borderColor: Colors.transparent,
                controller: locationController,
                hint: 'Enter Location',
                fontSize: 12,
                textInputAction: TextInputAction.next,
                readOnly: false,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if(locationController.text.isNotEmpty){
                    var homePro= context.read<HomeProvider>();
                    homePro.weatherModel.latitude = null;
                    Navigator.push(context,MaterialPageRoute(builder: (context) =>  HomeScreen(location: locationController.text.trim())));
                  }else{
                    AppUtils().showToast('Please enter location',color: Colors.red);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const AppText(text:'Submit',color: AppColors.whiteColor,fontWeight: FontWeight.w600,fontSize: 14,),
              ),
            )
          ],
        ),
      )
    );
  }
}
