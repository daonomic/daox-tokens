## Tokens

Some token contracts

### Contents

- [TokenImpl](contracts/standard/TokenImpl.sol) - ERC20 implementation
- [ReadOnlyTokenImpl](contracts/standard/ReadOnlyTokenImpl.sol) - read-only version of ERC20 (so we can pause all operations)
- [NotifyingTokenImpl](contracts/standard/NotifyingTokenImpl.sol) - ERC20 + transferAndCall functionality (notifies [TokenReceiver](contracts/standard/TokenReceiver.sol) about token transfers)
- [ExternalTokenImpl](contracts/external/ExternalTokenImpl.sol) - NotifyingToken, but with mint/burn functions (ExternalToken represents some external value. It usually can be traded/burned 1:1 to real value)

### Disclaimer

Standard contracts based on zeppelin-solidity tokens. Added some other tokens + added tests.