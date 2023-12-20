import 'dart:convert';

import 'package:advanc_task_6/seeder/dataseeder.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';

class Lispro extends StatefulWidget {
  const Lispro({super.key});

  @override
  State<Lispro> createState() => _LisproState();
}

class _LisproState extends State<Lispro> {
  @override
  void initState() {
    getdatapro();
    super.initState();
  }

  void getdatapro() async {
    await DataSeeder.loadData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CarouselSlider.builder(
                itemCount: DataSeeder.ads.length,
                itemBuilder: (ctx, index, _) {
                  return Container(
                      width: 500,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(color: Colors.black),
                      child: Image.network(DataSeeder.ads[index].picture!));
                },
                options: CarouselOptions(
                  height: 200,
                  viewportFraction: .9,
                  padEnds: false,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.15,
                  onPageChanged: (index, _) {
                    index = index;
                    setState(() {});
                  },
                  scrollDirection: Axis.horizontal,
                )),
          ),
        ]),
      ),
    );
  }
}
