import 'package:flutter/material.dart';
import 'package:nft/app/modules/home/views/detail_view.dart';
import '../controllers/nft_controller.dart';
import '../models/nft_model.dart';

class NFTScreen extends StatefulWidget {
  @override
  _NFTScreenState createState() => _NFTScreenState();
}

class _NFTScreenState extends State<NFTScreen> {
  final NFTController _nftController = NFTController();
  late Future<Nft> _nftFuture;

  @override
  void initState() {
    super.initState();
    _nftFuture = _nftController.fetchNFTs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NFT Collection'),
      ),
      body: FutureBuilder<Nft>(
        future: _nftFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load data'));
          } else if (snapshot.hasData) {
            List<NftElement> nftList = snapshot.data!.nfts;
            return ListView.builder(
              itemCount: nftList.length,
              itemBuilder: (context, index) {
                NftElement nft = nftList[index];
                return ListTile(
                  leading: Image.network(nft.metadata.image),
                  title: Text(nft.title),
                  subtitle: Text(nft.description),
                  onTap: () {
                    _navigateToDetailScreen(context, nft);
                  },
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }

  void _navigateToDetailScreen(BuildContext context, NftElement nftElement) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NFTDetailScreen(nftElement: nftElement),
      ),
    );
  }
}

