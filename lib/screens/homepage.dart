import 'dart:developer';

import 'package:flutter/material.dart';

import '../model/categorymodel.dart';
import '../model/reviewmodel.dart';
import '../sevive/api.dart';
import '../widgets/rowbuilder.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Headsectionmodeil> Head = <Headsectionmodeil>[
    Headsectionmodeil(click: () {}, txt: 'Wall', icon: Icons.wallet),
    Headsectionmodeil(
        click: () {},
        color: Colors.orange,
        txt: 'Menu',
        icon: Icons.restaurant_menu_rounded),
    Headsectionmodeil(
        click: () {}, txt: 'Videos', icon: Icons.videocam_outlined),
    Headsectionmodeil(
        click: () {}, txt: 'Reviews', icon: Icons.reviews_outlined),
    Headsectionmodeil(click: () {}, txt: 'Blog', icon: Icons.message),
  ];
  Api v = new Api();
  @override
  // void initState() {
  //   // TODO: implement initState
  //   v.Getdish();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            backgroundColor: Colors.grey[300],
            elevation: 0,
            leading: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            title: Card(
              elevation: 3,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search Dish',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black54,
                    ),
                    contentPadding: EdgeInsets.only(left: 10, right: 10),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none)),
              ),
            ),
            actions: [
              Icon(
                Icons.share,
                color: Colors.black,
              )
            ],
          ),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 70),
                child: Column(
                  children: [
                    Card(
                      elevation: 0,
                      color: Colors.grey[300],
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    // image: DecorationImage(image: AssetImage('images/6abdfab03c8818fbeacbc1cd29aed18a.jpg'),fit: BoxFit.fill),
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Taza Kithen',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Text(
                                          'From Peyad',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Text(
                                          'Member Since Aug 6 2021',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 13),
                                        ),
                                      ),
                                      Text(
                                        'FSSAI NO :212123142556',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 13),
                                      ),
                                      Text(
                                        'Know more',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.black,
                                            shape: StadiumBorder()),
                                        onPressed: () {},
                                        icon: Icon(Icons.person),
                                        label: Text('Follow')),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '4.6',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Card(
                            elevation: 4,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            child: Container(
                              width: double.infinity,
                              height: 40,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: TextButton(
                                          onPressed: () {},
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text('14'),
                                              Text(
                                                'Post',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )
                                            ],
                                          )),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: TextButton(
                                          onPressed: () {},
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text('37'),
                                              Text(
                                                'Followers',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )
                                            ],
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: RowBulider(
                          itemCount: Head.length,
                          itemBuilder: (context, index) {
                            var data = Head[index];
                            return GestureDetector(
                              onTap: data.click,
                              child: Container(
                                width: 80,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: data.color,
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(data.icon),
                                      Text(
                                        '${data.txt}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 5,
                      height: 20,
                    ),
                    Expanded(
                      child: FutureBuilder<List<CategoryModel>>(
                        future: v.Getdish(),
                        builder: (context, snapshot) {
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              var dish = snapshot.data![index];

                              return Card(
                                color: Colors.grey[300],
                                elevation: 10,
                                child: ExpansionTile(
                                  title: Text('${dish.categoryname}'),
                                  children: [
                                    Container(
                                      height: 150,
                                      child: ListView.builder(
                                        itemCount: dish.product!.length,
                                        itemBuilder: (context, index) {
                                          log("abc +${dish.product![index].kitchenitemimage!.first.pimage}");
                                          return Card(

                                            color: Colors.grey[350],
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8,
                                                  top: 8,
                                                  left: 8,
                                                  bottom: 15),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10,
                                                                  vertical: 3),
                                                          decoration: BoxDecoration(
                                                              color: Colors.red,
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          10),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          10))),
                                                          child: Text(
                                                            "20%off }",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .crop_square_outlined,
                                                              color: Colors.red,
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                '${dish.product![index].kitchen_item_name}',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 5)),
                                                        Text(
                                                          '(1 min qty)',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black45),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 5)),
                                                        Text(
                                                          'RS 200',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Column(
                                                    children: [
                                                      Container(
                                                        width: 80,
                                                        height: 80,
                                                        decoration:
                                                            BoxDecoration(
                                                                image: DecorationImage(image: NetworkImage('${dish.product![index].kitchenitemimage!.first.pimage}'),fit: BoxFit.fill),
                                                                color: Colors
                                                                    .black,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Container(
                                                        width: 100,
                                                        height: 30,
                                                        decoration: BoxDecoration(
                                                            color: Colors.blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            GestureDetector(
                                                                child: Icon(Icons
                                                                    .minimize),
                                                                onTap: () {}),
                                                            Text(
                                                              '1',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            GestureDetector(
                                                                onTap: () {},
                                                                child: Icon(
                                                                    Icons.add)),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  width: double.infinity,
                  height: 70,
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '1 Items',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text(
                                    'Add to Cart',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Icon(
                                    Icons.add_shopping_cart,
                                    color: Colors.black,
                                  ),
                                ],
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
