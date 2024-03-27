import 'package:flutter/material.dart';
import 'package:rakna_graduation_project/config/widgets/constants.dart';
import 'package:rakna_graduation_project/config/widgets/custom_login_sginup_button.dart';
import 'package:table_calendar/table_calendar.dart';

class Reservation extends StatefulWidget {
  const Reservation({super.key});
  static String routName = 'Reservation';
  @override
  // ignore: library_private_types_in_public_api
  _ReservationState createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  TimeOfDay _selectedTime1 = TimeOfDay.now();
  TimeOfDay _selectedTime2 = TimeOfDay.now();
  Duration _difference = Duration.zero;
  double hourlyRate = 10.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      // appBar: const MyAppBar(
      //   app_bar_name: "Reservation Parking Details",
      //   center_Title: false,
      //   font_Size: 20,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Select Date',
                    style: TextStyle(
                      color: kPrimaryColorText,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 232, 227, 227),
                ),
                child: TableCalendar(
                  rowHeight: 35,
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'Start Hour',
                    style: TextStyle(
                      color: kPrimaryColorText,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 120,
                  ),
                  Text(
                    'End Hour',
                    style: TextStyle(
                      color: kPrimaryColorText,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            final TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                              initialEntryMode: TimePickerEntryMode.dial,
                            );
                            if (pickedTime != null) {
                              setState(() {
                                _selectedTime1 = pickedTime;
                                _calculateDifference(); // Update difference on selection change
                              });
                            }
                          },
                          child: Text(
                            _selectedTime1.format(context),
                            style: const TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      Container(
                        height: 50,
                        width: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            final TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                              initialEntryMode: TimePickerEntryMode.dial,
                            );
                            if (pickedTime != null) {
                              setState(() {
                                _selectedTime2 = pickedTime;
                                _calculateDifference(); // Update difference on selection change
                              });
                            }
                          },
                          child: Text(
                            _selectedTime2.format(context),
                            style: const TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                          color: kPrimaryColorText,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '${(_difference.inHours * hourlyRate).toStringAsFixed(2)} EGP',
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      const Text(
                        '/4 hours',
                        style: TextStyle(
                            color: kPrimaryColorText,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              text: "CONFIRM",
              isEnabled: true,
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }

  void _calculateDifference() {
    int totalMinutesDiff;

    totalMinutesDiff = (_selectedTime2.hour * 60 + _selectedTime2.minute) -
        (_selectedTime1.hour * 60 + _selectedTime1.minute);

    // Ensure positive difference (missing minutes)
    totalMinutesDiff = totalMinutesDiff.abs();

    // Update state variables
    _difference = Duration(minutes: totalMinutesDiff);
    double _totalCost = _difference.inHours *
        hourlyRate; // Define and calculate total cost here
    // ... (update other state variables if needed)

    setState(() {});
  }
}
