pragma solidity ^0.4.0;


import "../../contracts/external/ExternalToken.sol";


contract ExternalTokenMock is ExternalToken {
    address public minter;

    function ExternalTokenMock() {
        minter = msg.sender;
    }

    function checkMinter() internal {
        require(msg.sender == minter);
    }
}
