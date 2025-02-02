import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:salmanalfarizzi/components.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMobile extends StatefulWidget {
  
  const ContactMobile({super.key});

  @override
  State<ContactMobile> createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile> {
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
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
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
      body: NestedScrollView(
  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverAppBar(
        expandedHeight: 400.0,
        flexibleSpace: FlexibleSpaceBar(
          background: Image.asset(
            "assets/contact_image.jpg",
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 25.0,
        ),
      ),
    ];
  },
  body: SingleChildScrollView(
    padding: EdgeInsets.symmetric(vertical: 25.0),
    child: Wrap(
      spacing: 20.0,
      runSpacing: 20.0,
      alignment: WrapAlignment.center,
      children: [
        SansBold("Contact Me", 35.0),
        TextForm(text: "First Name", containerwidth: widthDevice/1.4, hintText: "please enter your first name"),
        TextForm(text: "Last Name", containerwidth: widthDevice/1.4, hintText: "please enter your last name"),
        TextForm(text: "Email", containerwidth: widthDevice/1.4, hintText: "please enter your email"),
        TextForm(text: "Phone Number", containerwidth: widthDevice/1.4, hintText: "please enter your phone number"),
        TextForm(text: "Message", containerwidth: widthDevice/1.4, maxLines: 5, hintText: "please enter your message"),
        SizedBox(height: 20.0),
        MaterialButton(
          elevation: 20.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          height: 60.0,
          minWidth: widthDevice/2.2,
          color: Colors.blueAccent,
          child: 
          SansBold("Submit", 30.0),
          onPressed: () {
            // Handle button press
          },
        ),
      ]
    ),
    ),
  ),
    );
  }
}