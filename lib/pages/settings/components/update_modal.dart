import 'package:flutter/material.dart';

class UpdateModal extends StatefulWidget {
  final String initialValue;
  const UpdateModal({Key key, this.initialValue = ''}) : super(key: key);

  @override
  _UpdateModalState createState() => _UpdateModalState();
}

class _UpdateModalState extends State<UpdateModal> {
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initialValue);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TextFormField(
          controller: controller,
        ),
        FlatButton(
          child: Text('save'),
          onPressed: () => Navigator.of(context).pop(controller.text),
        )
      ],
    );
  }
}
