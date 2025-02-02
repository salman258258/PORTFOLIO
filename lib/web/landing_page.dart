import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:salmanalfarizzi/components.dart';
import 'package:url_launcher/url_launcher.dart'; // Pastikan file ini benar

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
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
    final double heightDevice = MediaQuery.of(context).size.height;
    final double widthDevice = MediaQuery.of(context).size.width;

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
            const SizedBox(height: 15.0,),
            const SansBold("Salman Alfa Rizzi", 30.0),
            const SizedBox(height: 15.0,),
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
          ],
        ),

      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Spacer(flex: 3),
            TabsWeb(title:'Home', route: '/',),
            Spacer(),
            TabsWeb(title:'Works', route: '/works',),
            Spacer(),
            TabsWeb(title: 'Blog', route: '/blog',),
            Spacer(),
            TabsWeb(title: 'About', route: '/about',),
            Spacer(),
            TabsWeb(title: 'Contact', route: '/contact',),
            Spacer(),
          ],
        ),
      ),
      body: ListView(
        children: [
          // First Section
          Container(
            height: heightDevice - 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.0),
                            topLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: SansBold('Hello I am', 16.0),
                      ),
                      const SizedBox(height: 15.0),
                      SansBold('Salman Alfa Rizzi', 55.0),
                      const SizedBox(height: 15.0),
                      Sans('Flutter Developer', 25.0),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          const Icon(Icons.email),
                          const SizedBox(width: 20.0),
                          Sans('lucifersalman93@gmail.com', 20.0),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          const Icon(Icons.phone),
                          const SizedBox(width: 20.0),
                          Sans('+62 838 6603 3060', 20.0),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          const Icon(Icons.location_pin),
                          const SizedBox(width: 20.0),
                          Sans('Cilacap, Jawa Tengah, Indonesia', 20.0),
                        ],
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: CircleAvatar(
                    radius: 147.0,
                    backgroundColor: Colors.blueAccent,
                    child: CircleAvatar(
                      radius: 143.0,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: const AssetImage('assets/profile.png'),
                        radius: 140.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Second Section
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: Lottie.asset(
                    'assets/aboutme.json',
                    height: heightDevice / 1.5,
                  )
                ),
                const SizedBox(width: 20.0),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: heightDevice / 1.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SansBold('About Me', 30.0),
                        const SizedBox(height: 15.0),
                        Sans(
                          "Hello! I'm Salman Alfa Rizzi, a Flutter developer from Cilacap, Jawa Tengah, Indonesia.",
                          15.0,
                        ),
                        Sans(
                          "I have a passion for Flutter and I'm always looking for ways to improve my skills and knowledge.",
                          15.0,
                        ),
                        Sans(
                          "I am currently looking for a Flutter developer position.",
                          15.0,
                        ),
                        const SizedBox(height: 10.0),
                        Wrap(
                          spacing: 10.0,
                          children: [
                            skillContainer("Flutter"),
                            skillContainer("Firebase"),
                            skillContainer("Android"),
                            skillContainer("Dart"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Third Section
          Container(
            height: heightDevice / 1.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SansBold("What I do?", 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedCardWeb(imagePath: "assets/webL.png", text: "Web Development",
                    fit: BoxFit.contain,
                    reverse: true,),
                    AnimatedCardWeb(imagePath: "assets/app.png", text: "Android Development",
                    fit: BoxFit.contain,
                    reverse: true,),
                    AnimatedCardWeb(imagePath: "assets/firebase.png", text: "Firebase",
                    fit: BoxFit.contain,
                    reverse: true,),
                  ],
                )
              ],
            ),
          ),
          //Fourth Section
          Container(
            height: heightDevice,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SansBold("Contact Me", 40.0),
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
                TextForm(text: "Message", containerwidth: widthDevice/1.5, hintText: "Enter your Message", maxLines: 10
                ),
                MaterialButton(
            elevation: 20.0,
            height: 60.0,
            minWidth: 200.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.blueAccent,
            child: SansBold(
              'Send Message',
              20.0,
            ),
            onPressed:(){},)
              ],

            ),
          ),
          SizedBox(height: 20.0,)
        ],
      ),
    );
  }

  Widget skillContainer(String skill) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blueAccent,
          style: BorderStyle.solid,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.all(7.0),
      child: Sans(skill, 15.0),
    );
  }
}
