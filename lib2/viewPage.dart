import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:weddinghall/availibilityForm.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
class viewpage extends StatefulWidget {
  viewpage(
      {Key? key,
      this.name = '',
      this.desc = '',
      this.imageadd = '',
      this.address = '',
      this.about = ''})
      : super(key: key);
  String desc = '';
  String name = '';
  String imageadd = '';
  String address = '';
  String about = '';

  @override
  State<viewpage> createState() => _viewpageState();
}

class _viewpageState extends State<viewpage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(widget.imageadd),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  widget.name,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(widget.address,style: TextStyle(fontSize: 18),),
              ),
              TextButton(onPressed: () {}, child: Text("View On Map",style: TextStyle(fontSize: 17),)),
              ListTile(
                title: Text(
                  "About Venue",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                subtitle: RichText(
                  text: TextSpan(
                      text: widget.about,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: '..Read More',
                            style: TextStyle(color: Colors.blueAccent),
                            recognizer: TapGestureRecognizer()..onTap = () {})
                      ]),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) =>
                        availibility()

                    ));
                  },
                  child: Container(
                      height: 50,
                      width: 200,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(border: Border.all()),
                      child: Text(
                        "Check Availibility",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      )))
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
