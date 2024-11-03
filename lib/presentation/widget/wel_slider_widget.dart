import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket/domain/model/post_welcome.dart';
import 'package:movie_ticket/util/theme.dart';

class WelSliderWidget extends StatefulWidget {
  const WelSliderWidget({super.key, required this.listImage});

  final List<PostWelcome> listImage;

  @override
  State<StatefulWidget> createState() {
    return _WelSliderWidget();
  }
}

class _WelSliderWidget extends State<WelSliderWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> listUrl = [];
    for (var element in widget.listImage) {
      listUrl.add(element.url);
    }
    return Column(
      children: [
        CarouselSlider(
          items: widget.listImage.map((image) {
            return Image.asset(
              image.url,
              fit: BoxFit.cover,
            );
          }).toList(),
          options: CarouselOptions(
            height: MediaQuery.sizeOf(context).height * 0.3,
            viewportFraction: 1,
            autoPlay: true,
            onPageChanged: (index, reason) => setState(() {
              _currentIndex = index;
            }),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: listUrl.map((e) {
            int index = listUrl.indexOf(e);
            return Container(
                height: 6,
                width: 6,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == _currentIndex ? kPrimaryColor : kGreyColor,
                ));
          }).toList(),
        ),
      ],
    );
  }
}
