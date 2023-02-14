import 'dart:developer';

import 'package:botomyfluttertask/model/cartmodel.dart';
import 'package:botomyfluttertask/screens/cartpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../model/categorymodel.dart';
import '../model/productmodel.dart';
import '../model/reviewmodel.dart';
import '../sevive/providerclass.dart';
import '../widgets/rowbuilder.dart';
import '../widgets/shimmer.dart';

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
  // int? itemprice;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    Provider.of<TaskProvider>(context, listen: false).Getdish();
  }

  @override
  Widget build(BuildContext context) {
    var provid = Provider.of<TaskProvider>(context, listen: false);
    var dishlist = context.watch<TaskProvider>().dish;
    var itemCount = context.watch<TaskProvider>().itemCount;
    var cartlist = context.watch<TaskProvider>().cartitem;
    return SafeArea(
      child: Scaffold(
          drawer: Drawer(
            child: Column(
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        child: Icon(
                          Icons.person,
                          size: 100,
                        ),
                      ),
                      Text(
                        'JISHAM',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                )
              ],
            ),
          ),
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            backgroundColor: Colors.grey[300],
            elevation: 0,
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
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://www.tazzakitchen.com/wp-content/uploads/SausageHoneyPizza_KaleChilies_Guac_BrisketTacos_IMG_4548-2.jpg'),
                                        fit: BoxFit.fill),
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
                                        'Taza Kitchen',
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
                      child: !dishlist.isEmpty
                          ? ListView.builder(
                              itemCount: dishlist.length,
                              itemBuilder: (context, index) {
                                var dish = dishlist[index];

                                return Card(
                                  color: Colors.grey[300],
                                  elevation: 10,
                                  child: ExpansionTile(
                                    title: Text(
                                      '${dish.categoryname}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    children: [
                                      Container(
                                        height: 150,
                                        child: ListView.builder(
                                          itemCount: dish.product!.length,
                                          itemBuilder: (context, index) {
                                            var Provide =
                                                Provider.of<TaskProvider>(
                                                    context,
                                                    listen: false);

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
                                                                    vertical:
                                                                        3),
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    Colors.red,
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            10),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            10))),
                                                            child: Text(
                                                              "20%off",
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
                                                                color:
                                                                    Colors.red,
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
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 5)),
                                                          Text(
                                                            '(1 min qty)',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black45),
                                                          ),
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 5)),
                                                          Row(
                                                            children: [
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                '₹${(dish.product![index].kitchen_item_amount)}',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Column(
                                                      children: [
                                                        Container(
                                                          width: 80,
                                                          height: 80,
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: NetworkImage(
                                                                      '${dish.product![index].kitchenitemimage!.first.pimage}'),
                                                                  fit: BoxFit
                                                                      .cover),
                                                              color:
                                                                  Colors.black,
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
                                                              color:
                                                                  Colors.blue,
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
                                                                  onTap: () {
                                                                    if (dish.product![index]
                                                                            .count ==
                                                                        0) {
                                                                      return;
                                                                    }
                                                                    setState(
                                                                        () {
                                                                      dish
                                                                          .product![
                                                                              index]
                                                                          .count = dish
                                                                              .product![index]
                                                                              .count! -
                                                                          1;
                                                                      provid.itemCount =
                                                                          dish.product![index].count ??
                                                                              0;
                                                                    });

//
//
                                                                  }),
                                                              Text(
                                                                '${dish.product![index].count}',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              GestureDetector(
                                                                  onTap: () {
// print(dish.product!.length);
                                                                    setState(
                                                                        () {
                                                                      dish
                                                                          .product![
                                                                              index]
                                                                          .count = dish
                                                                              .product![index]
                                                                              .count! +
                                                                          1;
                                                                      provid.itemCount =
                                                                          dish.product![index].count ??
                                                                              0;

                                                                      if (cartlist
                                                                          .isEmpty) {
                                                                        Provide.cartitem.add(CartModel(
                                                                            toatalamount:
                                                                                (dish.product![index].kitchen_item_amount),
                                                                            itemCount: dish.product![index].count,
                                                                            itemId: dish.product![index].kitchen_item_id,
                                                                            itemName: dish.product![index].kitchen_item_name,
                                                                            itemPrice: dish.product![index].kitchen_item_amount));
                                                                        return;
                                                                      }
                                                                      for (int i =
                                                                              0;
                                                                          i < cartlist.length;
                                                                          i++) {
                                                                        if (cartlist[i].itemId ==
                                                                            dish.product![index].kitchen_item_id) {
                                                                          cartlist[i].itemCount = dish
                                                                              .product![index]
                                                                              .count;
                                                                        } else {
                                                                          Provide.cartitem.add(CartModel(
                                                                              toatalamount: (dish.product![index].kitchen_item_amount),
                                                                              itemCount: dish.product![index].count,
                                                                              itemId: dish.product![index].kitchen_item_id,
                                                                              itemName: dish.product![index].kitchen_item_name,
                                                                              itemPrice: dish.product![index].kitchen_item_amount));
                                                                        }
                                                                      }
                                                                    });
                                                                  },
                                                                  child: Icon(
                                                                      Icons
                                                                          .add)),
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
                            )
                          : ListView.builder(
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: Shimmers(
                                    height: 70,
                                    width: double.infinity,
                                  ),
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
                        '${provid.itemCount} Items',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Cartpage(),
                                    ));
                              },
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
