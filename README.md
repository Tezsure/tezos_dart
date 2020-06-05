# Tezos_dart

A flutter package to use Tezos functionalities.Tezos_dart package contains all the function that is required to build tezos application.

### What is Tezos?

Tezos is a decentralized ledger that makes use of blockchain technology. Like Ethereum, Tezos is designed to make use of smart contracts.

### Getting started

Check out the `example` directory for a sample app using Tezos_dart.

### Import using

```
import 'package:tezos_dart/tezos_dart.dart';
```

### Samples

* Generate mnemonic

```
String mnemonic = Tezos.generateMnemonic(); // sustain laugh capital drop brush artist ahead blossom bread spring motor other mountain thumb volcano engine shed guilt famous loud force hundred same brave
```

* Generate keys from mnemonic and passphrase

```
List<String> keys = await Tezos.getKeysFromMnemonicAndPassphrase(mnemonic: "Your Mnemonic");

/* [edskRdVS5H9YCRAG8yqZkX2nUTbGcaDqjYgopkJwRuPUnYzCn3t9ZGksncTLYe33bFjq29pRhpvjQizCCzmugMGhJiXezixvdC,
   edpkuLog552hecagkykJ3fTvop6grTMhfZY4TWbvchDWdYyxCHcrQL,
   tz1g85oYHLFKDpNfDHPeBUbi3S7pUsgCB28q] */
```

* Sign operation with public Key and forged Operation

```
List<String> signOperationGroup = await Tezos.signOperationGroup(
    publicKey: "edskRdV..... .XezixvdA",
    forgedOperation: "713cb068fe.... .b940ee");

/* [edsigtrBnsjSngfP6LULUDeo84eJVks4LWReYrZBUjKQNJjhVsG7bksqZ7CKnRePMceMe3vgRHHbyd2CqRdC8iEAK5NcyNn4iEB,
    713cb068fe3ac078351727eb5c34279e22b75b0cf4dc0a8d3d599e27031db136040cb9f9da085607c05cac1ca4c62a3f3cfb8146aa9b7f631e52f877a1d363474404da8130b0b940ee8c7ce5bf2968c1204c1c4b2ba98bcbd08fc4ad3cad706d39ac55e4dd61fde5a8496840ce2d377389a4ca7842bf613d3f096fda819c26e43adfb0cad1336a430d] */
```

* Unlock fundraiser identity.

```
List<String> identityFundraiser = await Tezos.unlockFundraiserIdentity(
    mnemonic: "your mnemonic",
    email: "test@example.com",
    password: "pa$$w0rd");

/* [edskRzNDm2dpqe2yd5zYAw1vmjr8sAwMubfcXajxdCNNr4Ud39BoppeqMAzoCPmb14mzfXRhjtydQjCbqU2VzWrsq6JP4D9GVb,
    edpkvASxrq16v5Awxpz4XPTA2d6QFaCL8expPrPNcVgVbWxT84Kdw2,
    tz1hhkSbaocSWm3wawZUuUdX57L3maSH16Pv] */
```

* Unlock identity With Mnemonic.

```
List<String> identityWithMnemonic = await Tezos.unlockIdentityWithMnemonic(
      mnemonic: "your mnemonic",
      password: "pa$$w0rd");

/* [edskS9kdgvCWDiZL1yP1qH5xLCWYHQub4qibfU8DQZjv7wX7BskxSsL6h9j1yDYJ7Y9jDbMULNmfLhw9vBJPqDw3TeVHHd34w7,
    edpkuRr9yHChSt2MTWHCeHe2JM3zJZxHgj8vEANwb8WENrZbLxYzbx,
    tz1hTe7oxtQr67dg6dWfTX3V44oPY7pzkFZS] */
```

---
**NOTE**
Use stable version of flutter to avoid  package conflicts.

---
