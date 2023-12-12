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

  const Calendar ({
    super.key,
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
        title: const Text('Calendar'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    scrollable: true,
                    title: const Text("Event Name"),
                    content: Padding(
                      padding:  const EdgeInsets.all(8),
                      child: TextField(
                        controller: eventController,
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            events.addAll({
                              today: [Event(eventController.text)]
                            });
                            Navigator.of(context).pop();
                            selectedEvents.value = getEventsForDay(today);
                          },
                          child: const Text("Submit")
                      )
                    ],
                  );
                });
          },
          child: const Icon(Icons.add)
      ),
      body: Column(
          children: [
            TableCalendar(
              locale: "en_US",
              rowHeight: 50,
              headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              focusedDay: today,
              firstDay: firstDay,
              lastDay: lastDay,
              onDaySelected: onDaySelected,
              eventLoader: getEventsForDay,
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ValueListenableBuilder<List<Event>>(
                  valueListenable: selectedEvents,
                  builder: (context, value, _) {
                    return ListView.builder(
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListTile(
                                  onTap: () => print(""),
                                  title: Text(value[index].title),
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