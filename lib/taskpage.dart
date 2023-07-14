import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => TaskPageState();
}

class TaskPageState extends State<TaskPage> {
  DateTime dateTime = DateTime(2022, 06, 09, 7, 00);
  List<String> tasks = [
    'This is where you will add any new task for day',
    'huihiuhuhiuhihuih'
  ];

  List<Todo> todos = [
    Todo(label: 'shopping', isDone: false),
    Todo(label: 'workout', isDone: false),
    Todo(label: 'coding', isDone: false),
  ];
  int selectedIndex = -1;
  TextEditingController tasksTEC = TextEditingController();

  void clearText() {
    tasksTEC.clear();
  }

  showModule(String hours, String minutes) {
    return showModalBottomSheet<void>(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        backgroundColor: Colors.white,
        context: context,
        isScrollControlled: true,
        builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: TextField(
                        controller: tasksTEC,
                        autofocus: true,
                        selectionHeightStyle: BoxHeightStyle.tight,
                        selectionWidthStyle: BoxWidthStyle.tight,
                        decoration: InputDecoration(
                            disabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            hintText: "add add your tasks here",
                            suffixIcon: IconButton(
                                onPressed: clearText,
                                icon: const Icon(
                                  Icons.clear,
                                  color: Colors.grey,
                                ))),
                      ),
                    ),
                    Row(
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          child: Container(
                            height: 35,
                            width: 180,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey)),
                            child: TextButton.icon(
                                style: const ButtonStyle(),
                                onPressed: pickDateTime,
                                icon: const Icon(
                                  Icons.event_outlined,
                                  size: 12,
                                  color: Colors.green,
                                ),
                                label: Text(
                                  '${dateTime.year}/${dateTime.month}/${dateTime.day} $hours:$minutes',
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 12,
                                  ),
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          height: 35,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey)),
                          child: TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.inbox_outlined,
                                size: 15,
                                color: Colors.blue,
                              ),
                              label: const Text(
                                'Inbox',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w400),
                              )),
                        ),
                      ],
                    ),
                    Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: Row(
                        children: [
                          IconButton(
                            color: Colors.grey,
                            onPressed: () {},
                            icon: const Icon(Icons.sell_outlined),
                          ),
                          IconButton(
                            color: Colors.grey,
                            onPressed: () {},
                            icon: const Icon(Icons.flag_outlined),
                          ),
                          IconButton(
                            color: Colors.grey,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.alarm_outlined,
                            ),
                          ),
                          IconButton(
                            color: Colors.grey,
                            onPressed: () {},
                            icon: const Icon(Icons.mode_comment_outlined),
                          ),
                          const SizedBox(
                            width: 160,
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                            child: IconButton(
                              iconSize: 15,
                              color: Colors.white,
                              onPressed: () {
                                if (selectedIndex == -1) {
                                  var newTasks = tasksTEC.text;
                                  Todo newtodo =
                                      Todo(label: newTasks, isDone: false);
                                  setState(() {
                                    todos.add(newtodo);
                                  });
                                  tasksTEC.clear();
                                } else {
                                  setState(() {
                                    todos[selectedIndex].label = tasksTEC.text;
                                    selectedIndex = -1;
                                  });

                                  tasksTEC.clear();
                                }
                              },
                              icon: const Icon(Icons.arrow_upward),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Todays'),
        backgroundColor: Colors.redAccent.shade700,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            iconSize: 28,
          ),
          const SizedBox(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
            iconSize: 28,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: todos.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 18,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                    shape: const CircleBorder(),
                                    activeColor: Colors.green,
                                    value: todos[index].isDone,
                                    onChanged: (value) {
                                      var deleteTask = todos[index];
                                      setState(() {
                                        todos[index].isDone =
                                            !todos[index].isDone;
                                        todos.remove(deleteTask);
                                      });
                                    }),
                                GestureDetector(
                                  onTap: () {
                                    tasksTEC.text = todos[index].label;
                                    selectedIndex = index;
                                    showModule(hours, minutes);

                                    setState(() {});
                                  },
                                  child: Text(
                                    todos[index].label,
                                    style: TextStyle(
                                        fontSize: 13,
                                        decoration: todos[index].isDone
                                            ? TextDecoration.lineThrough
                                            : null),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 15,
                                ),
                                TextButton.icon(
                                    style: const ButtonStyle(),
                                    onPressed: pickDateTime,
                                    icon: const Icon(
                                      Icons.event_outlined,
                                      size: 12,
                                      color: Colors.green,
                                    ),
                                    label: Text(
                                      '${dateTime.year}/${dateTime.month}/${dateTime.day} $hours:$minutes',
                                      style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 12,
                                      ),
                                    )),
                                IconButton(
                                  iconSize: 12,
                                  onPressed: () {},
                                  icon: const Icon(Icons.alarm_outlined),
                                ),
                                IconButton(
                                    iconSize: 12,
                                    onPressed: () {},
                                    icon: const Icon(
                                        Icons.mode_comment_outlined)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: index == -1
                          ? const Border() // This will create no border for the first item
                          : Border(
                              top: BorderSide(
                                  width: 1, color: Colors.grey.shade800)),
                    ));
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FloatingActionButton(
                  onPressed: () => showModule(hours, minutes),
                  shape: const CircleBorder(),
                  backgroundColor: Colors.red.shade900,
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Future pickDateTime() async {
    DateTime? date = await pickDate();
    if (date == null) return; // pressed 'CANCEL'
    TimeOfDay? time = await pickTime();
    if (time == null) return; // pressed 'CANCEL'

    final dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    setState(() => this.dateTime = dateTime);
  }

  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
      );

  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute));
}

class Todo {
  String label;
  bool isDone;

  Todo({required this.label, required this.isDone});
}
