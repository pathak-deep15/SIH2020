import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CustomizableCard extends StatelessWidget {
  final Color backgroundColor;
  final Color titleColor;
  final double elevation;
  final IconData icon;
  final String title;
  final String subtext1;
  final Color subtextColor;
  final Widget bottomWidget;
  final Gradient gradient;
  final void Function(dynamic) popUpMenuOnSelected;
  final List<PopupMenuItem> popUpMenuItems;


  CustomizableCard({
    this.backgroundColor = Colors.white,
    this.titleColor = Colors.black,
    this.elevation = 0.0,
    @required this.icon,
    @required this.title,
    this.subtext1,
    this.subtextColor,
    this.bottomWidget,
    this.gradient,
    this.popUpMenuOnSelected,
    this.popUpMenuItems,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17.0),
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17.0),
            color: backgroundColor,
            gradient: gradient
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16.0,top: 5.0),
              child: Align(
                alignment: Alignment.topRight,
                child: PopupMenuButton<dynamic>(
                  itemBuilder: (BuildContext context) {
                    return popUpMenuItems;
                  },
                  onSelected: popUpMenuOnSelected,
                  child: Icon(
                    FontAwesomeIcons.ellipsisH,
                    size: 18.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10.0,bottom: 12.0),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Icon(
                      icon,
                      color: Colors.lightGreen.shade400,
                      size: 40.0,
                    ),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 32.0,
                            color: titleColor
                        ),
                      ),
                      Text(
                        subtext1,
                        style: TextStyle(
                            fontSize: 18.0,
                            color: subtextColor
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                child: bottomWidget
            )
          ],
        ),
      ),
    );
  }
}
