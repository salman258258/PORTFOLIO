import 'package:flutter/material.dart';
import 'package:salmanalfarizzi/mobile/about_mobile.dart';
import 'package:salmanalfarizzi/mobile/blog_mobile.dart';
import 'package:salmanalfarizzi/mobile/contact_mobile.dart';
import 'package:salmanalfarizzi/mobile/landing_page_mobile.dart';
import 'package:salmanalfarizzi/mobile/works_mobile.dart';
import 'package:salmanalfarizzi/web/about_web.dart';
import 'package:salmanalfarizzi/web/blog_web.dart';
import 'package:salmanalfarizzi/web/contact_web.dart';
import 'package:salmanalfarizzi/web/landing_page.dart';
import 'package:salmanalfarizzi/web/works_web.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return const LandingPageWeb();
              } else {
                return const LandingPageMobile();
              }
            },
          ),
        );
      case '/contact':
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return const ContactWeb();
              } else {
                return const ContactMobile();
              }
            },
          ),
          settings: settings,
        );
        case '/about':
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return const AboutWeb();
              } else {
                return const AboutMobile();
              }
            },
          ),
          settings: settings,
        );
        case '/blog':
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return const BlogWeb();
              } else {
                return const BlogMobile();
              }
            },
          ),
          settings: settings,
        );
        case '/works':
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return const WorksWeb();
              } else {
                return const WorksMobile();
              }
            },
          ),
          settings: settings,
        );
      default:
       return MaterialPageRoute(
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return const LandingPageWeb();
              } else {
                return const LandingPageMobile();
              }
            },
          ),
        );
    }
  }
}