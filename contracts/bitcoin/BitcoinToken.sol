pragma solidity ^0.4.0;


import "../external/ExternalToken.sol";


contract BitcoinToken is ExternalToken {
    function checkMinter() internal {
        require(msg.sender == 0xc66d094ed928f7840a6b0d373c1cd825c97e3c7c);
    }
}
