import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  const TodoList(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              CustomSlidableAction(
                  onPressed: deleteFunction,
                  borderRadius: BorderRadius.circular(15),
                  backgroundColor: Colors.red,
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.delete,
                          size: 25,
                        ),
                        SizedBox(width: 3),
                        Text("Delete",
                            style: TextStyle(
                              fontSize: 18,
                            ))
                      ]))
            ],
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                Checkbox(
                    value: taskCompleted,
                    onChanged: onChanged,
                    checkColor: Colors.black,
                    activeColor: Colors.white,
                    side: const BorderSide(color: Colors.white)),
                Text(
                  taskName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: Colors.white,
                    decorationThickness: 2,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
