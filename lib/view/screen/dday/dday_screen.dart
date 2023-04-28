import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DdayScreen extends StatefulWidget {
  static String get routeName => 'dday';

  const DdayScreen({Key? key}) : super(key: key);

  @override
  State<DdayScreen> createState() => _DdayScreenState();
}

class _DdayScreenState extends State<DdayScreen> {
  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100], // default 500
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: const Text('D-day'),
      ),
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              _TopPart(
                selectedDate: selectedDate,
                onPressed: onHeartPressed,
              ),
              const _BottomPart(),
            ],
          ),
        ),
      ),
    );
  }

  void onHeartPressed() {
    final DateTime now = DateTime.now();

    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 300.0,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: selectedDate,
              maximumDate: DateTime(now.year, now.month, now.day),
              onDateTimeChanged: (DateTime date) {
                setState(() {
                  selectedDate = date;
                });
              },
            ),
          ),
        );
      },
    );
  }
}

class _TopPart extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onPressed;

  const _TopPart({
    required this.selectedDate,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final now = DateTime.now();

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'U&I',
            style: textTheme.displayLarge!.copyWith(
              color: Colors.white,
            ),
          ),
          Column(
            children: [
              Text(
                '우리 처음 만난 날',
                style: textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                ),
              ),
              Text(
                '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
                style: textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: onPressed,
            iconSize: 60.0,
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          Text(
            'D+${DateTime(
                  now.year,
                  now.month,
                  now.day,
                ).difference(selectedDate).inDays + 1}',
            style: textTheme.displayMedium!.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
        'asset/img/logo_flutter.png',
      ),
    );
  }
}
