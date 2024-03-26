import 'package:flutter/material.dart';

import '../../../../../widgets/default_text.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool _currentvalue_1 = false;
  bool _currentvalue_2 = false;
  bool _currentvalue_3 = false;

  bool _currentvalue_4 = false;

  bool _currentvalue_5 = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DefaultText(text: 'Your Job Search Alert'),
            Switch(
                value: _currentvalue_1,
                onChanged: (val) {
                  setState(() {
                    _currentvalue_1 = val;
                  });
                })
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DefaultText(text: 'Job Application Update'),
            Switch(
                value: _currentvalue_2,
                onChanged: (val) {
                  setState(() {
                    _currentvalue_2 = val;
                  });
                })
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DefaultText(text: 'Job Application Reminders'),
            Switch(
                value: _currentvalue_3,
                onChanged: (val) {
                  setState(() {
                    _currentvalue_3 = val;
                  });
                })
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DefaultText(text: 'Jobs You May Be Interested In'),
            Switch(
                value: _currentvalue_4,
                onChanged: (val) {
                  setState(() {
                    _currentvalue_4 = val;
                  });
                })
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DefaultText(text: 'Job Seeker Updates'),
            Switch(
              value: _currentvalue_5,
              onChanged: (val) {
                setState(() {
                  _currentvalue_5 = val;
                });
              },
            )
          ],
        ),
        const Divider(),
      ],
    );
  }
}

class OthersNotification extends StatefulWidget {
  const OthersNotification({super.key});

  @override
  State<OthersNotification> createState() => _OthersNotificationState();
}

class _OthersNotificationState extends State<OthersNotification> {
  bool _currentvalue_1 = false;
  bool _currentvalue_2 = false;
  bool _currentvalue_3 = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DefaultText(text: 'Your Job Search Alert'),
            Switch(
                value: _currentvalue_1,
                onChanged: (val) {
                  setState(() {
                    _currentvalue_1 = val;
                  });
                })
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DefaultText(text: 'Job Application Update'),
            Switch(
                value: _currentvalue_2,
                onChanged: (val) {
                  setState(() {
                    _currentvalue_2 = val;
                  });
                })
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DefaultText(text: 'Job Application Reminders'),
            Switch(
                value: _currentvalue_3,
                onChanged: (val) {
                  setState(() {
                    _currentvalue_3 = val;
                  });
                })
          ],
        ),
        const Divider(),
      ],
    );
  }
}
