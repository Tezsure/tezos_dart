# Flutter_tezos

A flutter package to use Tezos functionalities.<br />

### What is Tezos?

Tezos is a decentralized ledger that makes use of blockchain technology. Like Ethereum, Tezos is designed to make use of smart contracts.

### Use of the package

Flutter_Tezos package contains all the function that is required to build tezos application.

### Getting Started

Check out the `example` directory for a sample app using flutter_tezos

### Import using

```
import 'package:tezos_dart/tezos_dart.dart';
```

### Samples

```
// Generates mnemonic
    String nmemonic = Tezos.generateMnemonic();
    print("nmemonic ===> $nmemonic");

// nmemonic ===> 24 random words, [If strength parameter is changed the words length differs.]
// strength is optional, by default it's 256 ==> Generates 24 words.
```
```
//Generates Keys from Mnemonic and passphrase
    List<String> keys = await Tezos.getKeysFromMnemonicAndPassphrase(
        mnemonic: "Your Mnemonic"
    );
    print("keys ===> $keys");

// keys ===> [privateKey, publicKey, publicKeyHash].
// keys list can be accessed by keys[0] | keys[1] | keys[2] respectively
```
```
//Sign Operation with publicKey and forgedOperation
    List<String> signOperationGroup = await Tezos.signOperationGroup(
        publicKey: "edskRdV..... .XezixvdA",
        forgedOperation: "713cb068fe.... .b940ee"
    );
    print("signOperationGroup ===> $signOperationGroup");

//signOperationGroup ===> [hexSignature, signedOpBytes]
// signOperationGroup list can be accessed by signOperationGroup[0] | signOperationGroup[1] | signOperationGroup[2] respectively
```
```
//Unlock Fundraiser Identity.
    List<String> identityFundraiser = await Tezos.unlockFundraiserIdentity(
      mnemonic: "your mnemonic",
      email: "test@example.com",
      password: "pa$$w0rd"
    );
    print("identityFundraiser ===> $identityFundraiser");

// identityFundraiser ===> [privateKey, publicKey, publicKeyHash]
// identityFundraiser list can be accessed by identityFundraiser[0] | identityFundraiser[1] |  identityFundraiser[2] all of type string.
```
```
//Unlock Identity With Mnemonic.
    List<String> identityWithMnemonic = await Tezos.unlockIdentityWithMnemonic(
      mnemonic: "your mnemonic",
      password: "pa$$w0rd"
    );
    print("identityWithMnemonic ===> $identityWithMnemonic");

// identityWithMnemonic ===> [privateKey, publicKey, publicKeyHash]
// identityWithMnemonic list can be accessed by identityWithMnemonic[0] | identityWithMnemonic[1] | identityWithMnemonic[2] all of type string.
```

---
**NOTE**

Use stable version of flutter to avoid  package conflicts.

---
