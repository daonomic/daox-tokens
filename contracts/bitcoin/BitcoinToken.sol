pragma solidity ^0.4.0;


import "../upgradeable/Upgradeable.sol";
import "../external/ExternalToken.sol";


contract BitcoinToken is Upgradeable, ExternalToken {
    string public constant name = "Bitcoin";
    string public constant symbol = "BTCT";
    uint8 public constant decimals = 8;

    address public constant admin = 0x20bf07925c8987beb981b1713420a219dcf85817;
    address public constant minter = 0x8606e71586aac6361ce1adc05ca337ac38608781;

    function checkMinter() internal {
        require(msg.sender == minter || msg.sender == admin);
    }

    function checkAdmin() internal {
        require(msg.sender == admin);
    }
}
