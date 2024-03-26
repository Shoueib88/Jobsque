import 'package:flutter/material.dart';
import 'package:jobsque/consts/strings.dart';

import 'custom_text.dart';

class CustomPageview {
  PageController pc = PageController();
  PageController pc2 = PageController();
  PageController pc3 = PageController();

  pageviewOfPhoto() {
    return PageView.builder(
        controller: pc,
        itemBuilder: (BuildContext context, int i) {
          return Image.asset(
            images[i]['url'],
            fit: BoxFit.fill,
          );
        });
  }

  pageviewOfBigText() {
    return PageView.builder(
        controller: pc2,
        itemBuilder: (BuildContext context, int index) {
          return bigText.elementAt(index);
        });
  }

  pageviewOfSmallText() {
    return PageView.builder(
        controller: pc3,
        itemBuilder: (BuildContext context, int index) {
          return Text(smallText.elementAt(index));
        });
  }
}

List images = [
  {'url': 'asset/images/onboard1.png'},
  {'url': 'asset/images/onboard2.png'},
  {'url': 'asset/images/onboard3.png'}
];
List bigText = [BigText1(), BigText2(), BigText3()];
List smallText = [Strings.smalltext1, Strings.smalltext2, Strings.smalltext3];
