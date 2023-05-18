import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class BottomBarItem{
  String? label;
  final String iconAsset;
  
  BottomBarItem({required this.iconAsset,this.label});
  
}


class BottomBarItemWidget extends StatelessWidget {
  final BottomBarItem data;
  Color? activeItemColor;
  bool? iselected;
  int index;
  Function(int) onItemSelected;


   BottomBarItemWidget({required this.onItemSelected,required this.index,required this.data,this.activeItemColor,this.iselected}) ;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(onTap: ()=>onItemSelected(index),
      child:  (iselected ?? false) ? _getSelectedItem:_getSimpleItem,
    );
  }

  Widget get _getSimpleItem{
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset(data.iconAsset,color: Colors.black,),
        Text(data.label ?? '')
      ],
    );
  }

  Widget get _getSelectedItem{
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: activeItemColor ?? Colors.white
      ),
      child:SvgPicture.asset(data.iconAsset,color: Colors.white),
    );
  }
}

