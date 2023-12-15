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


  Calendar ({
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
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            processCSV(context);
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      actionsOverflowAlignment: OverflowBarAlignment.center,
                      title: Text("Add Event"),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Book for class"),
                                    content: Padding(
                                        padding:  EdgeInsets.all(8),
                                        child: DropdownSearch<String> (
                                            items: getBookList(context),
                                            selectedItem: selectedItem,
                                            popupProps: PopupPropsMultiSelection.menu(
                                              showSelectedItems: true,
                                              showSearchBox: true,
                                            ),
                                            onChanged: (string) {
                                              selectedItem = string!;
                                            }
                                        )
                                    ),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          if (events[today] != null) {
                                            calendarModel.addEvent(username, "Bring ${selectedItem} to class", today);
                                            events[today]?.add(Event("Bring ${selectedItem} to class"));
                                          }
                                          events.putIfAbsent(today, () => [Event("Bring ${selectedItem} to class")]);
                                          /*
                                        events.addAll({
                                          today: [Event("Bring ${selectedItem} to class")]
                                        });
                                         */
                                          Navigator.of(context).pop();
                                          selectedEvents.value = getEventsForDay(today);
                                          onDaySelected(today, today);
                                        },
                                        child: Text("Submit"),
                                      ),
                                    ],
                                  );
                                }
                            );
                          },
                          child: Text("Book for Class"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Book Delivery"),
                                    content: Padding(
                                        padding:  EdgeInsets.all(8),
                                        child: DropdownSearch<String> (
                                            items: getBookList(context),
                                            selectedItem: selectedItem,
                                            popupProps: PopupPropsMultiSelection.menu(
                                              showSelectedItems: true,
                                              showSearchBox: true,
                                            ),
                                            onChanged: (string) {
                                              selectedItem = string!;
                                            }
                                        )
                                    ),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          print("Submitted");
                                          if (events[today] != null) {
                                            calendarModel.addEvent(username, "${selectedItem} is being delivered", today);
                                            events[today]?.add(Event("${selectedItem} is being delivered"));
                                          }
                                          events.putIfAbsent(today, () => [Event("${selectedItem} is being delivered")]);
                                          /*
                                        events.addAll({
                                          today: [Event("${selectedItem} is being delivered")]
                                        });

                                         */
                                          Navigator.of(context).pop();
                                          selectedEvents.value = getEventsForDay(today);
                                          onDaySelected(today, today);
                                        },
                                        child: Text("Submit"),
                                      ),
                                    ],
                                  );
                                }
                            );
                          },
                          child: Text("Book Delivery"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Book Rental"),
                                    content: Padding(
                                        padding:  EdgeInsets.all(8),
                                        child: DropdownSearch<String> (
                                            items: getBookList(context),
                                            selectedItem: selectedItem,
                                            popupProps: PopupPropsMultiSelection.menu(
                                              showSelectedItems: true,
                                              showSearchBox: true,
                                            ),
                                            onChanged: (string) {
                                              selectedItem = string!;
                                            }
                                        )
                                    ),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          if (events[today] != null) {
                                            calendarModel.addEvent(username, "${selectedItem} is due to be returned", today);
                                            events[today]?.add(Event("${selectedItem} is due to be returned"));
                                          }
                                          events.putIfAbsent(today, () => [Event("${selectedItem} is due to be returned")]);
                                          /*
                                          events.addAll({
                                            today: [Event("${selectedItem} is due to be returned")]
                                          });
                                           */
                                          Navigator.of(context).pop();
                                          selectedEvents.value = getEventsForDay(today);
                                          onDaySelected(today, today);
                                        },
                                        child: Text("Submit"),
                                      ),
                                    ],
                                  );
                                }
                            );
                          },
                          child: Text("Book Rental"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Custom Event"),
                                    content: Padding(
                                      padding:  EdgeInsets.all(8),
                                      child: TextField(
                                        controller: eventController,
                                      ),
                                    ),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            calendarModel.addEvent(username, eventController.text, today);
                                            events.addAll({
                                              today: [Event(eventController.text)]
                                            });
                                            print(events);
                                            Navigator.of(context).pop();
                                            selectedEvents.value = getEventsForDay(today);
                                          },
                                          child: Text("Submit")
                                      )
                                    ],
                                  );
                                }
                            );
                          },
                          child: Text("Custom Event"),
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
          ]
      ),
      backgroundColor: Colors.white70,
    );
  }
}