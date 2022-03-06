import 'package:flutter/material.dart';
import 'package:important_widgets/Accordion/AccordionWidget.dart';

class Accordion extends StatelessWidget {
  const Accordion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Accordion'),
      ),
      body: Column(
        children: [
          AccordionWidget(
            title: "Normal distribution",
            content: "In probability theory, the normal distribution is a very common continuous probability distribution. Normal distributions are important in statistics and are often used in the natural and social sciences to represent real-valued random variables whose distributions are not known. A random variable with a Gaussian distribution is said to be normally distributed and is called a normal deviate.",
          )
        ],
      ),
    );
  }
}
