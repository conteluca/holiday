import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // if you need this
        side: BorderSide(
          color: Theme.of(context).colorScheme.surfaceVariant,
          // color: Colors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      margin: const EdgeInsets.only(left: 12,right: 12),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
             Image.network(
              'https://reamakeup.com/wp-content/uploads/2016/09/alex-box-e1474388863424.jpg'),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10,0,10,12),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    // Perform some action
                  },
                  child: const Text('ACTION 1'),
                ),
                TextButton(
                  onPressed: () {
                    // Perform some action
                  },
                  child: const Text('ACTION 2'),
                ),
                const Spacer(),
                IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Theme.of(context).colorScheme.secondary,),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
