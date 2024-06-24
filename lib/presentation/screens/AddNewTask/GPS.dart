import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:taskawi_flutter/core/Colors.dart';
import '../../../core/Methods.dart';




class GPS extends StatefulWidget {
  final double font;
  final bool check_Edit_or_Add;
  final bool gpsData;
  final void Function(bool state)? gpsState;
  const GPS({super.key,required this.font, required this.check_Edit_or_Add,required this.gpsData,this.gpsState});

  @override
  State<GPS> createState() => _GPSState();
}

class _GPSState extends State<GPS> {

  //location ON or OFF
  bool Location = false;
  //picked a start/end location, icon change
  bool locationIconStartFlag = false;
  bool locationIconEndFlag = false;
  var locationIconStartIndex = 0;
  var locationIconEndIndex = 0;
  var loctionIcons = [Icons.location_off, Icons.location_on];

  List<DateTime?> _dates=[];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(
                top: 30, left: 20.0, right: 20.0
            ),
            child: Row(
              children: [
                LiteRollingSwitch(
                  enabel: widget.check_Edit_or_Add,
                  value: widget.gpsData,
                  width: 150,
                  textOn: 'GPS ON',
                  textOnColor: AppColors.textFormFieldColor,
                  textOff: 'GPS OFF',
                  colorOn: AppColors.gpsOnColor,
                  colorOff: Theme.of(context).colorScheme.secondary,
                  iconOn: Icons.gps_fixed_outlined,
                  iconOff: Icons.gps_off_outlined,
                  animationDuration: const Duration(milliseconds: 300),
                  onChanged: (bool state) {
                    if(widget.check_Edit_or_Add == true) {
                      setState(() {
                        if(widget.gpsState!= null)
                          {
                            widget.gpsState!(state);
                          }

                        Location = state;
                        //state == false && locationIconStartFlag == true ? locationIconStartIndex = 0 : locationIconStartIndex = 1;
                        if (state == false && locationIconStartFlag == true) {
                          locationIconStartFlag == false;
                          locationIconStartIndex = 0;
                        }
                        if (state == false && locationIconEndFlag == true) {
                          locationIconEndFlag == false;
                          locationIconEndIndex = 0;
                        }
                      });
                    }
                    print('turned ${(state) ? 'on' : 'off'}');
                  },
                  onDoubleTap: () {},
                  onSwipe: () {},
                  onTap: () {},
                ),
              ],
            )
        ),
        Visibility(
          visible: Location,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(
                      top: 20, left: 0.0, right: 0.0
                  ),
                  child: ElevatedButton(onPressed: () {
                    //go to Google Maps
                    if(widget.check_Edit_or_Add == true) {
                      GMap(context);


                      setState(() {
                        locationIconStartFlag = true;
                        locationIconStartIndex = 1;
                      });
                    }
                
                  },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(loctionIcons[locationIconStartIndex],color: Theme.of(context).colorScheme.onBackground,),
                          Flexible(
                            child: Text('START ZONE',
                              style: TextStyle(
                                  fontSize: widget.font,
                                color: Theme.of(context).colorScheme.onBackground,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ),
                ),
              ),
              SizedBox(width: 10.w,),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(
                      top: 20, left: 0.0, right: 0.0
                  ),
                  child: ElevatedButton(onPressed: (){

                    if(widget.check_Edit_or_Add == true) {
                      setState(() {
                        locationIconEndFlag = true;
                        locationIconEndIndex = 1;
                      });
                    }
                  },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(loctionIcons[locationIconEndIndex],color: Theme.of(context).colorScheme.onBackground,),
                          Flexible(
                            child: Text('END ZONE',
                              style: TextStyle(
                                fontSize: widget.font,
                                color: Theme.of(context).colorScheme.onBackground,),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ),
            ],
          ),

        ),
      ],
    );
  }

}
