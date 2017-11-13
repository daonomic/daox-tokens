pragma solidity ^0.4.0;


import "../../contracts-upgradeable/contracts/upgradeable/Upgradeable.sol";
import "../external/ExternalToken.sol";


contract BitcoinToken is Upgradeable, ExternalToken {
    string public constant name = "Bitcoin";
    string public constant symbol = "BTCT";
    uint8 public constant decimals = 8;

    address public constant admin = 0x20bF07925c8987BeB981b1713420a219dCF85817;
    address public constant minter = 0x8606E71586AAc6361ce1aDC05Ca337ac38608781;

    function checkMinter() internal {
        require(msg.sender == minter || msg.sender == admin);
    }

    function checkAdmin() internal {
        require(msg.sender == admin);
    }
}
