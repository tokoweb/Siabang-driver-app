import 'package:flutter/material.dart';
import 'package:siabang_driver_app/widgets/appbar/appbar_primary.dart';
import 'package:siabang_driver_app/widgets/task/item_order.dart';
import 'package:siabang_driver_app/widgets/task/task_page.dart';

class ListOrderPage extends StatelessWidget {
  const ListOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    List items = [
      STATUSORDER.NEW,
      STATUSORDER.NEWOUTOFTOWN,
      STATUSORDER.DELIVERPACKAGES,
    ];

    return Scaffold(
      appBar: AppBarPrimary(
        title: 'List orderan',
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ItemOrder(
              statusOrder: items[index],
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}
