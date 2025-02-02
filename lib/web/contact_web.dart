// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:salmanalfarizzi/components.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWeb extends StatefulWidget {
  const ContactWeb({super.key});

  @override
  State<ContactWeb> createState() => _ContactWebState();
}

class _ContactWebState extends State<ContactWeb> {
   urlLauncher (String url , String lottiePath){
    return IconButton(
    icon: Lottie.asset(
      lottiePath, // Path ke animasi Lottie
      height: 35.0, // Sesuaikan ukuran animasi
      width: 35.0,  
      fit: BoxFit.cover, 
    ),
    onPressed: () async {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        debugPrint("Could not launch $url");
      }
    },
  );
  }
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 72.0,
              backgroundColor: Colors.blueAccent,
              child: CircleAvatar(
                radius: 70.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/profile.png"),
              ),
            ),
            SizedBox(height: 20.0,),
            SansBold("Salman Alfa Rizzi", 30.0),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                urlLauncher('https://www.instagram.com/salman666__/',"assets/instagram.json" ),
                const SizedBox(width: 15),
                urlLauncher('https://github.com/salman258258', "assets/github.json"),
                const SizedBox(width: 15),
                urlLauncher('https://www.linkedin.com/in/salman-alfarizzi-473247252/', "assets/linkedin.json"),
              ],
            )
          ],)
        ),
        backgroundColor: Colors.white,
        body: NestedScrollView(headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled)
        {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 850.0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(
                color: Colors.black,
                size: 25.0,
              ),
              flexibleSpace:FlexibleSpaceBar(
                background: Image.asset("assets/contact_image.jpg", fit: BoxFit.cover,filterQuality: FilterQuality.high,),
              ),
              title: Row(
                children: [
                Spacer(flex: 3,),
                TabsWeb(title: 'Home', route: '/'), 
                Spacer(),
                TabsWeb(title: 'Works', route: '/works'),
                Spacer(),
                TabsWeb(title: 'Blog', route: '/blog'),
                Spacer(),
                TabsWeb(title: 'About', route: '/about'),
                Spacer(),
                TabsWeb(title: 'Contact', route: '/contact'),
                Spacer()
              ]),
              ),
          ];
        },
        // ignore: prefer_const_constructors
        body: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(height: 30.0,),
              SansBold("Contact", 40.0),
              const SizedBox(height: 38.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                      children: [
                        TextForm(text: "First Name", containerwidth: 350.0, hintText: "Enter your First Name", maxLines: 1),
                        SizedBox(height: 15.0,),
                        TextForm(text: "Email", containerwidth: 350.0, hintText: "Enter your email", maxLines: 1),
                      ]
                    ),
                    Column(
                      children: [
                        TextForm(text: "Last Name", containerwidth: 350.0, hintText: "Enter your Last Name", maxLines: 1),
                        SizedBox(height: 15.0,),
                        TextForm(text: "Phone number", containerwidth: 350.0, hintText: "Enter your Phone number", maxLines: 1),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 40.0,),
                TextForm(text: "Message", containerwidth: widthDevice/1.5, hintText: "Enter your Message", maxLines: 10
                ),
                SizedBox(height: 30.0,),
                MaterialButton(onPressed: (){},
                elevation: 20.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  
                ),
                height:60.0,
                minWidth: 200.0,
                color: Colors.blueAccent,
                child: SansBold('Submit', 20.0),
                ),
                SizedBox(height: 20.0,),
                
                        ],
                      ),
                      
                    ),
                  ));
                }
      
      }
      