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
  //Text from UI as Nmemonic
  String mnemonicFromInputText =
      "luxury bulb roast timber sense stove sugar sketch goddess host meadow decorate gather salmon funny person canoe daring machine network camp moment wrong dice";

  //Input for Sign Operation Group function
  String privateKey =
      "edskRdVS5H9YCRAG8yqZkX2nUTbGcaDqjYgopkJwRuPUnYzCn3t9ZGksncTLYe33bFjq29pRhpvjQizCCzmugMGhJiXezixvdC";
  String forgedOperation =
      "713cb068fe3ac078351727eb5c34279e22b75b0cf4dc0a8d3d599e27031db136040cb9f9da085607c05cac1ca4c62a3f3cfb8146aa9b7f631e52f877a1d363474404da8130b0b940ee";

  generateMnemonic() {
    String mnemonic = TezosDart
        .generateMnemonic(); // strength is optional, by default it's 256 ==> Generates 24 words.
    print("mnemonic ===> $mnemonic");
    // nmemonic ===> 24 random words, [If strength parameter is changed the words length differs.]
  }

  generateKeys() async {
    //Generate Keys from Mnemonic and passphrase
    List<String> keys = await TezosDart.getKeysFromMnemonic(
      mnemonic: mnemonicFromInputText,
    );
    print("keys ===> $keys");
    //keys ===> [privateKey, publicKey, publicKeyHash]
    //Accessing: private key ===> keys[0] | public key ===> keys[1] | public Key Hash ===> identity[2] all of type string

    //Sign Operation with publicKey and forgedOperation
    List<String> signOperationGroup = await TezosDart.signOperationGroup(
      privateKey: privateKey,
      forgedOperation: forgedOperation,
    );
    print("signOperationGroup ===> $signOperationGroup");
    //signOperationGroup ===> [hexSignature, signedOpBytes]
    //Accessing: hex signature ===> signOperationGroup[0] | signed Operation bytes ===> signOperationGroup[1] all of type string
  }

  unlockIdentity() async {
    //Unlock Fundraiser Identity.
    List<String> identityFundraiser = await TezosDart.unlockFundraiserIdentity(
      mnemonic:
          "cannon rabbit obvious drama slogan net acoustic donor core acoustic clinic poem travel plunge winter",
      email: "lkbpoife.tobqgidu@tezos.example.org",
      password: "5tjpU0cimq",
    );
    print("identityFundraiser ===> $identityFundraiser");
    //identityFundraiser ===> [privateKey, publicKey, publicKeyHash]
    //Accessing: private key ===> identityFundraiser[0] | public key ===> identityFundraiser[1] | public Key Hash ===> identityFundraiser[2] all of type string.

    //Unlock Identity With Mnemonic.
    List<String> identityWithMnemonic =
        await TezosDart.unlockIdentityWithMnemonicAndPassword(
      mnemonic:
          "cannon rabbit obvious drama slogan net acoustic donor core acoustic clinic poem travel plunge winter",
      password: "5tjpU0cimq",
    );
    print("identityWithMnemonic ===> $identityWithMnemonic");
    // identityWithMnemonic ===> [privateKey, publicKey, publicKeyHash]
    // Accessing: private key ===> identityWithMnemonic[0] | public key ===> identityWithMnemonic[1] | public Key Hash ===> identityWithMnemonic[2] all of type string.
  }

  @override
  void initState() {
    super.initState();
    generateMnemonic();
    generateKeys();
    unlockIdentity();
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
