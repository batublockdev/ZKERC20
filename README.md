# 🕵️‍♂️ zkERC20 – Private ERC20 Token with Zero-Knowledge Transfers

This project implements an ERC-20 compatible token contract that adds **privacy-preserving transfers** using Zero-Knowledge Proofs (ZKPs). Balances and transfer amounts are hidden, and users must prove correctness of transfers without revealing sensitive data.

> ⚠️ This is an advanced ERC20 implementation for educational and experimental use. Use at your own risk.

## 🌐 Live Demo & Resources


You can test the zkERC20 contract on a  website:

👉 **Website:** [https://zkerc20-demo.example.com]([https://zkerc20-demo.example.com](https://github.com/batublockdev/ZKERC20-FULLSTACK))

---

### 🎥 Demo Video

Watch a walkthrough demo of how private transfers work:

📺 **Demo Video:** [https://youtu.be/your-demo-video](https://youtu.be/HPdta0SgB8I?si=QMs_S43tV18qJPlM)

> Upload your demo to YouTube or another platform and update this link.
## 🚀 Features

- ✔️ ERC-20 compliant interface (name, symbol)
- 🔐 Zero-Knowledge Proof verification for:
  - Transfers
  - Token reception
  - Minting & burning
- 🔒 Balance hashes instead of clear balances
- 🧾 Encrypted communication via `msgTransferData`
- 📬 `signIn()` to register user public keys (for encrypted inbox/messaging)

## 📦 Contract Structure

| Function | Description |
|----------|-------------|
| `sendTransfer(...)` | Sends a ZK transfer after verifying the proof |
| `receiveTransfer(...)` | Accepts an incoming ZK transfer |
| `signIn(pubKey)` | Registers the sender’s public key |
| `getInbox(owner)` | Gets the registered public key of another user |
| `_mint(...)` | Mints tokens using a proof |
| `_burn(...)` | Burns tokens using a proof |

### 🔁 Event

```solidity
event Transfer(
  address indexed from,
  address indexed to,
  uint256 indexed msgTransation,
  bytes msgTransferData
);
```

This custom Transfer event carries an opaque `msgTransation` ID and encrypted payload `msgTransferData`.

## 🔐 Zero-Knowledge Verifier

The contract connects to a zk-SNARK verifier implementing:

```solidity
function verifyProof(
  uint[2] calldata a,
  uint[2][2] calldata b,
  uint[2] calldata c,
  uint[5] calldata input
) external view returns (bool);
```

Verifier input format:
```
[operationType, oldBalanceHash, toAddress, msgTransactionId, newBalanceHash]
```

### Operation Types

| Type     | Value |
|----------|-------|
| TRANSFER | 0     |
| RECEIVE  | 1     |

## 🧪 Usage Notes

- Each transaction must be proven valid off-chain before submitting to the contract.
- Clients must maintain the current balance hash to calculate new valid states.
- An off-chain prover (e.g., Circom + snarkjs) is required to generate valid `proof` and `public signals`.

## 🧠 Developer Notes

- Balances are stored as hashed commitments, not clear uint256 amounts.
- Uses a `pendingTransactions` mapping to prevent replay attacks.
- No standard `transferFrom` or `allowance` due to ZK privacy constraints.

## 🛠 Setup

This is a Solidity-only contract and assumes an existing ZK proof generation pipeline (e.g., using [Circom](https://docs.circom.io)).

### Interfaces

```solidity
import {ZPKInterface} from "src/interface/zkp.sol";
```

You'll need to define `ZPKInterface` that matches the proof verification contract.

## 📝 License

MIT © 2025

## 🧑‍💻 Author

Built by BATUBLOCKDEV — inspired by OpenZeppelin + zkSNARKs.
