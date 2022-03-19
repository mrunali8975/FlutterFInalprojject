import 'dart:async';

import 'package:weddinghall/database.dart';
import 'package:weddinghall/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'viewPage.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<Map> data = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    MyDataBase.selectData().then((value) {
      Timer(Duration(seconds: 3), () {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String name = '';
    String desc = '';
    Function()? onTap;
    data = [
      {
        'name': '7 Vachann, Wardhaman Nagar, Nagpur',
        'desc':
            '7 Vachann Lawn, 40019, Bhandara Road, Beside Jain Temple Honey Street, Wardhaman Nagar Colony, Nagpur',
        'image':
            'https://m.weddingz.in/wedz-img/images/5369ce1d23db9ece1b771528d40e476c/roshal-garden-bhosari-pune.jpg?imwidth=300',
        'star': 5,
        'ontap': () {
          print("Helllo/-");
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => viewpage(),
              ));
        }
      },
      {
        'name': 'Crystal Resorts, Zirakpur, Chandigarh',
        'desc':
            '7 Vachann Lawn, 40019, Bhandara Road, Beside Jain Temple Honey Street, Wardhaman Nagar Colony, Nagpur',
        'image':
            'https://m.weddingz.in/wedz-img/images/8d4f657f22351d679451520ad341c675/silky-resorts-zirakpur-chandigarh.jpg?imwidth=300',
        'star': 4,
        'ontap': () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => viewpage(),
              ));
        }
      },
      {
        'name': 'Glass Palace Lawns And Banquets',
        'desc':
            '7 Vachann Lawn, 40019, Bhandara Road, Beside Jain Temple Honey Street, Wardhaman Nagar Colony, Nagpur',
        'image':
            'https://m.weddingz.in/wedz-img/images/c7f27ac017d88c3dc379d5f9400fa12c/the-wedding-resort-zirakpur-chandigarh.jpg?imwidth=300',
        'star': 3.5,
        'ontap': () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => viewpage(),
              ));
        }
      },
      {
        'name': 'Kalsi Farms, Morinda, Chandigarh',
        'desc':
            '7 Vachann Lawn, 40019, Bhandara Road, Beside Jain Temple Honey Street, Wardhaman Nagar Colony, Nagpur',
        'image':
            'https://m.weddingz.in/wedz-img/images/09622acb9f9508975648edd835ff5708/kalsi-farms-morinda-chandigarh.jpg?imwidth=300',
        'star': 4.5,
        'ontap': () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => viewpage(),
          //     ));
        },
        'images': [
          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
          'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
          'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
          'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
        ],
      },
      {
        'name': 'Occasions Lawns, Baner, Pune',
        'desc':
            '7 Vachann Lawn, 40019, Bhandara Road, Beside Jain Temple Honey Street, Wardhaman Nagar Colony, Nagpur',
        'image':
            'https://m.weddingz.in/wedz-img/images/fd213f2871fb001a1b4330094ec4bd73/occasions-lawns-baner-pune-1.jpg?imwidth=300',
        'star': 2.5,
        'images': [
          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
          'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
          'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
          'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
        ],
        'ontap': () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => viewpage(),
          //     ));
        },
      },
      {
        'name': 'Occasions Lawns, Baner, Pune',
        'desc':
            '7 Vachann Lawn, 40019, Bhandara Road, Beside Jain Temple Honey Street, Wardhaman Nagar Colony, Nagpur',
        'image':
            'https://m.weddingz.in/wedz-img/images/afb8234a1a4bcd5972fc1b3cd733666b/oberoi-palace-kamptee-road-nagpur.jpg?imwidth=300',
        'star': 2.5,
        'ontap': () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => viewpage(),
          //     ));
        }
      },
      {
        'name': 'Oberoi Palace, Kamptee Road, Nagpur',
        'desc':
            '7 Vachann Lawn, 40019, Bhandara Road, Beside Jain Temple Honey Street, Wardhaman Nagar Colony, Nagpur',
        'image':
            'https://m.weddingz.in/wedz-img/images/3fc0d62ef6872d2f586574d1b5b2a3b4/hyatt-regency-industrial-area-phase-i-chandigarh.jpg?imwidth=300',
        'star': 2.5,
        'ontap': () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => viewpage(),
          //     ));
        }
      },
      {
        'name': 'Oberoi Palace, Kamptee Road, Nagpur',
        'desc':
            '7 Vachann Lawn, 40019, Bhandara Road, Beside Jain Temple Honey Street, Wardhaman Nagar Colony, Nagpur',
        'image':
            'https://m.weddingz.in/wedz-img/images/3fc0d62ef6872d2f586574d1b5b2a3b4/hyatt-regency-industrial-area-phase-i-chandigarh.jpg?imwidth=300',
        'star': 2.5,
        'ontap': () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => viewpage(),
          //     ));
        }
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actionsIconTheme: IconThemeData(color: Colors.pinkAccent),
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
        child: hallitem(),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home_outlined,
                  size: 40,
                ),
                color: Colors.pinkAccent,
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => home()));
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.account_circle_outlined,
                  size: 40,
                  color: Colors.pinkAccent,
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => home()));
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.bookmark_border_outlined,
                  size: 40,
                  color: Colors.pinkAccent,
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => home()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget hallitem() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: MyDataBase.data.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => viewpage(
                        name: MyDataBase.data[index]['name'],
                        imageadd: data[index]['image'],
                        address: MyDataBase.data[index]['address'],
                        about: MyDataBase.data[index]['about'],
                      ),
                    ));
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image(
                        image: NetworkImage(
                      data[index]['image'],
                    )),
                    Text(
                      MyDataBase.data[index]['name'],
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    RatingBar.builder(
                      initialRating:
                          double.parse(data[index]['star'].toString()),
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemSize: 15,
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
