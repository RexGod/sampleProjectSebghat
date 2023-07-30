import 'package:flutter/material.dart';

class homeItems extends StatelessWidget {
  final int index; // Add index parameter to access the correct icon

  homeItems({required this.index, Key? key}) : super(key: key);

  final List<IconData> vehicleIcons = [
    Icons.directions_car,
    //Icons.offroad,
    Icons.motorcycle,
    Icons.directions_bike,
    Icons.local_shipping,
    Icons.agriculture,
    Icons.construction,
    Icons.directions_boat,
    Icons.build,
    Icons.airplanemode_active,
  ];
  final List<String> vehicleNames = [
    'سواری',
    'آفرود',
    'موتورسیکلت',
    'دوچرخه',
    'کامیون و اتوبوس',
    'کشاورزی',
    'راه سازی و معدن',
    'دریایی',
    'صنعتی',
    'هوایی',
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(255, 255, 255, 0.9),
      child: GridTile(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              minRadius: 35,
              backgroundColor: Color(0xFFF57C00),
              child: Icon(
                vehicleIcons[index % vehicleIcons.length],
                size: 48.0,
                color: Colors.white,
              ),
            ),
            Text(vehicleNames[index % vehicleNames.length]),
          ],
        )),
      ),
    );
  }
}
