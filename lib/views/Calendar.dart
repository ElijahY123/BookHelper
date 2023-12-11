import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:group_d_final/Models/Event.dart';

class Calendar extends StatelessWidget {
  final DateTime today;
  final DateTime firstDay;
  final DateTime lastDay;
  final Function(DateTime, DateTime) onDaySelected;
  final Map<DateTime, List<Event>> events;
  final TextEditingController eventController;
  final ValueNotifier<List<Event>> selectedEvents;
  final List<Event> Function(DateTime day) getEventsForDay;

  Calendar ({
    required this.today,
    required this.firstDay,
    required this.lastDay,
    required this.onDaySelected,
    required this.events,
    required this.eventController,
    required this.selectedEvents,
    required this.getEventsForDay,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    scrollable: true,
                    title: Text("Event Name"),
                    content: Padding(
                      padding:  EdgeInsets.all(8),
                      child: TextField(
                        controller: eventController,
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            events.addAll({
                              today!: [Event(eventController.text)]
                            });
                            print(events);
                            Navigator.of(context).pop();
                            selectedEvents.value = getEventsForDay(today);
                          },
                          child: Text("Submit")
                      )
                    ],
                  );
                });
          },
          child: Icon(Icons.add)
      ),
      body: Column(
          children: [
            TableCalendar(
              locale: "en_US",
              rowHeight: 40,
              headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              focusedDay: today,
              firstDay: firstDay,
              lastDay: lastDay,
              onDaySelected: onDaySelected,
              eventLoader: getEventsForDay,

            ),
            SizedBox(height: 7.0),
            Expanded(
              child: ValueListenableBuilder<List<Event>>(
                  valueListenable: selectedEvents,
                  builder: (context, value, _) {
                    return ListView.builder(
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.deepPurpleAccent,
                              ),
                              child: ListTile(
                                textColor: Colors.white70,
                                  title: Text('${value[index].title}'),
                              )
                          );
                        });
                  }
              ),
            )
          ]
      ),
      backgroundColor: Colors.white70,
    );
  }
}