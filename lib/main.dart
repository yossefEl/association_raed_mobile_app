import 'package:association_raed/blocs/about_us_bloc.dart';
import 'package:association_raed/blocs/authentication_bloc.dart';
import 'package:association_raed/blocs/blog_bloc.dart';
import 'package:association_raed/blocs/connectivity_bloc.dart';
import 'package:association_raed/blocs/event_bloc.dart';
import 'package:association_raed/blocs/schools_bloc.dart';
import 'package:association_raed/blocs/search_items_bloc.dart';
import 'package:association_raed/blocs/tawjih_news_bloc.dart';
import 'package:association_raed/pages/introduction/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  //initialize the flutter downloader plugin
  await FlutterDownloader.initialize();
  return runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationBloc()),
        ChangeNotifierProvider(create: (_) => ConnectivityStateBloc()),
        ChangeNotifierProvider(create: (_) => BlogBloc()),
        ChangeNotifierProvider(create: (_) => AboutUsBloc()),
        ChangeNotifierProvider(create: (_) => EventsBloc()),
        ChangeNotifierProvider(create: (_) => TawjihNewsBloc()),
        ChangeNotifierProvider(create: (_) => SchoolsBloc()),
        ChangeNotifierProvider(create: (_) => SearchItemsBloc()),
      ],
      child: MaterialApp(
          theme: ThemeData(
            textTheme: GoogleFonts.bitterTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: SplashPage()),
    );
  }

}
