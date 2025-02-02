import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:salmanalfarizzi/components.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
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
  accentContainer(String text){
    return Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                border: Border.all(
                  color: Colors.blueAccent,
                  width: 2.0,),
                  borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(7.0),
              child: Sans(text, 15.0),
            );
  }
  @override
  Widget build(BuildContext context) {
    var widthdevice = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          size: 35.0,
          color: Colors.black,
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DrawerHeader(padding: EdgeInsets.only(bottom: 20.0),
             child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/profile.png'),
              ),
             )
             ),
           TabsMobile(text: 'Home', route: '/'),
            SizedBox(height: 20.0),
            TabsMobile(text: 'Works', route: '/works'),
            SizedBox(height: 20.0),
            TabsMobile(text: 'Blog', route: '/blog'),
            SizedBox(height: 20.0),
            TabsMobile(text: 'About', route: '/about'),
            SizedBox(height: 20.0),
            TabsMobile(text: 'Contact', route: '/contact'),
            SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [
                urlLauncher('https://www.instagram.com/salman666__/',"assets/instagram.json" ),
                const SizedBox(width: 15),
                urlLauncher('https://github.com/salman258258', "assets/github.json"),
                const SizedBox(width: 15),
                urlLauncher('https://www.linkedin.com/in/salman-alfarizzi-473247252/', "assets/linkedin.json"),
              ],
              )
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 117.0,
                  backgroundColor: Colors.blueAccent,
                  child: CircleAvatar(
                    radius: 110.0,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/profile.png'),
                  ),
                ),
                SizedBox(height: 20.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.only(
                        topLeft:Radius.circular(20.0),
                        topRight:Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      )
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: SansBold("Hello, I'm", 15.0),
                  ),
                  SansBold("Salman Alfa Rizzi", 40.0),
                  Sans("Flutter Develper", 20.0),
                ]
                ),
                SizedBox(height: 15.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 3.0,
                      children: [
                        Icon(Icons.email),
                        Icon(Icons.phone),
                        Icon(Icons.location_pin),
                        ],
                    ),
                    SizedBox(width: 40.0,),
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 9.0,
                      children: [
                        Sans("lucifersalman93@gmail.com", 15.0),
                        Sans("+62 838 660 330 60", 15.0),
                        Sans("Bandung, Indonesia", 15.0)
                  ],)
                  
              ],
            ),
          
          ],
      ),
    ),
    SizedBox(height: 90.0,),
    //About Me,second page
    Padding(padding: EdgeInsets.only(left: 20.00),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SansBold("About Me", 30.0),
        Sans('I am a Flutter Developer from Indonesia.', 15.0),
        Sans('I am studying at Telkom University.', 15.0),
        Sans('I am working as a Flutter Developer.', 15.0),
        SizedBox(height: 10.0,),
        Wrap(
          spacing: 7.0,
          runSpacing: 7.0,
          children:[
            accentContainer('Flutter'),
            accentContainer('Dart'),
            accentContainer('Firebase'),
          ]
        )
        ]
    ),
    ),
    SizedBox(height: 60.0,),
    //My Works, third page
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedCardWeb(imagePath: 'assets/webL.png', text: 'Web Development',width: 300.0,),
        SizedBox(height: 20.0,),
        AnimatedCardWeb(imagePath: 'assets/app.png', text: 'Mobile Development',reverse: true,width: 300.0,),
        SizedBox(height: 20.0,),
        AnimatedCardWeb(imagePath: 'assets/firebase.png', text: 'firebase',width: 300.0,),
      ],
      
    ),
    SizedBox(height: 60.0,),
    //Contact Section, fourth page
    Wrap(
  spacing: 20.0,
  runSpacing: 20.0,
  alignment: WrapAlignment.center,
  children: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SansBold("Contact", 35.0),
        SizedBox(height: 10.0), // Memberikan jarak antara Contact dan form
        TextForm(text: 'First Name', hintText: 'Enter your first name', containerwidth: widthdevice / 1.4,),
        TextForm(text: 'Last Name', hintText: 'Enter your last name', containerwidth: widthdevice / 1.4,),
        TextForm(text: 'Email', hintText: 'Enter your email', containerwidth: widthdevice / 1.4,),
        TextForm(text: 'Phone', hintText: 'Enter your phone number', containerwidth: widthdevice / 1.4,),
        TextForm(text: 'Message', hintText: 'Enter your message', containerwidth: widthdevice / 1.4, maxLines: 5,),
        SizedBox(height: 20.0), // Memberikan jarak sebelum tombol
        Center(
          child: MaterialButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            height: 60.0,
            minWidth: widthdevice / 2.2,
            color: Colors.blueAccent,
            child: Sans('Send', 20.0),
          ),
        )
      ],
    )
  ],
)
      ],
    )
    
    );
  }
}