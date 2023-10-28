import 'package:flutter/material.dart';
import '../models/nft_model.dart';

class NFTDetailScreen extends StatelessWidget {
  final NftElement nftElement;

  NFTDetailScreen({required this.nftElement});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nftElement.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: ${nftElement.title}'),
            Text('Description: ${nftElement.description}'),
            // Display other properties as needed
          ],
        ),
      ),
    );
  }
}
