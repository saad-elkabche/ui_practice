import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_practice/myBottomBar/myBottomBar.dart';
import 'package:ui_practice/myBottomBar/myBottomBarItem.dart';
import '../extensions.dart' ;


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value:const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark
      ),
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: myBottomNavBar(
            backGColor: Colors.grey[100],
            selctedItemColor: Colors.deepOrange,
            items: [
              BottomBarItem(iconAsset: 'assets/icons/main.svg'),
              BottomBarItem(iconAsset: 'assets/icons/liked.svg'),
              BottomBarItem(iconAsset: 'assets/icons/chat.svg'),
              BottomBarItem(iconAsset: 'assets/icons/settings.svg')
            ]
            ,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                   _header(context),
                   _serchBar(context),
                   _title(context,"Category"),
                   _categories(context),
                   _title(context,"Popular"),
                   _popular(context)
                ],
              ),
            ),
          ),
        ),
    ),

    );
  }

  Widget _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bashkortostan",style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.black)),
            Text("Choose another",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.grey)),
          ],
        ),
        SvgPicture.asset("assets/icons/map.svg",height: 30,width: 30,)
      ],
    );
  }
  Widget _serchBar(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Enter name or category",
          hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(color:Colors.grey),
          suffixIcon:const Icon(Icons.search,size: 30,color: Colors.grey,)
      ),
      style:Theme.of(context).textTheme.titleMedium ,
    ).addBox(borderRudius: 15,margin: const EdgeInsets.symmetric(vertical: 24,horizontal: 15),padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5));
  }
  Widget _title(BuildContext context,String title) {
    return Align(
      alignment: const Alignment(-1,0),
      child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)
      ),
    );
  }

  Widget _categories(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
        _singleCategorie(context, "assets/icons/top30.svg", "top 30 places"),
        _singleCategorie(context, "assets/icons/tree.svg", "Nature"),
        _singleCategorie(context, "assets/icons/diner.svg", "Dinner"),

        ],
      ),
    );
  }
  Widget _singleCategorie(BuildContext context,String logo,String title){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(onPressed: null, icon: SvgPicture.asset(logo,height: 30,width: 30)),
        Text(title,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black))
      ],
    ).addBox(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      borderRudius: 10,
      margin:const EdgeInsets.symmetric(vertical: 20,horizontal: 10)

    );
  }



  Widget _popular(BuildContext context) {
    return Container(
      height: 350,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(top: 30),
        children: [
          _singlePopular(context, name: "Monument to\nsalavat Yulaev", rate: 4.9, asset: "assets/images/img1.png"),
          const SizedBox(width: 20),
          _singlePopular(context, name: "Krasnyy Klyuch\nspring", rate: 5.0, asset: "assets/images/img2.png"),
          const SizedBox(width: 20),
          _singlePopular(context, name: "Shulgat-Tash\ncave", rate: 4.5, asset: "assets/images/img3.png"),
          const SizedBox(width: 20),
          _singlePopular(context, name: "Monument to\nsalavat Yulaev", rate: 4.9, asset: "assets/images/img1.png"),
          const SizedBox(width: 20),
          _singlePopular(context, name: "Krasnyy Klyuch\nspring", rate: 5.0, asset: "assets/images/img2.png"),
          const SizedBox(width: 20),
          _singlePopular(context, name: "Shulgat-Tash\ncave", rate: 4.5, asset: "assets/images/img3.png"),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
  Widget _singlePopular(BuildContext context,{required String name,required double rate,required String asset}){
    return Container(
     height: 300,
      width: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(asset),
            fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
              right: 15,
              top: 15,
              child: Container(
                height: 40,
                width: 50,
                decoration:const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                ),
                child: IconButton(
                  onPressed: null,
                  icon: SvgPicture.asset("assets/icons/like.svg",height:20,width:20 ,),
                ),
              )
          ),
          Positioned(
            bottom: 40,
              left: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Padding(
                    padding:const EdgeInsets.only(top: 8),
                    child: Container(
                     padding:const EdgeInsets.symmetric(vertical: 2,horizontal: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black.withOpacity(0.7)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.star,color: Colors.amber,size: 20,),
                          Text(rate.toString(),style:Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white))
                        ],
                      ),
                    ),
                  )
                ],
              )
          )

        ],
      ),
    );
  }

}









