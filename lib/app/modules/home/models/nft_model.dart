// To parse this JSON data, do
//
//     final nft = nftFromJson(jsonString);

import 'dart:convert';

Nft nftFromJson(String str) => Nft.fromJson(json.decode(str));

String nftToJson(Nft data) => json.encode(data.toJson());

class Nft {
    List<NftElement> nfts;
    String nextToken;

    Nft({
        required this.nfts,
        required this.nextToken,
    });

    factory Nft.fromJson(Map<String, dynamic> json) => Nft(
        nfts: List<NftElement>.from(json["nfts"].map((x) => NftElement.fromJson(x))),
        nextToken: json["nextToken"],
    );

    Map<String, dynamic> toJson() => {
        "nfts": List<dynamic>.from(nfts.map((x) => x.toJson())),
        "nextToken": nextToken,
    };
}

class NftElement {
    Contract contract;
    Id id;
    String title;
    String description;
    TokenUri tokenUri;
    List<Media> media;
    Metadata metadata;
    DateTime timeLastUpdated;
    ContractMetadata contractMetadata;

    NftElement({
        required this.contract,
        required this.id,
        required this.title,
        required this.description,
        required this.tokenUri,
        required this.media,
        required this.metadata,
        required this.timeLastUpdated,
        required this.contractMetadata,
    });

    factory NftElement.fromJson(Map<String, dynamic> json) => NftElement(
        contract: Contract.fromJson(json["contract"]),
        id: Id.fromJson(json["id"]),
        title: json["title"],
        description: json["description"],
        tokenUri: TokenUri.fromJson(json["tokenUri"]),
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
        metadata: Metadata.fromJson(json["metadata"]),
        timeLastUpdated: DateTime.parse(json["timeLastUpdated"]),
        contractMetadata: ContractMetadata.fromJson(json["contractMetadata"]),
    );

    Map<String, dynamic> toJson() => {
        "contract": contract.toJson(),
        "id": id.toJson(),
        "title": title,
        "description": description,
        "tokenUri": tokenUri.toJson(),
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
        "metadata": metadata.toJson(),
        "timeLastUpdated": timeLastUpdated.toIso8601String(),
        "contractMetadata": contractMetadata.toJson(),
    };
}

class Contract {
    ContractAddress address;

    Contract({
        required this.address,
    });

    factory Contract.fromJson(Map<String, dynamic> json) => Contract(
        address: contractAddressValues.map[json["address"]]!,
    );

    Map<String, dynamic> toJson() => {
        "address": contractAddressValues.reverse[address],
    };
}

enum ContractAddress {
    THE_0_X8821_BEE2_BA0_DF28761_AFFF119_D66390_D594_CD280
}

final contractAddressValues = EnumValues({
    "0x8821bee2ba0df28761afff119d66390d594cd280": ContractAddress.THE_0_X8821_BEE2_BA0_DF28761_AFFF119_D66390_D594_CD280
});

class ContractMetadata {
    Name name;
    ContractMetadataSymbol symbol;
    TokenType tokenType;
    ContractDeployer contractDeployer;
    int deployedBlockNumber;
    OpenSea openSea;

    ContractMetadata({
        required this.name,
        required this.symbol,
        required this.tokenType,
        required this.contractDeployer,
        required this.deployedBlockNumber,
        required this.openSea,
    });

    factory ContractMetadata.fromJson(Map<String, dynamic> json) => ContractMetadata(
        name: nameValues.map[json["name"]]!,
        symbol: contractMetadataSymbolValues.map[json["symbol"]]!,
        tokenType: tokenTypeValues.map[json["tokenType"]]!,
        contractDeployer: contractDeployerValues.map[json["contractDeployer"]]!,
        deployedBlockNumber: json["deployedBlockNumber"],
        openSea: OpenSea.fromJson(json["openSea"]),
    );

    Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "symbol": contractMetadataSymbolValues.reverse[symbol],
        "tokenType": tokenTypeValues.reverse[tokenType],
        "contractDeployer": contractDeployerValues.reverse[contractDeployer],
        "deployedBlockNumber": deployedBlockNumber,
        "openSea": openSea.toJson(),
    };
}

enum ContractDeployer {
    THE_0_XA45_D808_EAFDE8_B8_E6_B6_B078_FD246_E28_AD13030_E8
}

final contractDeployerValues = EnumValues({
    "0xa45d808eafde8b8e6b6b078fd246e28ad13030e8": ContractDeployer.THE_0_XA45_D808_EAFDE8_B8_E6_B6_B078_FD246_E28_AD13030_E8
});

enum Name {
    DE_GODS
}

final nameValues = EnumValues({
    "DeGods": Name.DE_GODS
});

class OpenSea {
    double floorPrice;
    Name collectionName;
    CollectionSlug collectionSlug;
    SafelistRequestStatus safelistRequestStatus;
    String imageUrl;
    String description;
    String externalUrl;
    TwitterUsername twitterUsername;
    String discordUrl;
    String bannerImageUrl;
    DateTime lastIngestedAt;

    OpenSea({
        required this.floorPrice,
        required this.collectionName,
        required this.collectionSlug,
        required this.safelistRequestStatus,
        required this.imageUrl,
        required this.description,
        required this.externalUrl,
        required this.twitterUsername,
        required this.discordUrl,
        required this.bannerImageUrl,
        required this.lastIngestedAt,
    });

    factory OpenSea.fromJson(Map<String, dynamic> json) => OpenSea(
        floorPrice: json["floorPrice"]?.toDouble(),
        collectionName: nameValues.map[json["collectionName"]]!,
        collectionSlug: collectionSlugValues.map[json["collectionSlug"]]!,
        safelistRequestStatus: safelistRequestStatusValues.map[json["safelistRequestStatus"]]!,
        imageUrl: json["imageUrl"],
        description: json["description"],
        externalUrl: json["externalUrl"],
        twitterUsername: twitterUsernameValues.map[json["twitterUsername"]]!,
        discordUrl: json["discordUrl"],
        bannerImageUrl: json["bannerImageUrl"],
        lastIngestedAt: DateTime.parse(json["lastIngestedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "floorPrice": floorPrice,
        "collectionName": nameValues.reverse[collectionName],
        "collectionSlug": collectionSlugValues.reverse[collectionSlug],
        "safelistRequestStatus": safelistRequestStatusValues.reverse[safelistRequestStatus],
        "imageUrl": imageUrl,
        "description": description,
        "externalUrl": externalUrl,
        "twitterUsername": twitterUsernameValues.reverse[twitterUsername],
        "discordUrl": discordUrl,
        "bannerImageUrl": bannerImageUrl,
        "lastIngestedAt": lastIngestedAt.toIso8601String(),
    };
}

enum CollectionSlug {
    DEGODS
}

final collectionSlugValues = EnumValues({
    "degods": CollectionSlug.DEGODS
});

enum SafelistRequestStatus {
    VERIFIED
}

final safelistRequestStatusValues = EnumValues({
    "verified": SafelistRequestStatus.VERIFIED
});

enum TwitterUsername {
    DE_GODS_NFT
}

final twitterUsernameValues = EnumValues({
    "DeGodsNFT": TwitterUsername.DE_GODS_NFT
});

enum ContractMetadataSymbol {
    DEGODS
}

final contractMetadataSymbolValues = EnumValues({
    "DEGODS": ContractMetadataSymbol.DEGODS
});

enum TokenType {
    ERC721
}

final tokenTypeValues = EnumValues({
    "ERC721": TokenType.ERC721
});

class Id {
    String tokenId;
    TokenMetadata tokenMetadata;

    Id({
        required this.tokenId,
        required this.tokenMetadata,
    });

    factory Id.fromJson(Map<String, dynamic> json) => Id(
        tokenId: json["tokenId"],
        tokenMetadata: TokenMetadata.fromJson(json["tokenMetadata"]),
    );

    Map<String, dynamic> toJson() => {
        "tokenId": tokenId,
        "tokenMetadata": tokenMetadata.toJson(),
    };
}

class TokenMetadata {
    TokenType tokenType;

    TokenMetadata({
        required this.tokenType,
    });

    factory TokenMetadata.fromJson(Map<String, dynamic> json) => TokenMetadata(
        tokenType: tokenTypeValues.map[json["tokenType"]]!,
    );

    Map<String, dynamic> toJson() => {
        "tokenType": tokenTypeValues.reverse[tokenType],
    };
}

class Media {
    String gateway;
    String thumbnail;
    String raw;
    Format format;
    int bytes;

    Media({
        required this.gateway,
        required this.thumbnail,
        required this.raw,
        required this.format,
        required this.bytes,
    });

    factory Media.fromJson(Map<String, dynamic> json) => Media(
        gateway: json["gateway"],
        thumbnail: json["thumbnail"],
        raw: json["raw"],
        format: formatValues.map[json["format"]]!,
        bytes: json["bytes"],
    );

    Map<String, dynamic> toJson() => {
        "gateway": gateway,
        "thumbnail": thumbnail,
        "raw": raw,
        "format": formatValues.reverse[format],
        "bytes": bytes,
    };
}

enum Format {
    PNG
}

final formatValues = EnumValues({
    "png": Format.PNG
});

class Metadata {
    MetadataSymbol symbol;
    String image;
    String name;
    String description;
    int rank;
    List<Attribute> attributes;
    Properties properties;
    Points points;

    Metadata({
        required this.symbol,
        required this.image,
        required this.name,
        required this.description,
        required this.rank,
        required this.attributes,
        required this.properties,
        required this.points,
    });

    factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        symbol: metadataSymbolValues.map[json["symbol"]]!,
        image: json["image"],
        name: json["name"],
        description: json["description"],
        rank: json["rank"],
        attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
        properties: Properties.fromJson(json["properties"]),
        points: Points.fromJson(json["points"]),
    );

    Map<String, dynamic> toJson() => {
        "symbol": metadataSymbolValues.reverse[symbol],
        "image": image,
        "name": name,
        "description": description,
        "rank": rank,
        "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
        "properties": properties.toJson(),
        "points": points.toJson(),
    };
}

class Attribute {
    String value;
    TraitType traitType;

    Attribute({
        required this.value,
        required this.traitType,
    });

    factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        value: json["value"],
        traitType: traitTypeValues.map[json["trait_type"]]!,
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "trait_type": traitTypeValues.reverse[traitType],
    };
}

enum TraitType {
    BACKGROUND,
    CLOTHES,
    EYES,
    HEAD,
    MOUTH,
    NECK,
    SKIN,
    SPECIALTY,
    VERSION,
    Y00_T
}

final traitTypeValues = EnumValues({
    "background": TraitType.BACKGROUND,
    "clothes": TraitType.CLOTHES,
    "eyes": TraitType.EYES,
    "head": TraitType.HEAD,
    "mouth": TraitType.MOUTH,
    "neck": TraitType.NECK,
    "skin": TraitType.SKIN,
    "specialty": TraitType.SPECIALTY,
    "version": TraitType.VERSION,
    "y00t": TraitType.Y00_T
});

class Points {
    int amount;
    int lastUpdated;

    Points({
        required this.amount,
        required this.lastUpdated,
    });

    factory Points.fromJson(Map<String, dynamic> json) => Points(
        amount: json["amount"],
        lastUpdated: json["last_updated"],
    );

    Map<String, dynamic> toJson() => {
        "amount": amount,
        "last_updated": lastUpdated,
    };
}

class Properties {
    Category category;
    List<FileElement> files;
    List<Creator> creators;

    Properties({
        required this.category,
        required this.files,
        required this.creators,
    });

    factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        category: categoryValues.map[json["category"]]!,
        files: List<FileElement>.from(json["files"].map((x) => FileElement.fromJson(x))),
        creators: List<Creator>.from(json["creators"].map((x) => Creator.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "category": categoryValues.reverse[category],
        "files": List<dynamic>.from(files.map((x) => x.toJson())),
        "creators": List<dynamic>.from(creators.map((x) => x.toJson())),
    };
}

enum Category {
    IMAGE
}

final categoryValues = EnumValues({
    "image": Category.IMAGE
});

class Creator {
    int share;
    CreatorAddress address;

    Creator({
        required this.share,
        required this.address,
    });

    factory Creator.fromJson(Map<String, dynamic> json) => Creator(
        share: json["share"],
        address: creatorAddressValues.map[json["address"]]!,
    );

    Map<String, dynamic> toJson() => {
        "share": share,
        "address": creatorAddressValues.reverse[address],
    };
}

enum CreatorAddress {
    AX_FUNI_PO7_RA_DG_PH6_GIZF4_G_ZM_LQ_FC4_M5_IPCKEE_ZFKR_P_NN
}

final creatorAddressValues = EnumValues({
    "AxFuniPo7RaDgPH6Gizf4GZmLQFc4M5ipckeeZfkrPNn": CreatorAddress.AX_FUNI_PO7_RA_DG_PH6_GIZF4_G_ZM_LQ_FC4_M5_IPCKEE_ZFKR_P_NN
});

class FileElement {
    Type type;
    String uri;

    FileElement({
        required this.type,
        required this.uri,
    });

    factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        type: typeValues.map[json["type"]]!,
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "uri": uri,
    };
}

enum Type {
    IMAGE_PNG
}

final typeValues = EnumValues({
    "image/png": Type.IMAGE_PNG
});

enum MetadataSymbol {
    DGOD
}

final metadataSymbolValues = EnumValues({
    "DGOD": MetadataSymbol.DGOD
});

class TokenUri {
    String gateway;
    String raw;

    TokenUri({
        required this.gateway,
        required this.raw,
    });

    factory TokenUri.fromJson(Map<String, dynamic> json) => TokenUri(
        gateway: json["gateway"],
        raw: json["raw"],
    );

    Map<String, dynamic> toJson() => {
        "gateway": gateway,
        "raw": raw,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
