import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class cityWidget extends StatelessWidget {
  final String cityImage, cityName, cityDescription;
  const cityWidget({
    super.key, required this.cityImage, required this.cityName, required this.cityDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 50.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(cityImage,),
          Text(cityName,style: TextStyle(fontSize: 30,color: Colors.red, fontStyle: FontStyle.italic),),
          SizedBox(height: 5,),
          Text(cityDescription)
        ],
      ),
    );
  }
}