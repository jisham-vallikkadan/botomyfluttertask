import 'dart:async';

import 'package:botomyfluttertask/screens/homepage.dart';
import 'package:botomyfluttertask/sevive/providerclass.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/columbulder.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({Key? key}) : super(key: key);

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  @override
  Widget build(BuildContext context) {
    var Cartitem = context.watch<TaskProvider>().cartitem;
    int itemtotel = 0;
    double taxandcharge=0;
    double Grandtotal=0;
    for(int i = 0; i < Cartitem.length ; i++) {
      itemtotel = (Cartitem[i].itemPrice * (Cartitem[i].itemCount??0)) + itemtotel;
      taxandcharge=itemtotel*(0.05);
      Grandtotal=itemtotel+taxandcharge;
      print(itemtotel);
    }
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        title: Center(
          child: Text(
            'My Cart',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  primary: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  side: BorderSide(color: Colors.black)),
              onPressed: () {
                Provider.of<TaskProvider>(context, listen: false)
                    .clearcart(Cartitem[0]);
              },
              label: Text(
                'Clear Cart',
                style: TextStyle(color: Colors.black54),
              ),
              icon: Icon(
                Icons.delete,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              thickness: 10,
              color: Colors.grey,
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    child: ColumBulider(
                      itemCount: Cartitem!.length,
                      itemBuilder: (context, index) {
                        // amount = Cartitem[index].itemPrice;
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.crop_square,
                                color: Colors.red,
                              ),
                              Container(
                                width: 140,
                                // color: Colors.blue,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2),
                                      child: Text(
                                        '${Cartitem[index].itemName}',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Text(
                                      '₹ ${Cartitem[index].itemPrice}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 110,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.black54)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                        child: Icon(Icons.minimize),
                                        onTap: () {
                                          setState(() {
                                            Cartitem[index].itemCount =
                                                Cartitem[index].itemCount! - 1;

                                            Cartitem[index].toatalamount =
                                                Cartitem[index].itemCount! *
                                                    Cartitem[index].itemPrice;

                                            print(Cartitem[index].toatalamount);
                                          });
                                        }),
                                    Text(
                                      '${Cartitem[index].itemCount}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            Cartitem[index].itemCount =
                                                Cartitem[index].itemCount! + 1;

                                            Cartitem[index].toatalamount =
                                                Cartitem[index].itemCount! *
                                                    Cartitem[index].itemPrice;

                                            print(Cartitem[index].toatalamount);
                                          });
                                        },
                                        child: Icon(Icons.add)),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5, left: 7),
                                child: Text(
                                  '₹${Cartitem[index].toatalamount}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black54)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Bill Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black54),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Item Total'),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Text(
                                  '₹ ${itemtotel == null ? 0 : itemtotel}.00',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Taxes & charges'),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Text(
                                  '₹${taxandcharge}',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'GRAND TOTAL',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Text(
                                  '₹ ${Grandtotal}',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => Homepage(),
                      //
                      //
                      //     ));
                      if (Cartitem.length > 0) {
                        Alert(
                          context: context,
                          type: AlertType.success,
                          title: "Order successfully placed",
                          desc: 'Total amount: ${Grandtotal}',
                          buttons: [
                            DialogButton(
                              child: Text(
                                "SUCCESS",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Homepage(),


                                      ));
                                Cartitem.clear();

                              },
                           width: 120,
                            ),
                          ],
                        ).show();
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Place Order',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
