import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapps/constants/constant.dart';
import 'package:myapps/model/slider.dart';
import 'package:myapps/widgets/slide_dots.dart';
import 'package:myapps/widgets/slide_items/slide_item.dart';
import 'package:myapps/welcomePage.dart';

class SliderLayoutView extends StatefulWidget {
  const SliderLayoutView({super.key});

  @override
  State<SliderLayoutView> createState() => _SliderLayoutViewState();
}

class _SliderLayoutViewState extends State<SliderLayoutView> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return topSliderLayout(context); // Pass context here
  }

  Widget topSliderLayout(BuildContext context) => Container(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: sliderArrayList.length,
            itemBuilder: (ctx, i) => SlideItem(i),
          ),
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: <Widget>[
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0, bottom: 15.0),
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        if(_currentPage<2){
                          _currentPage++;
                        }else {
                          _currentPage = 0;
                        }
                      });
                      _pageController.animateToPage(_currentPage, duration: Duration(seconds: 1),curve: Curves.easeIn);
                    },
                    child: const Text(
                      Constants.NEXT,
                      style: TextStyle(
                        fontFamily: Constants.OPEN_SANS,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),  
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Welcomepage()));
                    },
                    child: const Text(
                      Constants.SKIP,
                      style: TextStyle(
                        fontFamily: Constants.OPEN_SANS,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0,
                      ),
                    ),
                  )
                ),
              ),
              Container(
                alignment: AlignmentDirectional.bottomCenter,
                margin: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (int i = 0; i < sliderArrayList.length; i++)
                      if (i == _currentPage)
                        const SlideDots(true)
                      else
                        const SlideDots(false)
                  ],
                ),
              ),
            ],
          )
        ],
      )),
    );
}