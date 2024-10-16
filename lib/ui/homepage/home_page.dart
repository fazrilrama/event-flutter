import 'package:flutter/material.dart';
import 'package:myapps/model/category.dart';
import 'package:myapps/model/event.dart';
import 'package:myapps/styleguide.dart';
import 'package:myapps/ui/homepage/home_page_background.dart';
import 'package:provider/provider.dart';


// ignore: unused_import
import '../../app_state.dart';
import '../event_details/event_detail_page.dart';
import 'category_widget.dart';
import 'event_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        child: Stack(
          children: <Widget>[
            HomePageBackground(screenHeight: MediaQuery.of(context).size.height),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.8),  
                      child: Row(
                        children: <Widget>[
                          Text(
                            "LOCAL EVENTS",
                            style: fadedTextStyle,
                          ),
                          Spacer(),
                          Icon(
                            Icons.person_outline,
                            color: Color(0x99FFFFFF),
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text(
                        "What's Up",
                        style: whiteHeadingTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Consumer<AppState>(
                        builder: (context, appState, _) => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[for (final category in categories) CategoryWidget(category: category)],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Consumer<AppState>(
                        builder: (context, appState, _) => Column(
                          children: <Widget>[
                            for (final event in events.where((e) => e.categoryIds.contains(appState.selectedCategoryId)))
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => EventDetailsPage(event: event),
                                    ),
                                  );
                                },
                                child: EventWidget(
                                  event: event,
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}