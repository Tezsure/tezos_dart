// All the functions are called in initState(){}
// For reference please check Debug console for outputs.
// Just run the project you must see the print statement outputs in debug console. It may take few seconds to reflect the output.

// NOTE: please get the tezos_dart package under pubspec.yaml before running the project

import 'package:flutter/material.dart';
import 'package:tezos_dart/tezos_dart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  example() async {
  //Generate mnemonic
    String mnemonic = TezosDart.generateMnemonic(); // strength is optional, by default it's 256 ==> Generates 24 words.
    print("mnemonic ===> $mnemonic");
  //mnemonic ===> 24 random words, [If strength parameter is changed the words length differs.]
  
  //Generate keys from mnemonic
    List<String> keys = await TezosDart.getKeysFromMnemonic(
        mnemonic: "luxury bulb roast timber sense stove sugar sketch goddess host meadow decorate gather salmon funny person canoe daring machine network camp moment wrong dice",
    );
    print("keys ===> $keys");
  //keys ===> [privateKey, publicKey, publicKeyHash]
  //Accessing: private key ===> keys[0] | public key ===> keys[1] | public Key Hash ===> identity[2] all of type string
  
  //Create / Unlock identity from mnemonic and passphrase.
    List<String> identity = await TezosDart.getKeysFromMnemonicAndPassphrase(
      mnemonic:
          "cannon rabbit obvious drama slogan net acoustic donor core acoustic clinic poem travel plunge winter",
      passphrase: "5tjpU0cimq",
    );
    print("identity ===> $identity");
  // identityWithMnemonic ===> [privateKey, publicKey, publicKeyHash]
  // Accessing: private key ===> identity[0] | public key ===> identity[1] | public Key Hash ===> identity[2] all of type string.

  //Sign operation with public-Key and forged operation
    List<String> signOpGrp = await TezosDart.signOperationGroup(
      privateKey: "edskRdVS5H9YCRAG8yqZkX2nUTbGcaDqjYgopkJwRuPUnYzCn3t9ZGksncTLYe33bFjq29pRhpvjQizCCzmugMGhJiXezixvdC",
      forgedOperation: "713cb068fe3ac078351727eb5c34279e22b75b0cf4dc0a8d3d599e27031db136040cb9f9da085607c05cac1ca4c62a3f3cfb8146aa9b7f631e52f877a1d363474404da8130b0b940ee",
    );
    print("signOperationGroup ===> $signOpGrp");
  //signOperationGroup ===> [hexSignature, signedOpBytes]
  //Accessing: hex signature ===> signOpGrp[0] | signed Operation bytes ===> signOpGrp[1] all of type string

  //Unlock fundraiser identity.
    List<String> identityFundraiser = await TezosDart.unlockFundraiserIdentity(
      mnemonic:
          "cannon rabbit obvious drama slogan net acoustic donor core acoustic clinic poem travel plunge winter",
      email: "lkbpoife.tobqgidu@tezos.example.org",
      passphrase: "5tjpU0cimq",
    );
    print("identityFundraiser ===> $identityFundraiser");
  //identityFundraiser ===> [privateKey, publicKey, publicKeyHash]
  //Accessing: private key ===> identityFundraiser[0] | public key ===> identityFundraiser[1] | public Key Hash ===> identityFundraiser[2] all of type string.
  }

  @override
  void initState() {
    super.initState();
    example();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              "Welcome to Tezos_dart package.\n Please check the debug console for the outputs",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
