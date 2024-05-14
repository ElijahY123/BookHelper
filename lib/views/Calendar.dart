import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:group_d_final/Models/model.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:group_d_final/Models/Event.dart';

class Calendar extends StatelessWidget {
  CalendarModel calendarModel = CalendarModel();

  final DateTime today;
  final DateTime firstDay;
  final DateTime lastDay;
  final Function(DateTime, DateTime) onDaySelected;
  final Map<DateTime, List<Event>> events;
  final TextEditingController eventController;
  final ValueNotifier<List<Event>> selectedEvents;
  final List<Event> Function(DateTime day) getEventsForDay;
  String selectedItem;
  String username;
  final List<String> bookList;
  final Function(String?) onDropDownChanged;
  final Function(dynamic context) processCSV;
  final List<String> Function(dynamic context) getBookList;
  final Function() updateEventsFromDatabase;

  Calendar({super.key, 
    required this.username,
    required this.today,
    required this.firstDay,
    required this.lastDay,
    required this.onDaySelected,
    required this.events,
    required this.eventController,
    required this.selectedEvents,
    required this.getEventsForDay,
    required this.selectedItem,
    required this.bookList,
    required this.onDropDownChanged,
    required this.processCSV,
    required this.getBookList,
    required this.updateEventsFromDatabase,
  });



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            processCSV(context);
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      actionsOverflowAlignment: OverflowBarAlignment.center,
                      title: const Text("Add Event"),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Book for class"),
                                    content: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: DropdownSearch<String>(
                                            items: getBookList(context),
                                            selectedItem: selectedItem,
                                            popupProps:
                                                const PopupPropsMultiSelection.menu(
                                              showSelectedItems: true,
                                              showSearchBox: true,
                                            ),
                                            onChanged: (string) {
                                              selectedItem = string!;
                                            })),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          calendarModel
                                              .updateEventsFromDatabase();
                                           DateTime tempDay = DateTime(today.year, today.month, today.day, 0, 0, 0, 0, 0);

                                          if (events[tempDay] != null) {
                                            events[tempDay]?.add(Event("Bring $selectedItem to class"));
                                          }
                                          events.putIfAbsent(tempDay, () => [Event("Bring $selectedItem to class")]);


                                          calendarModel.addEvent(
                                              username,
                                              "Bring $selectedItem to class",
                                              today);

                                          /*
                                        events.addAll({
                                          today: [Event("Bring ${selectedItem} to class")]
                                        });
                                         */
                                          Navigator.of(context).pop();
                                          selectedEvents.value =
                                              getEventsForDay(today);
                                          onDaySelected(today, today);
                                        },
                                        child: const Text("Submit"),
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: const Text("Book for Class"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Book Delivery"),
                                    content: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: DropdownSearch<String>(
                                            items: getBookList(context),
                                            selectedItem: selectedItem,
                                            popupProps:
                                                const PopupPropsMultiSelection.menu(
                                              showSelectedItems: true,
                                              showSearchBox: true,
                                            ),
                                            onChanged: (string) {
                                              selectedItem = string!;
                                            })),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          print("Submitted");
                                          DateTime tempDay = DateTime(today.year, today.month, today.day, 0, 0, 0, 0, 0);
                                          if (events[tempDay] != null) {
                                            events[tempDay]?.add(Event("$selectedItem is being delivered"));
                                          }
                                          events.putIfAbsent(tempDay, () => [Event("$selectedItem is being delivered")]);


                                          calendarModel.addEvent(
                                              username,
                                              "$selectedItem is being delivered",
                                              today);
                                          /*
                                        events.addAll({
                                          today: [Event("${selectedItem} is being delivered")]
                                        });

                                         */
                                          Navigator.of(context).pop();
                                          selectedEvents.value =
                                              getEventsForDay(today);
                                          onDaySelected(today, today);
                                        },
                                        child: const Text("Submit"),
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: const Text("Book Delivery"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Book Rental"),
                                    content: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: DropdownSearch<String>(
                                            items: getBookList(context),
                                            selectedItem: selectedItem,
                                            popupProps:
                                                const PopupPropsMultiSelection.menu(
                                              showSelectedItems: true,
                                              showSearchBox: true,
                                            ),
                                            onChanged: (string) {
                                              selectedItem = string!;
                                            })),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          DateTime tempDay = DateTime(today.year, today.month, today.day, 0, 0, 0, 0, 0);
                                          if (events[tempDay] != null) {
                                            events[tempDay]?.add(Event("$selectedItem is due to be returned"));
                                          }
                                          events.putIfAbsent(tempDay, () => [Event("$selectedItem is due to be returned")]);

                                          calendarModel.addEvent(
                                              username,
                                              "$selectedItem is due to be returned",
                                              today);
                                          /*
                                          events.addAll({
                                            today: [Event("${selectedItem} is due to be returned")]
                                          });
                                           */
                                          Navigator.of(context).pop();
                                          selectedEvents.value =
                                              getEventsForDay(today);
                                          onDaySelected(today, today);
                                        },
                                        child: const Text("Submit"),
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: const Text("Book Rental"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Custom Event"),
                                    content: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: TextField(
                                        controller: eventController,
                                      ),
                                    ),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            calendarModel.addEvent(username,
                                                eventController.text, today);
                                            DateTime tempDay = DateTime(today.year, today.month, today.day, 0, 0, 0, 0, 0);
                                            events.addAll({
                                              tempDay: [Event(eventController.text)]
                                            });


                                            Navigator.of(context).pop();
                                            selectedEvents.value =
                                                getEventsForDay(today);
                                          },
                                          child: const Text("Submit"))
                                    ],
                                  );
                                });
                          },
                          child: const Text("Custom Event"),
                        ),
                      ]
                      /*scrollable: true,
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
                     */
                      );
                });
          },
          child: const Icon(Icons.add)),
      body: Column(children: [
        TableCalendar(
          locale: "en_US",
          rowHeight: 40,
          headerStyle:
              const HeaderStyle(formatButtonVisible: false, titleCentered: true),
          availableGestures: AvailableGestures.all,
          selectedDayPredicate: (day) => isSameDay(day, today),
          focusedDay: today,
          firstDay: firstDay,
          lastDay: lastDay,
          onDaySelected: onDaySelected,
          eventLoader: getEventsForDay,
        ),
        const SizedBox(height: 7.0),
        Expanded(
          child: ValueListenableBuilder<List<Event>>(
              valueListenable: selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Container(
                          margin:
                              const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.deepPurpleAccent,
                          ),
                          child: ListTile(
                            textColor: Colors.white70,
                            title: Text(value[index].title),
                          ));
                    });
              }),
        )
      ]),
      backgroundColor: Colors.white70,
    );
  }
}
