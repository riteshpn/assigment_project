import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({Key? key}) : super(key: key);

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  bool isOpen = false;
  String selectOption = 'Renter/Owner';
  List<String> abc = [
    'Renter',
    'Owner',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isOpen = !isOpen;
                });
              },
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: isOpen ? 60 : 0,

                      top: -10, // Adjust position as needed
                      child: Text(
                        'User Type',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    Positioned(
                      left: isOpen ? 70 : 70,
                      top: 15, // Adjust position as needed
                      child: Text(
                        selectOption,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    Positioned(
                      right: 0, // Positioned the arrow to the right edge
                      top: 0,
                      bottom: 0, // Positioned the arrow slightly lower
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            color: Colors.blue),
                        child: Icon(
                          isOpen
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          size: 50, // Adjust the size of the arrow
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (isOpen)
              Container(
                height: 150, // Adjust the height as needed
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                ),
                child: ListView.builder(
                  itemCount: abc.length,
                  itemBuilder: (context, index) {
                    final item = abc[index];
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectOption = item;
                          isOpen = false;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        color: selectOption == item
                            ? Colors.blue
                            : Colors.grey.shade300,
                        child: Text(item),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
