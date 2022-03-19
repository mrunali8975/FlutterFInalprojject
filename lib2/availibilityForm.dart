import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class _GuestRadioButtonState extends State<GuestRadioButton> {
  int value = 0;

  Widget CustomRadioButton(String text, int index) {
    return OutlineButton(
      onPressed: () {
        setState(() {
          value = index;
        });
      },
      child: Text(
        text,
        style: TextStyle(
          color: (value == index) ? Colors.green : Colors.black,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      borderSide:
          BorderSide(color: (value == index) ? Colors.green : Colors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        CustomRadioButton("Single", 1),
        CustomRadioButton("Married", 2),
        CustomRadioButton("Other", 3)
      ],
    );
  }
}

class GuestRadioButton extends StatefulWidget {
  const GuestRadioButton({Key? key}) : super(key: key);

  @override
  State<GuestRadioButton> createState() => _GuestRadioButtonState();
}

class BasicDateField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final format = DateFormat('yyyy-MM-dd');

    return Column(children: <Widget>[
      SizedBox(
        height: 10,
      ),
      DateTimeField(
        format: format,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.date_range_outlined,
              color: Colors.pinkAccent,
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    ]);
  }
}

class availibility extends StatefulWidget {
  availibility({Key? key}) : super(key: key);

  @override
  State<availibility> createState() => _availibilityState();
}

class _availibilityState extends State<availibility> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actionsIconTheme: IconThemeData(color: Colors.pinkAccent),
        leading: Icon(
          Icons.menu,
          color: Colors.pinkAccent,
        ),
        title: TextButton(
            onPressed: () {},
            child: Text(
              "BanquetHall",
              style: TextStyle(fontSize: 20, color: Colors.pinkAccent),
            )),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_outlined))
        ],
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                  "Tell us more about the event so we help you  to find the best prices"),
              SizedBox(
                height: 10,
              ),
              Text(
                'Event Date',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              BasicDateField(),
              SizedBox(
                height: 20,
              ),
              GuestRadioButton()
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.home_outlined,
                color: Colors.pinkAccent,
                size: 40,
              ),
              Icon(
                Icons.account_circle_outlined,
                color: Colors.pinkAccent,
                size: 40,
              ),
              Icon(
                Icons.bookmark_border_outlined,
                color: Colors.pinkAccent,
                size: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
