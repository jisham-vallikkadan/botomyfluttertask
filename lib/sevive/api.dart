import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../model/categorymodel.dart';
class Api{

Future<List<CategoryModel>> Getdish()async{

  var url ='https://www.butomy.com/api/getbusinessbytimeline-petpooja-timing?business_type=1&page_id=351&user_id=367&offset=0&products_type=all&placeorder_type=all';
  var responce=await http.get(Uri.parse(url));
  if(responce.statusCode==200){
    var body = json.decode(responce.body);
    List<CategoryModel> listData =
    List<CategoryModel>.from(body['data'].map((v) => CategoryModel.fromJson(v)))
        .toList();
      print(listData);
    return listData;
  }else{
    List<CategoryModel> listData = [];
    return listData;
  }
}

}