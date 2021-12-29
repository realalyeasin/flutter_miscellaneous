import 'package:flutter/material.dart';

class StepByStep extends StatefulWidget {
  const StepByStep({Key? key}) : super(key: key);

  @override
  _StepByStepState createState() => _StepByStepState();
}

class _StepByStepState extends State<StepByStep> {
  int _currentStep = 0;
  bool _isVerticalStepper = true;

  _stepTapped(int step) {
    setState(() => _currentStep = step);
  }

  _stepContinue() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  _stepCancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Stepper'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            SwitchListTile(
                tileColor: Colors.teal.shade100,
                title: Text('Vertical Stepper'),
                subtitle: Text('Vertical/Horizontal'),
                value: _isVerticalStepper,
                onChanged: (_) {
                  setState(() {
                    _isVerticalStepper = !_isVerticalStepper;
                  });
                }),
            Divider(
              height: 25,
              thickness: 2,
            ),
            Expanded(
                child: Stepper(
              type: _isVerticalStepper
                  ? StepperType.vertical
                  : StepperType.horizontal,
              physics: ScrollPhysics(),
              currentStep: _currentStep,
              onStepTapped: (step) => _stepTapped(step),
              onStepContinue: _stepContinue,
              onStepCancel: _stepCancel,
              steps: [
                Step(
                    title: Text('Name'),
                    content: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Name'),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled),
                Step(
                    title: Text('Phone'),
                    content: Column(
                      children: [
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Your Mobile Number'),
                        )
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 1
                        ? StepState.complete
                        : StepState.disabled),
                Step(
                    title: Text('Verify'),
                    content: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Enter Code'),
                        )
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 2
                        ? StepState.complete
                        : StepState.disabled)
              ],
            ))
          ],
        ),
      ),
    );
  }
}
