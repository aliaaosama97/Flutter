import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskawi_flutter/core/Colors.dart';
import 'package:taskawi_flutter/core/Constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration:  BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryContainer,
                AppColors.primaryColor2,
              ]),
            ),
            child:  Padding(
              padding: REdgeInsets.only(top: 60.0, left: 22),
              child: Text(
                StringsManager().signIN,
                style: TextStyle(
                    fontSize: 30.sp,
                    color: AppColors.textFormFieldColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding:  REdgeInsets.only(top: 200.0),
            child: Container(
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.r), topRight: Radius.circular(40.r)),
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              height: double.infinity,
              width: double.infinity,
              child:  Padding(
                padding: REdgeInsets.only(left: 18.0,right: 18),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       TextField(
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.check,color: AppColors.iconsColorsGray,),
                            label: Text(StringsManager().userName,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),)
                        ),
                      ),
                       TextField(
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.visibility_off,color: AppColors.iconsColorsGray,),
                            label: Text(StringsManager().password,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:Theme.of(context).colorScheme.onBackground,
                            ),)
                        ),
                      ),
                      SizedBox(height: 20.h,),
                       Align(
                        alignment: Alignment.centerRight,
                        child: Text(StringsManager().forgetUrPass,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.sp,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),),
                      ),
                      SizedBox(height: 70.h,),
                      Container(
                        height: 55.h,
                        width: 300.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient:  LinearGradient(
                              colors: [
                                Theme.of(context).colorScheme.primaryContainer,
                                AppColors.primaryColor2,
                              ]
                          ),
                        ),
                        child:  TextButton(onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                            child: Text(StringsManager().signInButton,style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                color: AppColors.textFormFieldColor
                            ),),),

                      ),
                      SizedBox(height: 150.h,),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
