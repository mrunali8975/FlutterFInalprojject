import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

int value = 0;
bool btnShow = false;

class _GuestRadioButtonState extends State<GuestRadioButton> {
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
          color: (value == index) ? Colors.redAccent : Colors.black,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      borderSide:
          BorderSide(color: (value == index) ? Colors.redAccent : Colors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        CustomRadioButton("0-100", 1),
        CustomRadioButton("100-200", 2),
        CustomRadioButton("200-300", 3)
      ],
    );
  }
}

class GuestRadioButton extends StatefulWidget {
  const GuestRadioButton({Key? key}) : super(key: key);

  @override
  State<GuestRadioButton> createState() => _GuestRadioButtonState();
}

class availibility extends StatefulWidget {
  availibility({Key? key}) : super(key: key);

  @override
  State<availibility> createState() => _availibilityState();
}

class _availibilityState extends State<availibility> {
  int totalprice = 0;
  bool _showContainer = false;

  TextEditingController dateController = TextEditingController();
  bool validate = false;
  final format = DateFormat('yyyy-MM-dd');

  void initState() {
    _showContainer = false;
    super.initState();
  }

  void show() {
    setState(() {
      _showContainer = !_showContainer;
    });
  }

  @override
  Widget build(BuildContext context) {
    btnShow = dateController.text.isEmpty ? false : true;
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Tell us more about the event so we help you  to find the best prices",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.event_available_outlined,
                      color: Colors.pinkAccent,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Event Date',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                DateTimeField(
                  controller: dateController,
                  format: format,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.date_range_outlined,
                        color: Colors.pinkAccent,
                      ),
                      label: Text('Select Date'),
                      errorText: dateController.text.isEmpty
                          ? 'Enter valid date'
                          : null,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100))
                        .then((value) {
                      dateController.text = value.toString().substring(0, 10);
                      print(value.toString());
                      setState(() {
                        btnShow = value != null ? true : false;
                      });
                      print(btnShow);
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.people_outline,
                      color: Colors.pinkAccent,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Guest",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                GuestRadioButton(),
                SizedBox(
                  height: 30,
                ),
                Container(
                  // height: 50,
                  // width: 350,
                  // decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10.0),
                  //     gradient: LinearGradient(
                  //       begin: Alignment.centerLeft,
                  //       end: Alignment.centerRight,
                  //       colors: [Colors.pink, Colors.deepOrange],
                  //     )),

                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Visibility(
                          visible: btnShow,
                          child: Container(
                            height: 50,
                            width: 350,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Colors.pink, Colors.deepOrange],
                                )),
                            child: RaisedButton(

                              color: Colors.pinkAccent,

                              child: Text("See Prices",style: TextStyle(fontSize: 25,),),
                              onPressed: () {
                                if (value == 1) {
                                  totalprice = 10000;
                                } else if (value == 2) {
                                  totalprice = 20000;
                                } else {
                                  totalprice = 30000;
                                }

                                setState(() {
                                  debugPrint(totalprice.toString());
                                  show();
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Visibility(
                          visible: _showContainer,
                          child: Container(
                            child: Text('\$'+totalprice.toString(),style:TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                          ),

                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
