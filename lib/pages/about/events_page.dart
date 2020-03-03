import 'package:association_raed/blocs/event_bloc.dart';
import 'package:association_raed/components/event_card.dart';
import 'package:association_raed/components/page_not_found_error.dart';
import 'package:association_raed/components/unknown_error.dart';
import 'package:association_raed/enums/loading_state.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'single_post_event_page.dart';

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<EventsBloc>(builder: (context, event, child) {
      return Scaffold(
          body: event.getLoadingState == LoadingState.loading
              ? Center(child: CircularProgressIndicator())
              : event.getLoadingState == LoadingState.done
                  ? Container(
                      child: Container(
                        padding: EdgeInsets.only(top: 70, bottom: 70),
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: event.getEvents?.length ?? 0,
                          itemBuilder: (context, i) => EventCard(
                            date: event.getEvents[i].getEventDate,
                            title: event.getEvents[i].getEventTitle,
                            location: event.getEvents[i].getEventLocation,
                            image: event.getEvents[i].getImages != null
                                ? event.getEvents[i].getImages[0]
                                : null,
                            time: event.getEvents[i].getEventTime,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeIn,
                                      type: PageTransitionType.fade,
                                      child: i <event.getEvents.length
                                          ? SinglePostEventPage(id: i)
                                          : Scaffold(
                                            body: NotFoundErrorPage(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                          )));
                            },
                          ),
                        ),
                      ),
                    )
                  : UnknownErrorPage(
                      onPressed: () {
                        event.getEventsFromFirebase();
                      },
                    ));
    });
  }
}
