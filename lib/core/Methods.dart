import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';


//add attached images
//add attached file

//Calender popup menu
Future<List<DateTime?>?>chooseDate(List<DateTime?> _dates, BuildContext context) async {

  var results = await showCalendarDatePicker2Dialog(
    context: context,
    config: CalendarDatePicker2WithActionButtonsConfig(),
    dialogSize: const Size(325, 400),
    value: _dates,
    borderRadius: BorderRadius.circular(15),
  );
  return results;
}
//Google Maps
GMap(BuildContext context)
{
  //Google Maps
  String address = "null";
  String autocompletePlace = "null";
  var YOUR_API_KEY = 'AIzaSyCtiM-Uk-qR3AOlm-doqRqjqz7oMx5iiGI';
  Prediction? initialValue;

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return MapLocationPicker(
          apiKey: YOUR_API_KEY,
          popOnNextButtonTaped: true,
          currentLatLng: const LatLng(29.146727, 76.464895),
          onNext: (GeocodingResult? result) {
            if (result != null) {
              useState(() {
                address = result.formattedAddress ?? "";
              });
            }
          },
          onSuggestionSelected: (PlacesDetailsResponse? result) {
            if (result != null) {
              useState(() {
                autocompletePlace =
                    result.result.formattedAddress ?? "";
              });
            }
          },
        );
      },
    ),
  );
}

//toast methods
toastMessage(String tittle_text, String body_text, BuildContext context)
{
  MotionToast.info(
    title:  Text("$tittle_text ", style: TextStyle(fontWeight: FontWeight.bold),),
    description:  Text("$body_text"),
    position: MotionToastPosition.top,
    animationType:  AnimationType.fromLeft,
  ).show(context);
}

//DropDown colored box for priority & Task statues
enum ColorLabel {
  red('High priority', Colors.red),
  yellow('Medium priority', Colors.amber),
  green('Low priority', Colors.green);

  const ColorLabel(this.label, this.color);
  final String label;
  final Color color;
}

enum ColorLabelProgress {
  red('Not Started', Colors.red),
  yellow('In Progress', Colors.amber),
  green('Started', Colors.green),
  blue('Completed', Colors.blue);

  const ColorLabelProgress(this.label, this.color);
  final String label;
  final Color color;
}