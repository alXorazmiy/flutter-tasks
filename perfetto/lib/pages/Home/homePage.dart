


import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
	const HomePage({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Padding(
				padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
				child: Row(
					mainAxisAlignment: MainAxisAlignment.spaceBetween,
					children: [
							Container(

							child: Image.asset("assets/icons/perfetto.png", height: 50,),
						),
						Container(
							child: Icon(Icons.shopping_bag_outlined),
						)
					],
				),
			),
		);
	}
}