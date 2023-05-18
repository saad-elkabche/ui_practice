import 'package:flutter/material.dart';

import 'myBottomBarItem.dart';



class myBottomNavBar extends StatefulWidget {


  List<BottomBarItem> items=[];
  Color? selctedItemColor;
  int? activeItem;
  Color? backGColor;
  final ValueChanged<int>? onTap;

  myBottomNavBar({required this.items,this.selctedItemColor,this.activeItem,this.backGColor,this.onTap});

  @override
  State<myBottomNavBar> createState() => _myBottomNavBarState();
}

class _myBottomNavBarState extends State<myBottomNavBar> {
 late int _activeItem;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(vertical: 25,horizontal:15 ),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: widget.backGColor ?? Colors.grey[200],
        borderRadius:const BorderRadius.only(topRight:Radius.circular(60),topLeft: Radius.circular(60))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for(int i=0;i<widget.items.length;i++)
            BottomBarItemWidget(onItemSelected: onItemTaped,
              index: i,
              data: widget.items[i],
              iselected: _activeItem==i,
              activeItemColor: widget.selctedItemColor,
            )
        ],
      ),
    );
  }
  void onItemTaped(int index){
    setState(() {
      _activeItem=index;
      widget.onTap?.call(index);
    });
  }

  @override
  void initState() {
    _activeItem=widget.activeItem ?? 0;
  }
}

