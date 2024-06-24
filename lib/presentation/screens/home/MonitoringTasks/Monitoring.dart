import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskawi_flutter/core/Colors.dart';

class Monitoring extends StatefulWidget {
  const Monitoring({super.key});

  @override
  State<Monitoring> createState() => _MonitoringState();
}

class _MonitoringState extends State<Monitoring> {

  List<String> searchResults = [];
  List<String> dataList = [
    'Apple',
    'Banana',
    'Orange',
    'Mango',
    'Grapes',
    'Strawberry',
    'Watermelon',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  REdgeInsets.all(8.0),
          child: TextField(
            onChanged: (query) {
              onSearchTextChanged(query);
            },
            decoration: InputDecoration(
              suffixIcon: InkWell(
                child: Icon(Icons.search),
              ),
              hintText: 'Search...',
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(searchResults[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  void onSearchTextChanged(String query) {
    setState(() {
      searchResults = dataList
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
}
