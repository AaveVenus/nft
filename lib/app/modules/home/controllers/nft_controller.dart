import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/nft_model.dart';

class NFTController {
  Future<Nft> fetchNFTs() async {
    final String apiUrl =
        'https://eth-mainnet.g.alchemy.com/nft/v2/_TNRwp0BIHul_A9QGO-nJtKyY3LhUBkl/getNFTsForCollection?collectionSlug=degods&withMetadata=true';

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {'accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return Nft.fromJson(jsonData);
    } else {
      throw Exception('Failed to load NFTs');
    }
  }
}
