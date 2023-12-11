import 'package:flutter/material.dart';

import 'package:pill_cart/models/medicines_model.dart';

class DrugCard extends StatelessWidget {
  DrugCard({
    required this.medicine,
    super.key,
  });
  Medicines medicine;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: const Color.fromARGB(255, 210, 210, 210),
              blurRadius: 4,
              offset: Offset(0, 4))
        ],
      ),
      child: Container(
        height: 100,
        width: 50,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    medicine.tradeName.toString(),
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 35, 168, 173)),
                  ),
                  Text(
                    medicine.genericName.name.toString(),
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 35, 168, 173)),
                  ),
                  Text(medicine.amount.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 35, 168, 173))),
                ]),
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              Text("${medicine.price.toString()} \$",
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 35, 168, 173))),
              Icon(
                Icons.favorite,
                color: Colors.transparent,
              ),
            ])
          ],
        ),
      ),
    );
  }
}
