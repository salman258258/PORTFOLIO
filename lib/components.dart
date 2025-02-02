import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

/// Widget untuk tab navigasi pada web
class TabsWeb extends StatefulWidget {
  final String title;
  final String route;

  const TabsWeb({super.key, required this.title,required this.route});

  @override
  State<TabsWeb> createState() => _TabsWebState();
  
}
class _TabsWebState extends State<TabsWeb> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isSelected = true;
        });
      },
      onExit: (_) {
        setState(() {
          isSelected = false;
        });
      },
      child: AnimatedDefaultTextStyle(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 100),
        style: isSelected
            ? GoogleFonts.roboto(
                fontSize: 18,
                shadows: const [Shadow(color: Colors.black, offset: Offset(1, 1))],
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.blueAccent,
              )
            : GoogleFonts.roboto(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, widget.route);
        },
        child: Text(widget.title),
      ),
      ),
    );
  }
}
class TabsMobile extends StatefulWidget {
  final String text;
  final String route;

  const TabsMobile({Key? key, required this.text, required this.route}) : super(key: key);

  @override
  State<TabsMobile> createState() => _TabsMobileState();
}

class _TabsMobileState extends State<TabsMobile> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 20.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      height: 50.0,
      minWidth: 200.0,
      child: Text(
        widget.text,
        style: GoogleFonts.openSans(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, widget.route);
      },
    );
  }
}


/// Widget teks dengan gaya bold menggunakan Google Fonts OpenSans
class SansBold extends StatelessWidget {
  final String text;
  final double size;

  const SansBold(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

/// Widget teks dengan gaya normal menggunakan Google Fonts OpenSans
class Sans extends StatelessWidget {
  final String text;
  final double size;

  const Sans(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
        color: Colors.black,
        fontSize: size,
      ),
    );
  }
}

/// Widget formulir teks dengan label dan input email
class TextForm extends StatelessWidget {
  final String text;
  final double? containerwidth;
  final String hintText;
  final int? maxLines;

  const TextForm({
    super.key,
    required this.text,
    this.containerwidth,
    required this.hintText,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Sans(text, 15.0),
        const SizedBox(height: 5),
        SizedBox(
          width: containerwidth ?? double.infinity,
          child: TextFormField(
            maxLines: maxLines,
            decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(20.0),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(20.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(25.0),
              ),
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(fontSize: 14.0),
            ),
          ),
        ),
      ],
    );
  }
}

/// Widget untuk kartu animasi

class AnimatedCardWeb extends StatefulWidget {
  final String imagePath;
  final String text;
  final bool reverse;
  final BoxFit? fit;
  final double? height;
  final double? width;

  const AnimatedCardWeb({
    super.key,
    required this.imagePath,
    required this.text,
    this.reverse = false,
    this.fit,
    this.height,
    this.width,
  });

  @override
  State<AnimatedCardWeb> createState() => _AnimatedCardWebState();
}

class _AnimatedCardWebState extends State<AnimatedCardWeb> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<Offset>(
      begin: widget.reverse ? const Offset(0, 0) : const Offset(0, -0.1),
      end: widget.reverse ? const Offset(0, -0.1) : const Offset(0, 0),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Card(
        elevation: 30.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(color: Colors.blueAccent),
        ),
        shadowColor: Colors.blueAccent,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.imagePath,
                height: widget.height ?? 200.0,
                width: widget.width ?? 200.0,
                fit: widget.fit ?? BoxFit.cover,
              ),
              const SizedBox(height: 10.0),
              SansBold(widget.text, 20.0),
            ],
          ),
        ),
      ),
    );
  }
}

/// Widget untuk kartu animasi
class LottieAnimate extends StatelessWidget {
  final String url;
  final String lottiePath;
  const LottieAnimate({super.key, required this.url, required this.lottiePath});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  Widget urlLauncher(String url, String lottiePath) {
    return IconButton(
      icon: Lottie.asset(
        lottiePath, // Path ke animasi Lottie
        height: 15.0, // Sesuaikan ukuran animasi
        width: 15.0,  
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
}
